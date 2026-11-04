#' Flag outlying monthly vaccination counts
#'
#' For every unit of the chosen level and every vaccine, the monthly number of
#' vaccinated children is compared only with the other months of that same unit.
#' Five standard statistical rules are computed side by side and every
#' statistic is returned, so the reason a month is flagged can be audited.
#' Only base R is used.
#'
#' Monthly counts are the differences between consecutive cumulative totals
#' from \code{\link{vaccine_sums}}, so the columns summed for each vaccine are
#' exactly those used for the coverage computation.
#'
#' The rules, all applied to the unit's own monthly series:
#' \itemize{
#'   \item \strong{iqr}: Tukey fences, Q1 - k*IQR and Q3 + k*IQR (k = 1.5).
#'   \item \strong{adjbox}: adjusted boxplot of Hubert and Vandervieren (2008). The fences are
#'     skewed with the medcouple, which suits count data that are not symmetric.
#'   \item \strong{zscore}: leave-one-out z-score. The month is compared with the mean and SD of the
#'     unit's other months, so an extreme value cannot inflate the SD and hide itself (|z| > 3).
#'   \item \strong{mad}: modified z-score of Iglewicz and Hoaglin, 0.6745 * (x - median) / MAD (|M| > 3.5).
#'   \item \strong{gesd}: generalized extreme Studentized deviate test of Rosner (1983), which finds
#'     up to several outliers while controlling the type I error (alpha = 0.05).
#' }
#' A month is flagged by a rule when it is outside that rule's limits and at least \code{min_diff}
#' away from the unit's median (so tiny fluctuations in small units are ignored). The final
#' \code{flagged} column is TRUE when at least \code{min_methods} rules agree.
#'
#' @param data Dataframe, the DHIS2 immunization dataframe (as passed to \code{vaccine_sums}).
#' @param level The aggregation level of interest, specified as in \code{vaccine_sums}:
#'   Country, Province, District, Aire, Fosa, Antenne, or a combination such as c(Antenne, District).
#' @param vaccine Character vector of vaccine names (see \code{vaccine_sums}). NULL (default) uses
#'   every vaccine the package knows.
#' @param months Integer vector of months to consider. Months in which no unit reports any dose
#'   of the vaccine are ignored. Default 1:12.
#' @param min_methods Number of rules (out of 5) that must flag a month for \code{flagged} to be TRUE.
#'   Default 2.
#' @param flagged_only If TRUE (default) only flagged months are returned; if FALSE every
#'   unit-vaccine-month is returned with its statistics.
#' @param k_iqr Multiplier of the IQR fences. Default 1.5.
#' @param z_cut Cutoff of the leave-one-out z-score. Default 3.
#' @param mad_cut Cutoff of the modified z-score. Default 3.5.
#' @param alpha Significance level of the GESD test. Default 0.05.
#' @param min_diff Minimum absolute difference from the unit's median for a rule to flag a month.
#'   Default 20.
#' @param min_months Minimum number of reporting months needed to assess a unit. Default 5.
#' @param accent Passed to \code{vaccine_sums}. Default FALSE (data already cleaned).
#'
#' @return A dataframe with one row per unit, vaccine and month containing: the unit column(s),
#'   vaccine, month, value (monthly count), the series statistics (n, median, mean_other,
#'   sd_other, q1, q3, iqr, mad, medcouple), ratio_median (value / median), each rule's
#'   statistic and limits (iqr_lower, iqr_upper, adjbox_lower, adjbox_upper, z_loo, mod_z,
#'   gesd_stat, gesd_crit), one logical flag per rule (flag_iqr, flag_adjbox, flag_zscore, flag_mad,
#'   flag_gesd), n_flags, flagged and direction ("high", "low" or NA). Sorted by n_flags and
#'   relative distance from the median.
#' @export
#'
#' @references
#' Hubert M, Vandervieren E (2008). An adjusted boxplot for skewed distributions.
#' Computational Statistics and Data Analysis 52:5186-5201.
#'
#' Iglewicz B, Hoaglin D (1993). How to detect and handle outliers. ASQC Quality Press.
#'
#' Rosner B (1983). Percentage points for a generalized ESD many-outlier procedure.
#' Technometrics 25:165-172.
#'
#' @examples
#' \dontrun{
#' flag_outliers(ri, District, vaccine = c("DTC1", "Pneumo13"), months = 1:9)
#' flag_outliers(ri, c(Antenne, District), months = 1:9, min_methods = 3)
#' flag_outliers(ri, District, vaccine = "BCG", flagged_only = FALSE)
#' }
flag_outliers <- function(data, level, vaccine = NULL, months = 1:12,
                          min_methods = 2, flagged_only = TRUE,
                          k_iqr = 1.5, z_cut = 3, mad_cut = 3.5, alpha = 0.05,
                          min_diff = 20, min_months = 5, accent = FALSE) {
  all_vacc <- c(
    "BCG", "DTC1", "DTC2", "DTC3", "VPO0", "VPO1", "VPO2", "VPO3", "VAA",
    "VAR1", "VAR2", "VPI1", "VPI2", "Pneumo13", "Pneumo13_2", "Rota1",
    "Rota2", "Rota3", "VAP1", "VAP2", "VAP3", "VAP4", "TD2"
  )
  unit <- c(
    "Country" = "orgunitlevel1", "Province" = "orgunitlevel2", "District" = "orgunitlevel3",
    "Aire" = "orgunitlevel4", "Fosa" = "orgunitlevel5", "Antenne" = "orgunitlevel6"
  )

  level_expr <- substitute(level)
  level_cols <- eval(level_expr, stats::setNames(as.list(unit), names(unit)), parent.frame())

  months <- sort(unique(as.integer(months)))
  stopifnot(
    is.data.frame(data), all(level_cols %in% unit), all(months %in% 1:12),
    is.numeric(min_methods), min_methods >= 1, min_methods <= 5,
    is.logical(flagged_only), length(flagged_only) == 1,
    is.numeric(k_iqr), k_iqr > 0, is.numeric(z_cut), z_cut > 0,
    is.numeric(mad_cut), mad_cut > 0, is.numeric(alpha), alpha > 0, alpha < 1,
    is.numeric(min_diff), min_diff >= 0, is.numeric(min_months), min_months >= 4
  )
  if (is.null(vaccine)) vaccine <- all_vacc
  stopifnot(is.character(vaccine), all(vaccine %in% all_vacc))

  results <- list()

  for (v in vaccine) {
    cumul <- tryCatch(
      lapply(months, function(m) {
        s <- eval(bquote(vaccine_sums(data, .(as.name(v)), .(level_expr), .(m), accent = .(accent))))
        s$.month <- m
        s
      }),
      error = function(e) {
        message("Skipping ", v, ": ", conditionMessage(e))
        NULL
      }
    )
    if (is.null(cumul)) next

    wide <- Reduce(function(a, b) merge(a, b, by = level_cols, all = TRUE), lapply(cumul, function(s) {
      out <- s[, c(level_cols, v)]
      names(out)[names(out) == v] <- paste0("m", s$.month[1])
      out
    }))
    mat <- as.matrix(wide[, paste0("m", months), drop = FALSE])
    mat[is.na(mat)] <- 0

    monthly <- mat
    if (ncol(mat) > 1) monthly[, -1] <- mat[, -1, drop = FALSE] - mat[, -ncol(mat), drop = FALSE]
    colnames(monthly) <- months

    reporting <- colSums(monthly) > 0
    if (sum(reporting) < min_months) next
    monthly <- monthly[, reporting, drop = FALSE]

    per_unit <- lapply(seq_len(nrow(monthly)), function(i) {
      x <- monthly[i, ]
      st <- .outlier_stats(x, k_iqr, z_cut, mad_cut, alpha)
      st$month <- as.integer(names(x))
      st$value <- unname(x)
      st$unit_row <- i
      st
    })
    per_unit <- do.call(rbind, per_unit)
    per_unit$vaccine <- v
    results[[length(results) + 1]] <- cbind(wide[per_unit$unit_row, level_cols, drop = FALSE], per_unit)
  }

  cols <- c(
    level_cols, "vaccine", "month", "value", "n", "median", "mean_other", "sd_other",
    "q1", "q3", "iqr", "mad", "medcouple", "ratio_median", "iqr_lower", "iqr_upper",
    "adjbox_lower", "adjbox_upper", "z_loo", "mod_z", "gesd_stat", "gesd_crit",
    "flag_iqr", "flag_adjbox", "flag_zscore", "flag_mad", "flag_gesd",
    "n_flags", "flagged", "direction"
  )

  if (length(results) == 0) {
    out <- as.data.frame(matrix(NA, 0, length(cols)))
    names(out) <- cols
    return(out)
  }

  out <- do.call(rbind, results)
  far <- abs(out$value - out$median) >= min_diff
  flag_cols <- c("flag_iqr", "flag_adjbox", "flag_zscore", "flag_mad", "flag_gesd")
  for (f in flag_cols) out[[f]] <- out[[f]] & far
  out$n_flags <- rowSums(out[, flag_cols])
  out$flagged <- out$n_flags >= min_methods
  out$direction <- ifelse(out$n_flags > 0, ifelse(out$value > out$median, "high", "low"), NA_character_)
  out$ratio_median <- round(out$value / out$median, 3)

  if (flagged_only) out <- out[out$flagged, ]
  out <- out[order(-out$n_flags, -abs(out$value - out$median) / pmax(out$median, 1)), cols]
  rownames(out) <- NULL
  out
}

.outlier_stats <- function(x, k_iqr, z_cut, mad_cut, alpha) {
  n <- length(x)
  med <- stats::median(x)
  q <- stats::quantile(x, c(0.25, 0.75), names = FALSE, type = 7)
  iqr <- q[2] - q[1]
  madv <- stats::mad(x, constant = 1)

  s <- sum(x)
  m_other <- (s - x) / (n - 1)
  var_other <- pmax((sum(x^2) - x^2 - (n - 1) * m_other^2) / (n - 2), 0)
  sd_other <- sqrt(var_other)
  z_loo <- (x - m_other) / sd_other
  z_loo[sd_other == 0] <- ifelse(x[sd_other == 0] == m_other[sd_other == 0], 0, Inf * sign(x - m_other)[sd_other == 0])

  mod_z <- if (madv > 0) {
    0.6745 * (x - med) / madv
  } else {
    meanad <- mean(abs(x - med))
    if (meanad > 0) (x - med) / (1.253314 * meanad) else rep(0, n)
  }

  mc <- .medcouple(x)
  if (mc >= 0) {
    adj_l <- q[1] - k_iqr * exp(-4 * mc) * iqr
    adj_u <- q[2] + k_iqr * exp(3 * mc) * iqr
  } else {
    adj_l <- q[1] - k_iqr * exp(-3 * mc) * iqr
    adj_u <- q[2] + k_iqr * exp(4 * mc) * iqr
  }
  iqr_l <- q[1] - k_iqr * iqr
  iqr_u <- q[2] + k_iqr * iqr

  g <- .gesd(x, alpha)

  data.frame(
    n = n, median = med, mean_other = round(m_other, 2), sd_other = round(sd_other, 2),
    q1 = q[1], q3 = q[2], iqr = iqr, mad = madv, medcouple = round(mc, 3),
    ratio_median = NA_real_,
    iqr_lower = iqr_l, iqr_upper = iqr_u,
    adjbox_lower = round(adj_l, 2), adjbox_upper = round(adj_u, 2),
    z_loo = round(z_loo, 2), mod_z = round(mod_z, 2),
    gesd_stat = round(g$stat, 2), gesd_crit = round(g$crit, 2),
    flag_iqr = x < iqr_l | x > iqr_u,
    flag_adjbox = x < adj_l | x > adj_u,
    flag_zscore = abs(z_loo) > z_cut,
    flag_mad = abs(mod_z) > mad_cut,
    flag_gesd = g$flag,
    row.names = NULL
  )
}

.medcouple <- function(x) {
  med <- stats::median(x)
  lo <- x[x <= med]
  hi <- x[x >= med]
  h <- outer(hi, lo, function(xj, xi) ifelse(xj - xi == 0, NA, ((xj - med) - (med - xi)) / (xj - xi)))
  h <- h[!is.na(h)]
  if (length(h) == 0) 0 else stats::median(h)
}

.gesd <- function(x, alpha) {
  n <- length(x)
  r <- max(1, floor(n / 3))
  idx <- seq_len(n)
  removed <- integer(0)
  stat <- crit <- rep(NA_real_, r)
  keep <- idx
  for (i in seq_len(r)) {
    xs <- x[keep]
    sdv <- stats::sd(xs)
    if (!is.finite(sdv) || sdv == 0) break
    dev <- abs(xs - mean(xs))
    j <- which.max(dev)
    stat[i] <- dev[j] / sdv
    p <- 1 - alpha / (2 * (n - i + 1))
    t <- stats::qt(p, n - i - 1)
    crit[i] <- (n - i) * t / sqrt((n - i - 1 + t^2) * (n - i + 1))
    removed <- c(removed, keep[j])
    keep <- keep[-j]
  }
  k <- which(stat > crit)
  k <- if (length(k)) max(k) else 0
  flag <- rep(FALSE, n)
  if (k > 0) flag[removed[seq_len(k)]] <- TRUE
  st <- crit_v <- rep(NA_real_, n)
  st[removed] <- stat[seq_along(removed)]
  crit_v[removed] <- crit[seq_along(removed)]
  list(flag = flag, stat = st, crit = crit_v)
}

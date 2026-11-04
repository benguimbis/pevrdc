# Flag outlying monthly vaccination counts

For every unit of the chosen level and every vaccine, the monthly number
of vaccinated children is compared only with the other months of that
same unit. Five standard statistical rules are computed side by side and
every statistic is returned, so the reason a month is flagged can be
audited. Only base R is used.

## Usage

``` r
flag_outliers(
  data,
  level,
  vaccine = NULL,
  months = 1:12,
  min_methods = 2,
  flagged_only = TRUE,
  k_iqr = 1.5,
  z_cut = 3,
  mad_cut = 3.5,
  alpha = 0.05,
  min_diff = 20,
  min_months = 5,
  accent = FALSE
)
```

## Arguments

- data:

  Dataframe, the DHIS2 immunization dataframe (as passed to
  `vaccine_sums`).

- level:

  The aggregation level of interest, specified as in `vaccine_sums`:
  Country, Province, District, Aire, Fosa, Antenne, or a combination
  such as c(Antenne, District).

- vaccine:

  Character vector of vaccine names (see `vaccine_sums`). NULL (default)
  uses every vaccine the package knows.

- months:

  Integer vector of months to consider. Months in which no unit reports
  any dose of the vaccine are ignored. Default 1:12.

- min_methods:

  Number of rules (out of 5) that must flag a month for `flagged` to be
  TRUE. Default 2.

- flagged_only:

  If TRUE (default) only flagged months are returned; if FALSE every
  unit-vaccine-month is returned with its statistics.

- k_iqr:

  Multiplier of the IQR fences. Default 1.5.

- z_cut:

  Cutoff of the leave-one-out z-score. Default 3.

- mad_cut:

  Cutoff of the modified z-score. Default 3.5.

- alpha:

  Significance level of the GESD test. Default 0.05.

- min_diff:

  Minimum absolute difference from the unit's median for a rule to flag
  a month. Default 20.

- min_months:

  Minimum number of reporting months needed to assess a unit. Default 5.

- accent:

  Passed to `vaccine_sums`. Default FALSE (data already cleaned).

## Value

A dataframe with one row per unit, vaccine and month containing: the
unit column(s), vaccine, month, value (monthly count), the series
statistics (n, median, mean_other, sd_other, q1, q3, iqr, mad,
medcouple), ratio_median (value / median), each rule's statistic and
limits (iqr_lower, iqr_upper, adjbox_lower, adjbox_upper, z_loo, mod_z,
gesd_stat, gesd_crit), one logical flag per rule (flag_iqr, flag_adjbox,
flag_zscore, flag_mad, flag_gesd), n_flags, flagged and direction
("high", "low" or NA). Sorted by n_flags and relative distance from the
median.

## Details

Monthly counts are the differences between consecutive cumulative totals
from [`vaccine_sums`](vaccine_sums.md), so the columns summed for each
vaccine are exactly those used for the coverage computation.

The rules, all applied to the unit's own monthly series:

- **iqr**: Tukey fences, Q1 - k*IQR and Q3 + k*IQR (k = 1.5).

- **adjbox**: adjusted boxplot of Hubert and Vandervieren (2008). The
  fences are skewed with the medcouple, which suits count data that are
  not symmetric.

- **zscore**: leave-one-out z-score. The month is compared with the mean
  and SD of the unit's other months, so an extreme value cannot inflate
  the SD and hide itself (\|z\| \> 3).

- **mad**: modified z-score of Iglewicz and Hoaglin, 0.6745 \* (x -
  median) / MAD (\|M\| \> 3.5).

- **gesd**: generalized extreme Studentized deviate test of Rosner
  (1983), which finds up to several outliers while controlling the type
  I error (alpha = 0.05).

A month is flagged by a rule when it is outside that rule's limits and
at least `min_diff` away from the unit's median (so tiny fluctuations in
small units are ignored). The final `flagged` column is TRUE when at
least `min_methods` rules agree.

## References

Hubert M, Vandervieren E (2008). An adjusted boxplot for skewed
distributions. Computational Statistics and Data Analysis 52:5186-5201.

Iglewicz B, Hoaglin D (1993). How to detect and handle outliers. ASQC
Quality Press.

Rosner B (1983). Percentage points for a generalized ESD many-outlier
procedure. Technometrics 25:165-172.

## Examples

``` r
if (FALSE) { # \dontrun{
flag_outliers(ri, District, vaccine = c("DTC1", "Pneumo13"), months = 1:9)
flag_outliers(ri, c(Antenne, District), months = 1:9, min_methods = 3)
flag_outliers(ri, District, vaccine = "BCG", flagged_only = FALSE)
} # }
```

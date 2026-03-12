# Core of clean_dhis_names not exported.#'

Core of clean_dhis_names not exported.#'

## Usage

``` r
clean_dhis_names_q(
  data,
  column,
  has_prefix = 2,
  suffix = "(Province|Zone de Sant[eé]|Aire de Sant[eé]|Centre de Sant[eé])"
)
```

## Arguments

- data:

  The dataset containing variables to be cleaned

- column:

  The column containing values to be cleaned espcially organization
  levels of DRC EPI

- has_prefix:

  An integer specifying the number of characters of the prefix to be
  removed. Set to 0 if no prefix

- suffix:

  A character value that specifies the suffix to be removed

## Value

A dataframe with cleaned names

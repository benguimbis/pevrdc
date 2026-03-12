# This is function is wrapper around is_outbreak to identify districts with an outbreak.

This is function is wrapper around is_outbreak to identify districts
with an outbreak.

## Usage

``` r
district_epi(
  df,
  district,
  wk,
  status,
  nwk = 4,
  sorted = FALSE,
  pre_yr = FALSE,
  year = NULL
)
```

## Arguments

- df:

  A dataset with a weekly number of cases or a logical indication of a
  case detected

- district:

  A variable containing districts names

- wk:

  A numeric variable specifying the successive week numbers

- status:

  A logical or numeric variable with either indication of case recorded
  or the number of cases

- nwk:

  A numeric value that specifies the window frame for the assessment of
  consecutive logical values of x

- sorted:

  A logical value to specify whether the dataset is ordered per week and
  district

- pre_yr:

  A logical value to specify whether dataset contains data from the
  previous year

- year:

  A numeric variable containing the year of the data

## Value

A dataframe with an additional logical variable epi_status

## Examples

``` r
df <- data.frame(district = c(rep("A", 4), rep("B", 5)),
                 week = c(1:4, 1:5), 
                 status = c(TRUE, FALSE, TRUE, TRUE, FALSE, TRUE, TRUE, TRUE, FALSE))

district_epi(df, district, week, status, 3, sorted = TRUE)
#>   district week status epi_status
#> 1        A    1   TRUE      FALSE
#> 2        A    2  FALSE      FALSE
#> 3        A    3   TRUE      FALSE
#> 4        A    4   TRUE      FALSE
#> 5        B    1  FALSE      FALSE
#> 6        B    2   TRUE      FALSE
#> 7        B    3   TRUE      FALSE
#> 8        B    4   TRUE       TRUE
#> 9        B    5  FALSE      FALSE
```

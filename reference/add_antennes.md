# A function that adds DRC antennes to a dataset not having them

A function that adds DRC antennes to a dataset not having them

## Usage

``` r
add_antennes(data, dhis = TRUE, zone_sante = NULL, rename_antenne = TRUE)
```

## Arguments

- data:

  A dataset with no variable containing antennes, usually DHIS 2
  datasets

- dhis:

  A boolean to indicate whether the dataset is from the DHIS 2, set to
  TRUE as default

- zone_sante:

  A variable with health zones names if data are not from DHIS 2, set to
  NULL as default

- rename_antenne:

  A logical to indicate renaming antennes following DHIS 2 standard

## Value

A dataframe with a variable with antennes

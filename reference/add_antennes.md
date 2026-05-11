# A function that adds DRC antennes to a dataset not having them

A function that adds DRC antennes to a dataset not having them

## Usage

``` r
add_antennes(data, province, zone, rename_antenne = TRUE)
```

## Arguments

- data:

  A dataset with no variable containing antennes, usually DHIS 2
  datasets

- province:

  A Column with province

- zone:

  A column with health zones

- rename_antenne:

  A logical to indicate renaming antennes following DHIS 2 standard

## Value

A dataframe with a variable with antennes

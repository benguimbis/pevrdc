# A function that adds DRC antennes to a dataset not having them

A function that adds DRC antennes to a dataset not having them

## Usage

``` r
add_antennes(data, col, rename_antenne = TRUE)
```

## Arguments

- data:

  A dataset with no variable containing antennes, usually DHIS 2
  datasets

- col:

  A vector of variables containing the keys for joining dataset

- rename_antenne:

  A logical to indicate renaming antennes following DHIS 2 standard

## Value

A dataframe with a variable with antennes

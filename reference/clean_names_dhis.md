# A function that removes DRC's DHIS 2 prefixes and suffixes from a vector

A function that removes DRC's DHIS 2 prefixes and suffixes from a vector

## Usage

``` r
clean_names_dhis(
  x,
  has_prefix = 2,
  suffix = "(Province|Zone de Sant[eé]|Aire de Sant[eé]|Centre de Sant[eé])"
)
```

## Arguments

- x:

  A character vector to be cleaned especially organization levels of DRC
  EPI. More convenient to use within other functions

- has_prefix:

  An integer specifying the number of characters of the prefix to be
  removed. Set to 0 if no prefix

- suffix:

  A character value that specifies the suffix to be removed

## Value

A character vector

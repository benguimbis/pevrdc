# This is function returns TRUE after n successive TRUE and FALSE otherwise. This is a convenient function to classify areas with outbreak following consecutive positive cases of diseases recorded within n weeks.

This is function returns TRUE after n successive TRUE and FALSE
otherwise. This is a convenient function to classify areas with outbreak
following consecutive positive cases of diseases recorded within n
weeks.

## Usage

``` r
is_outbreak(x, nwk = 4)
```

## Arguments

- x:

  an ordered logical vector

- nwk:

  a numeric value that specifies the window frame for the assessment of
  consecutive logical values of x

## Value

A logical vecor of similar length with x

## Examples

``` r
is_outbreak(c(TRUE, FALSE, TRUE, TRUE, TRUE, TRUE, TRUE), 4)
#> [1] FALSE FALSE FALSE  TRUE  TRUE  TRUE  TRUE
```

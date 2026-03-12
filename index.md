# pevrdc

The goal of hpdRDC is to standardize the analysis of DRC EPI DHIS 2
immunization and surveillance data with now external dependency. The
goal is to improve reproducibility, facilitate auditing and ease the
data cleaning and analysis workflows.

## Installation

You can install the development version of hpdRDC from
[GitHub](https://github.com/) with:

``` r
# install.packages("pak")
pak::pak("benguimbis/hpdDRC")
```

## Documentation

Full documentation website on: <https://benguimbis.github.io/hpdDRC>

## Documentation

Full documentation website on: <https://benguimbis.github.io/pevrdc>

## Example

Here we show to compute the the target administrative population for
march 2026 by province.

``` r
library(pevrdc)
## Computing the aggregated target on march

pops <- pop2026
#> Error:
#> ! object 'pop2026' not found
population <- agg_pop(naissance_mois_admin, orgunitlevel2, month = 3, pops = pops)
#> Error in `agg_pop()`:
#> ! could not find function "agg_pop"
head(population)
#> Error:
#> ! object 'population' not found
```

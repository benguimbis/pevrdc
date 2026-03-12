---
output: github_document
---

<!-- README.md is generated from README.Rmd. Please edit that file -->



# pevrdc

<!-- badges: start -->
[![R-CMD-check](https://github.com/benguimbis/pevrdc/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/benguimbis/pevrdc/actions/workflows/R-CMD-check.yaml)
[![Codecov test coverage](https://codecov.io/gh/benguimbis/pevrdc/graph/badge.svg)](https://app.codecov.io/gh/benguimbis/pevrdc)
<!-- badges: end -->

The goal of pevrdc is to standardize the analysis of DRC EPI DHIS 2 immunization and surveillance data with now external dependency. The goal is to improve reproducibility, facilitate auditing and ease the data cleaning and analysis workflows.

## Installation

You can install the development version of hpdRDC from [GitHub](https://github.com/) with:

``` r
# install.packages("pak")
pak::pak("benguimbis/pevrdc")
```


Full documentation website on: https://benguimbis.github.io/pevrdc

## Documentation

Full documentation website on: https://benguimbis.github.io/pevrdc

## Example

Here we show to compute the the target administrative population for march 2026 by province.


``` r
library(pevrdc)
## Computing the aggregated target on march

pops <- pop2026
population <- agg_pop(naissance_mois_admin, orgunitlevel2, month = 3, pops = pops)
head(population)
#>              orgunitlevel2 naissance_mois_admin
#> 1     bu Bas Uele Province             16712.25
#> 2     eq Equateur Province             29853.50
#> 3 hk Haut Katanga Province             93271.75
#> 4  hl Haut Lomami Province             44739.00
#> 5    hu Haut Uele Province             25622.00
#> 6        it Ituri Province             69074.25
```


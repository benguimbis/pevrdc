# Core of agg_pop not exported. A function that aggregates the immunization population tallies of DRC per organization level using built-in 2025 population dataset

Core of agg_pop not exported. A function that aggregates the
immunization population tallies of DRC per organization level using
built-in 2025 population dataset

## Usage

``` r
agg_pop_q(var, group, month = 1, pops)
```

## Arguments

- var:

  Column name of the variable containing the population numbers. For the
  pops dataset monthly targets immunization use naissance_mois_ajust or
  survivant_mois_ajust. For surveillance use population_totale

- group:

  The organization level orgunitlevel1 for country, orgunitlevel2 for
  province, orgunitlevel3 for district and orgunitlevel6 for antennes

- month:

  A numeric value between 1 and 12 to specify the number of months for
  immunization targets

- pops:

  A dataframe with population data

## Value

A dataframe of aggregated populations

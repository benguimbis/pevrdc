# A dataset containing the date VAP was introduced in each DRC health district

A dataset containing the date VAP was introduced in each DRC health
district

## Usage

``` r
vap_intro
```

## Format

A data frame with 519 observations and 5 variables, one per health
district of pop2026:

- orgunitlevel2:

  character; Province

- orgunitlevel3:

  character; Zone de santé (health district)

- in_pyramid:

  logical; TRUE if the district is listed in the VAP pyramid of 441
  districts

- intro_year:

  integer; year of introduction, NA if not yet introduced or not in the
  pyramid

- intro_month:

  integer; month of introduction (1 to 12), NA if not yet introduced or
  not in the pyramid

## Source

Programme Élargie de Vaccination de RDC, intro_vap.xlsx.

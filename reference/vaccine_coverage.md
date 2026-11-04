# A function to compute the cummulative monthly vaccine coverage per organization levels using DHIS2 exported data

A function to compute the cummulative monthly vaccine coverage per
organization levels using DHIS2 exported data

## Usage

``` r
vaccine_coverage(
  data,
  vaccine,
  level,
  month = 1,
  pops,
  vap_intro = pevrdc::vap_intro,
  year = 2026
)
```

## Arguments

- data:

  Dataframe, usually the DHIS2 immunization dataframe already aggregated

- vaccine:

  Column name of the vaccine of interest. Should be one of the
  following: BCG, DTC1, DTC3, VPO0, VAA, VAR1, VAR2, VPI1, VPI2,
  Pneumo13, Rota1, Rota2, Rota3, VAP1, VAP2, VAP3, VAP4, DTC2,
  Pneumo13_2, VPI 2, VPO1, VPO2, VPO3 & TD2

- level:

  The column name or vector of column names of the aggregation level of
  interest. Should be any of Country, Province, District or Antenne

- month:

  An integer between 1 to 12 that specifies the cummulative period of
  months to aggregate date

- pops:

  An aggregated dataset of target populations.

- vap_intro:

  A dataframe of VAP introduction dates per health district, as the
  built-in vap_intro dataset. Used only for VAP1 to VAP4: the target
  population of a district only counts the months since it introduced
  the vaccine, and districts that have not introduced it have no target
  (coverage NA). Set to NULL to use all months for all districts.

- year:

  The calendar year of the data, used to compare with the introduction
  dates. Default 2026.

## Value

A dataframe with vaccines coverage For VAP1 to VAP4 the target
population columns are prefixed with vap\_ (vap_survivants_mois_admin,
vap_survivant_mois_ajust) because they only cover the months since
introduction, so they differ from the targets of the other vaccines and
tables can be merged by key without losing rows.

## Examples

``` r
datafile <- system.file(c("vacc_data.RDS", "pop2025.RDS"), package = "pevrdc")

vacc <- readRDS(datafile[1])
pops <- readRDS(datafile[2])
vacc_tots <- vaccine_sums(vacc, DTC1, District, 2)
#> Warning: OS reports request to set locale to "English_United States.utf8" cannot be honored
vaccine_coverage(vacc_tots, DTC1, District, month = 2, pops = pops)
#> Warning: 96 unit(s) have no matching target population and were dropped from the coverage table. Check that names in the data and in pops are spelled identically.
#> [1] orgunitlevel3         DTC1                  survivants_mois_admin
#> [4] survivant_mois_ajust  DTC1_admin            DTC1_ajust           
#> [7] zero_dose_admin       zero_dose_ajust      
#> <0 rows> (or 0-length row.names)
```

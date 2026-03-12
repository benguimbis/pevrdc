# Package index

## All functions

- [`add_antennes()`](add_antennes.md) : A function that adds DRC
  antennes to a dataset not having them
- [`agg_pop()`](agg_pop.md) : A function that aggregates the
  immunization population tallies of DRC per organization level using
  built-in 2025 population dataset
- [`agg_pop_2()`](agg_pop_2.md) : A version of agg_pop that does not use
  NSE, more convenient to use within other functions. Variables
  arguments are characters
- [`agg_pop_q()`](agg_pop_q.md) : Core of agg_pop not exported. A
  function that aggregates the immunization population tallies of DRC
  per organization level using built-in 2025 population dataset
- [`antennes`](antennes.md) : A dataset containing DRC's health antennas
  and health districts
- [`clean_dhis_names()`](clean_dhis_names.md) : A function that removes
  DRC DHIS prefixes and suffixes
- [`clean_dhis_names_q()`](clean_dhis_names_q.md) : Core of
  clean_dhis_names not exported.#'
- [`clean_names_dhis()`](clean_names_dhis.md) : A function that removes
  DRC's DHIS 2 prefixes and suffixes from a vector
- [`correct_accent()`](correct_accent.md) : A function to remove
  accented characters from all the character values of a data frame
- [`district_epi()`](district_epi.md) : This is function is wrapper
  around is_outbreak to identify districts with an outbreak.
- [`is_outbreak()`](is_outbreak.md) : This is function returns TRUE
  after n successive TRUE and FALSE otherwise. This is a convenient
  function to classify areas with outbreak following consecutive
  positive cases of diseases recorded within n weeks.
- [`pop2024`](pop2024.md) : A dataset containing DRC's 2024 target
  immunization populations at health districts levels
- [`pop2025`](pop2025.md) : A dataset containing DRC's 2025 target
  immunization populations at health districts levels
- [`pop2026`](pop2026.md) : A dataset containing DRC's 2024 target
  immunization populations at health districts levels
- [`shape`](shape.md) : A dataset with the DRC shapefile at health zone
  level, necessitate the sf package to load.
- [`vacc_data`](vacc_data.md) : A dataset with simulated DHIS 2
  imuundata containing DRC's health antennas and health districts Please
  refer to DHIS 2 for a complete codebook of the data
- [`vaccine_coverage()`](vaccine_coverage.md) : A function to compute
  the cummulative monthly vaccine coverage per organization levels using
  DHIS2 exported data
- [`vaccine_sums()`](vaccine_sums.md) : A function to compute the
  cummulative monthly tally of vaccinated per organization levels using
  DHIS2 exported data

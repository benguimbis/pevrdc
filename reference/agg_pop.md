# A function that aggregates the immunization population tallies of DRC per organization level using built-in 2025 population dataset

A function that aggregates the immunization population tallies of DRC
per organization level using built-in 2025 population dataset

## Usage

``` r
agg_pop(var, group, month = 1, pops)
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

## Examples

``` r
datafile <- system.file(c("pop2025.RDS"), package = "pevrdc")

pops <- readRDS(datafile)
agg_pop(naissance_mois_admin, orgunitlevel2, month = 8, pops = pops)
#>                 orgunitlevel2 naissance_mois_admin
#> 1        bu Bas Uele Province             49533.33
#> 2        eq Equateur Province             87612.67
#> 3    hk Haut Katanga Province            227892.67
#> 4     hl Haut Lomami Province            132626.67
#> 5       hu Haut Uele Province             68438.00
#> 6           it Ituri Province            202062.67
#> 7   kc Kongo Central Province            130718.00
#> 8  ke Kasai Oriental Province            165015.33
#> 9          kg Kwango Province             85132.67
#> 10          kl Kwilu Province            175540.00
#> 11       kn Kinshasa Province            334113.33
#> 12  kr Kasai Central Province            164660.67
#> 13          ks Kasai Province            166636.67
#> 14        ll Lualaba Province             93192.67
#> 15         lm Lomami Province            132126.67
#> 16      md Maindombe Province             66951.33
#> 17        mg Mongala Province             91015.33
#> 18        mn Maniema Province             91296.67
#> 19      nk Nord Kivu Province            296851.33
#> 20    nu Nord Ubangi Province             60582.67
#> 21       sk Sud Kivu Province            246043.33
#> 22        sn Sankuru Province             79016.00
#> 23     su Sud Ubangi Province            104972.00
#> 24     tn Tanganyika Province            100740.00
#> 25         tp Tshopo Province            126011.33
#> 26        tu Tshuapa Province             68955.33

agg_pop_2("naissance_mois_admin", "orgunitlevel2", month = 8, pops = pops)
#>                 orgunitlevel2 naissance_mois_admin
#> 1        bu Bas Uele Province             49533.33
#> 2        eq Equateur Province             87612.67
#> 3    hk Haut Katanga Province            227892.67
#> 4     hl Haut Lomami Province            132626.67
#> 5       hu Haut Uele Province             68438.00
#> 6           it Ituri Province            202062.67
#> 7   kc Kongo Central Province            130718.00
#> 8  ke Kasai Oriental Province            165015.33
#> 9          kg Kwango Province             85132.67
#> 10          kl Kwilu Province            175540.00
#> 11       kn Kinshasa Province            334113.33
#> 12  kr Kasai Central Province            164660.67
#> 13          ks Kasai Province            166636.67
#> 14        ll Lualaba Province             93192.67
#> 15         lm Lomami Province            132126.67
#> 16      md Maindombe Province             66951.33
#> 17        mg Mongala Province             91015.33
#> 18        mn Maniema Province             91296.67
#> 19      nk Nord Kivu Province            296851.33
#> 20    nu Nord Ubangi Province             60582.67
#> 21       sk Sud Kivu Province            246043.33
#> 22        sn Sankuru Province             79016.00
#> 23     su Sud Ubangi Province            104972.00
#> 24     tn Tanganyika Province            100740.00
#> 25         tp Tshopo Province            126011.33
#> 26        tu Tshuapa Province             68955.33
```

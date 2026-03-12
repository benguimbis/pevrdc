# A function to compute the cummulative monthly tally of vaccinated per organization levels using DHIS2 exported data

A function to compute the cummulative monthly tally of vaccinated per
organization levels using DHIS2 exported data

## Usage

``` r
vaccine_sums(data, vaccine, level, month = 1, accent = TRUE)
```

## Arguments

- data:

  Dataframe, usually the DHIS2 immunization dataframe

- vaccine:

  Column name of the vaccine of interest. Should be one of the
  following: BCG, DTC1, DTC3, VPO0, VAA, VAR1, VAR2, VPI1, VPI2,
  Pneumo13, Rota1, Rota2, Rota3, VAP1, VAP2, VAP3, VAP4, DTC2,
  Pneumo13_2, VPI 2, VPO1, VPO2, VPO3 & TD2

- level:

  The column name or vector of column names of the aggregation level of
  interest. Should be any of Country, Province, District, or Antenne

- month:

  An integer between 1 to 12 that specifies the cummulative period of
  months to aggregate date

- accent:

  A logical to specify whether the dataset values contains accented
  characters. Set to TRUE as default

## Value

A dataframe with aggregated sums of vaccinated between

## Examples

``` r
datafile <- system.file(c("vacc_data.RDS"), package = "pevrdc")

vacc <- readRDS(datafile)
vaccine_sums(vacc, DTC1, District, 2)
#> Warning: OS reports request to set locale to "English_United States.utf8" cannot be honored
#>                       orgunitlevel3 DTC1
#> 1            bu Ango Zone de Santee   22
#> 2           bu Monga Zone de Santee   33
#> 3       eq Basankusu Zone de Santee    0
#> 4         eq Ingende Zone de Santee    0
#> 5         eq Makanza Zone de Santee   36
#> 6        eq Mbandaka Zone de Santee    0
#> 7          eq Ntondo Zone de Santee    0
#> 8          hk Kafubu Zone de Santee    0
#> 9        hk Kampemba Zone de Santee    0
#> 10       hk Kapolowe Zone de Santee    0
#> 11         hk Katuba Zone de Santee    0
#> 12          hk Kenya Zone de Santee   27
#> 13        hk Kipushi Zone de Santee   15
#> 14        hk Kisanga Zone de Santee   24
#> 15         hk Likasi Zone de Santee    0
#> 16       hk Mumbunda Zone de Santee   18
#> 17          hk Panda Zone de Santee    0
#> 18         hk Ruashi Zone de Santee    9
#> 19    hk Tshamilemba Zone de Santee    0
#> 20         hl Bukama Zone de Santee    0
#> 21        hu Gombari Zone de Santee   74
#> 22          hu Isiro Zone de Santee    0
#> 23        it Biringi Zone de Santee   29
#> 24         it Drodro Zone de Santee   19
#> 25        it Kambala Zone de Santee    0
#> 26          it Rethy Zone de Santee    0
#> 27    kc Boko Kivulu Zone de Santee   22
#> 28          kc Kangu Zone de Santee    6
#> 29        kc Kibunzi Zone de Santee    0
#> 30   kc Kwilu Ngongo Zone de Santee    0
#> 31         kc Lukula Zone de Santee    0
#> 32  kc Mbanza Ngungu Zone de Santee    0
#> 33         kc Muanda Zone de Santee    0
#> 34         kc Nzanza Zone de Santee   16
#> 35        ke Bipemba Zone de Santee   67
#> 36        ke Dibindi Zone de Santee   63
#> 37     ke Tshishimbi Zone de Santee   60
#> 38          kg Kenge Zone de Santee    0
#> 39        kg Kitenda Zone de Santee   23
#> 40     kl Kikwit Sud Zone de Santee   33
#> 41   kl Masi Manimba Zone de Santee    0
#> 42        kl Mosango Zone de Santee   12
#> 43    kl Pay Kongila Zone de Santee    0
#> 44    kn Binza Ozone Zone de Santee    0
#> 45      kn Kingasani Zone de Santee    0
#> 46        kn Kisenso Zone de Santee  125
#> 47         kn Limete Zone de Santee    0
#> 48       kn Lingwala Zone de Santee    0
#> 49       kn Masina 1 Zone de Santee  250
#> 50         kn Matete Zone de Santee    0
#> 51 kn Mont Ngafula 1 Zone de Santee    0
#> 52    kn Ngiri Ngiri Zone de Santee    0
#> 53    kr Bena Tshadi Zone de Santee    0
#> 54          kr Demba Zone de Santee   38
#> 55        kr Kananga Zone de Santee    0
#> 56         kr Mutoto Zone de Santee    0
#> 57       kr Tshikaji Zone de Santee    0
#> 58       ks Kamwesha Zone de Santee    0
#> 59         ks Mikope Zone de Santee    0
#> 60  ks Ndjoko Mpunda Zone de Santee    0
#> 61       ks Tshikapa Zone de Santee   58
#> 62        ll Kapanga Zone de Santee   17
#> 63         ll Manika Zone de Santee    0
#> 64        lm Kalenda Zone de Santee   46
#> 65         lm Kamana Zone de Santee    0
#> 66    lm Kanda Kanda Zone de Santee    0
#> 67         md Bosobe Zone de Santee    0
#> 68          md Mimia Zone de Santee    0
#> 69          md Nioki Zone de Santee   24
#> 70       mg Bosondjo Zone de Santee   40
#> 71          mg Bumba Zone de Santee    0
#> 72      mg Yamongili Zone de Santee   19
#> 73       mn Alunguli Zone de Santee    0
#> 74      mn Kabambare Zone de Santee    0
#> 75        mn Kibombo Zone de Santee   23
#> 76        mn Obokote Zone de Santee   20
#> 77           nk Beni Zone de Santee    0
#> 78          nk Binza Zone de Santee    0
#> 79        nk Butembo Zone de Santee    0
#> 80           nk Goma Zone de Santee    0
#> 81      nk Karisimbi Zone de Santee    0
#> 82         nk Lubero Zone de Santee   26
#> 83      sk Bunyakiri Zone de Santee   25
#> 84           sk Fizi Zone de Santee    0
#> 85         sk Ibanda Zone de Santee   25
#> 86          sk Idjwi Zone de Santee   31
#> 87        sk Itombwe Zone de Santee    0
#> 88  sk Kimbi Lulenge Zone de Santee  212
#> 89         sk Minova Zone de Santee    0
#> 90      sk Nyantende Zone de Santee   32
#> 91          sk Uvira Zone de Santee    0
#> 92   sn Katako Kombe Zone de Santee   10
#> 93           sn Kole Zone de Santee   96
#> 94         tp Basoko Zone de Santee    0
#> 95         tu Boende Zone de Santee   19
#> 96          tu Djolu Zone de Santee   30
```

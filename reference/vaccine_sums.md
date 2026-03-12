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
#>                      orgunitlevel3 DTC1
#> 1            bu Ango Zone de Sante   22
#> 2           bu Monga Zone de Sante   33
#> 3       eq Basankusu Zone de Sante    0
#> 4         eq Ingende Zone de Sante    0
#> 5         eq Makanza Zone de Sante   36
#> 6        eq Mbandaka Zone de Sante    0
#> 7          eq Ntondo Zone de Sante    0
#> 8          hk Kafubu Zone de Sante    0
#> 9        hk Kampemba Zone de Sante    0
#> 10       hk Kapolowe Zone de Sante    0
#> 11         hk Katuba Zone de Sante    0
#> 12          hk Kenya Zone de Sante   27
#> 13        hk Kipushi Zone de Sante   15
#> 14        hk Kisanga Zone de Sante   24
#> 15         hk Likasi Zone de Sante    0
#> 16       hk Mumbunda Zone de Sante   18
#> 17          hk Panda Zone de Sante    0
#> 18         hk Ruashi Zone de Sante    9
#> 19    hk Tshamilemba Zone de Sante    0
#> 20         hl Bukama Zone de Sante    0
#> 21        hu Gombari Zone de Sante   74
#> 22          hu Isiro Zone de Sante    0
#> 23        it Biringi Zone de Sante   29
#> 24         it Drodro Zone de Sante   19
#> 25        it Kambala Zone de Sante    0
#> 26          it Rethy Zone de Sante    0
#> 27    kc Boko Kivulu Zone de Sante   22
#> 28          kc Kangu Zone de Sante    6
#> 29        kc Kibunzi Zone de Sante    0
#> 30   kc Kwilu Ngongo Zone de Sante    0
#> 31         kc Lukula Zone de Sante    0
#> 32  kc Mbanza Ngungu Zone de Sante    0
#> 33         kc Muanda Zone de Sante    0
#> 34         kc Nzanza Zone de Sante   16
#> 35        ke Bipemba Zone de Sante   67
#> 36        ke Dibindi Zone de Sante   63
#> 37     ke Tshishimbi Zone de Sante   60
#> 38          kg Kenge Zone de Sante    0
#> 39        kg Kitenda Zone de Sante   23
#> 40     kl Kikwit Sud Zone de Sante   33
#> 41   kl Masi Manimba Zone de Sante    0
#> 42        kl Mosango Zone de Sante   12
#> 43    kl Pay Kongila Zone de Sante    0
#> 44    kn Binza Ozone Zone de Sante    0
#> 45      kn Kingasani Zone de Sante    0
#> 46        kn Kisenso Zone de Sante  125
#> 47         kn Limete Zone de Sante    0
#> 48       kn Lingwala Zone de Sante    0
#> 49       kn Masina 1 Zone de Sante  250
#> 50         kn Matete Zone de Sante    0
#> 51 kn Mont Ngafula 1 Zone de Sante    0
#> 52    kn Ngiri Ngiri Zone de Sante    0
#> 53    kr Bena Tshadi Zone de Sante    0
#> 54          kr Demba Zone de Sante   38
#> 55        kr Kananga Zone de Sante    0
#> 56         kr Mutoto Zone de Sante    0
#> 57       kr Tshikaji Zone de Sante    0
#> 58       ks Kamwesha Zone de Sante    0
#> 59         ks Mikope Zone de Sante    0
#> 60  ks Ndjoko Mpunda Zone de Sante    0
#> 61       ks Tshikapa Zone de Sante   58
#> 62        ll Kapanga Zone de Sante   17
#> 63         ll Manika Zone de Sante    0
#> 64        lm Kalenda Zone de Sante   46
#> 65         lm Kamana Zone de Sante    0
#> 66    lm Kanda Kanda Zone de Sante    0
#> 67         md Bosobe Zone de Sante    0
#> 68          md Mimia Zone de Sante    0
#> 69          md Nioki Zone de Sante   24
#> 70       mg Bosondjo Zone de Sante   40
#> 71          mg Bumba Zone de Sante    0
#> 72      mg Yamongili Zone de Sante   19
#> 73       mn Alunguli Zone de Sante    0
#> 74      mn Kabambare Zone de Sante    0
#> 75        mn Kibombo Zone de Sante   23
#> 76        mn Obokote Zone de Sante   20
#> 77           nk Beni Zone de Sante    0
#> 78          nk Binza Zone de Sante    0
#> 79        nk Butembo Zone de Sante    0
#> 80           nk Goma Zone de Sante    0
#> 81      nk Karisimbi Zone de Sante    0
#> 82         nk Lubero Zone de Sante   26
#> 83      sk Bunyakiri Zone de Sante   25
#> 84           sk Fizi Zone de Sante    0
#> 85         sk Ibanda Zone de Sante   25
#> 86          sk Idjwi Zone de Sante   31
#> 87        sk Itombwe Zone de Sante    0
#> 88  sk Kimbi Lulenge Zone de Sante  212
#> 89         sk Minova Zone de Sante    0
#> 90      sk Nyantende Zone de Sante   32
#> 91          sk Uvira Zone de Sante    0
#> 92   sn Katako Kombe Zone de Sante   10
#> 93           sn Kole Zone de Sante   96
#> 94         tp Basoko Zone de Sante    0
#> 95         tu Boende Zone de Sante   19
#> 96          tu Djolu Zone de Sante   30
```

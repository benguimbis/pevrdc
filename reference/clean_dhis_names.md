# A function that removes DRC DHIS prefixes and suffixes

A function that removes DRC DHIS prefixes and suffixes

## Usage

``` r
clean_dhis_names(
  data,
  column,
  has_prefix = 2,
  suffix = "(Province|Zone de Sant[eé]|Aire de Sant[eé]|Centre de Sant[eé])"
)
```

## Arguments

- data:

  The dataset containing variables to be cleaned

- column:

  The column containing values to be cleaned espcially organization
  levels of DRC EPI

- has_prefix:

  An integer specifying the number of characters of the prefix to be
  removed. Set to 0 if no prefix

- suffix:

  A character value that specifies the suffix to be removed

## Value

A dataframe with cleaned names

## Examples

``` r
datafile <- system.file(c("pop2025.RDS"), package = "pevrdc")

vacc <- readRDS(datafile)
clean_dhis_names(vacc, column = orgunitlevel2, has_prefix = 2, suffix = "Province")
#>      orgunitlevel2                      orgunitlevel3 naissance_mois_admin
#> 1        Haut Uele               hu Aba Zone de Santé             700.7500
#> 2      Nord Ubangi             nu Abuzi Zone de Santé             354.0000
#> 3            Ituri               it Adi Zone de Santé             744.0833
#> 4            Ituri              it Adja Zone de Santé             594.0000
#> 5         Bas Uele             bu Aketi Zone de Santé             618.5833
#> 6        Nord Kivu         nk Alimbongo Zone de Santé            1027.8333
#> 7          Maniema          mn Alunguli Zone de Santé             373.0000
#> 8         Bas Uele              bu Ango Zone de Santé             706.5833
#> 9            Ituri            it Angumu Zone de Santé             778.1667
#> 10      Tanganyika            tn Ankoro Zone de Santé            1117.3333
#> 11           Ituri           it Ariwara Zone de Santé             956.9167
#> 12           Ituri               it Aru Zone de Santé             837.9167
#> 13           Ituri            it Aungba Zone de Santé             771.8333
#> 14          Tshopo       tp Bafwagbogbo Zone de Santé             304.9167
#> 15          Tshopo        tp Bafwasende Zone de Santé             366.7500
#> 16           Kwilu            kl Bagata Zone de Santé             790.9167
#> 17        Sud Kivu            sk Bagira Zone de Santé             573.5000
#> 18     Haut Lomami              hl Baka Zone de Santé             147.4167
#> 19       Nord Kivu             nk Bambo Zone de Santé             731.1667
#> 20           Ituri             it Bambu Zone de Santé             663.7500
#> 21          Tshopo           tp Banalia Zone de Santé             628.8333
#> 22        Kinshasa       kn Bandalungwa Zone de Santé             698.0833
#> 23           Kwilu          kl Bandundu Zone de Santé             929.8333
#> 24           Kasai      ks Banga Lubaka Zone de Santé             777.9167
#> 25      Sud Ubangi         su Bangabola Zone de Santé             647.0833
#> 26       Maindombe       md Banzow Moke Zone de Santé             560.8333
#> 27        Kinshasa           kn Barumbu Zone de Santé             759.0833
#> 28          Tshopo            tp Basali Zone de Santé             417.0833
#> 29        Equateur         eq Basankusu Zone de Santé            1095.2500
#> 30          Tshopo            tp Basoko Zone de Santé             744.9167
#> 31         Tshuapa            tu Befale Zone de Santé             786.9167
#> 32         Sankuru       sn Bena Dibele Zone de Santé             572.8333
#> 33   Kasai Central         kr Bena Leka Zone de Santé            1303.7500
#> 34   Kasai Central       kr Bena Tshadi Zone de Santé             517.9167
#> 35          Tshopo         tp Bengamisa Zone de Santé             513.4167
#> 36       Nord Kivu              nk Beni Zone de Santé            1832.5833
#> 37  Kasai Oriental           ke Bibanga Zone de Santé             680.8333
#> 38       Nord Kivu             nk Biena Zone de Santé             569.4167
#> 39        Equateur            eq Bikoro Zone de Santé             687.7500
#> 40        Bas Uele              bu Bili Zone de Santé             294.3333
#> 41        Bas Uele              bu Bili Zone de Santé             294.3333
#> 42     Nord Ubangi              nu Bili Zone de Santé             843.3333
#> 43     Nord Ubangi              nu Bili Zone de Santé             843.3333
#> 44   Kasai Central           kr Bilomba Zone de Santé             414.7500
#> 45         Mongala             mg Binga Zone de Santé            1233.1667
#> 46       Nord Kivu             nk Binza Zone de Santé             755.4167
#> 47        Kinshasa       kn Binza Meteo Zone de Santé            2222.0000
#> 48        Kinshasa       kn Binza Ozone Zone de Santé            1576.6667
#> 49  Kasai Oriental           ke Bipemba Zone de Santé            1591.0000
#> 50       Nord Kivu         nk Birambizo Zone de Santé             827.9167
#> 51           Ituri           it Biringi Zone de Santé             576.4167
#> 52        Kinshasa            kn Biyela Zone de Santé            1048.3333
#> 53   Kasai Central            kr Bobozo Zone de Santé             230.5000
#> 54         Tshuapa            tu Boende Zone de Santé            1118.9167
#> 55           Ituri              it Boga Zone de Santé             305.2500
#> 56      Sud Ubangi       su Bogosenubea Zone de Santé             759.7500
#> 57          Kwango              kg Boko Zone de Santé             944.5000
#> 58   Kongo Central       kc Boko Kivulu Zone de Santé             814.9167
#> 59      Sud Ubangi           su Bokonzi Zone de Santé            1033.8333
#> 60       Maindombe            md Bokoro Zone de Santé             976.0833
#> 61         Tshuapa           tu Bokungu Zone de Santé             871.5833
#> 62        Equateur           eq Bolenge Zone de Santé             483.7500
#> 63       Maindombe            md Bolobo Zone de Santé             610.5833
#> 64        Equateur           eq Bolomba Zone de Santé            1209.8333
#> 65   Kongo Central              kc Boma Zone de Santé             947.0000
#> 66   Kongo Central        kc Boma Bungu Zone de Santé             429.3333
#> 67       Haut Uele     hu Boma Mangbetu Zone de Santé             488.7500
#> 68      Sud Ubangi         su Bominenge Zone de Santé             712.3333
#> 69        Equateur           eq Bomongo Zone de Santé             487.4167
#> 70        Bas Uele             bu Bondo Zone de Santé             673.6667
#> 71         Mongala       mg Bongandanga Zone de Santé             724.3333
#> 72  Kasai Oriental           ke Bonzola Zone de Santé             811.5000
#> 73         Mongala        mg Boso Manzi Zone de Santé             716.0833
#> 74         Mongala     mg Boso Mondanda Zone de Santé             737.5833
#> 75       Maindombe            md Bosobe Zone de Santé             567.6667
#> 76     Nord Ubangi          nu Bosobolo Zone de Santé             754.7500
#> 77         Mongala          mg Bosondjo Zone de Santé             997.1667
#> 78      Sud Ubangi              su Boto Zone de Santé             821.1667
#> 79      Sud Ubangi           su Budjala Zone de Santé             612.8333
#> 80     Haut Lomami            hl Bukama Zone de Santé            1507.8333
#> 81           Kasai            ks Bulape Zone de Santé             845.6667
#> 82      Sud Ubangi              su Bulu Zone de Santé             737.7500
#> 83           Kwilu           kl Bulungu Zone de Santé            1230.5833
#> 84         Mongala             mg Bumba Zone de Santé            1083.0833
#> 85        Kinshasa             kn Bumbu Zone de Santé            1573.4167
#> 86           Ituri             it Bunia Zone de Santé            1493.7500
#> 87         Lualaba           ll Bunkeya Zone de Santé             245.7500
#> 88   Kasai Central          kr Bunkonde Zone de Santé             515.7500
#> 89        Sud Kivu         sk Bunyakiri Zone de Santé            1061.6667
#> 90         Tshuapa           tu Busanga Zone de Santé             426.1667
#> 91     Nord Ubangi           nu Businga Zone de Santé             550.5833
#> 92        Bas Uele              bu Buta Zone de Santé             906.9167
#> 93       Nord Kivu           nk Butembo Zone de Santé             921.9167
#> 94     Haut Lomami           hl Butumba Zone de Santé             889.7500
#> 95      Sud Ubangi          su Bwamanda Zone de Santé            1021.8333
#> 96  Kasai Oriental           ke Cilundu Zone de Santé             827.4167
#> 97  Kasai Oriental           ke Citenge Zone de Santé            1061.5833
#> 98           Ituri             it Damas Zone de Santé             513.7500
#> 99           Kasai            ks Dekese Zone de Santé             856.7500
#> 100  Kasai Central             kr Demba Zone de Santé            1531.4167
#> 101  Kasai Central            kr Dibaya Zone de Santé             819.5000
#> 102 Kasai Oriental           ke Dibindi Zone de Santé            1200.3333
#> 103        Sankuru           sn Dikungu Zone de Santé             663.0000
#> 104        Lualaba            ll Dilala Zone de Santé            1065.2500
#> 105        Lualaba            ll Dilolo Zone de Santé             806.1667
#> 106 Kasai Oriental             ke Diulu Zone de Santé            1656.1667
#> 107        Sankuru      sn Djalo Ndjeka Zone de Santé             412.0000
#> 108        Tshuapa             tu Djolu Zone de Santé            1000.8333
#> 109       Equateur            eq Djombo Zone de Santé             406.6667
#> 110          Kwilu             kl Djuma Zone de Santé             969.1667
#> 111      Haut Uele            hu Doruma Zone de Santé             309.5000
#> 112          Ituri            it Drodro Zone de Santé             686.2500
#> 113      Haut Uele             hu Dungu Zone de Santé             616.3333
#> 114      Haut Uele           hu Faradje Zone de Santé             551.1667
#> 115          Ituri            it Fataki Zone de Santé             581.4167
#> 116        Maniema          mn Ferekeni Zone de Santé             240.7500
#> 117         Kwango             kg Feshi Zone de Santé             649.0000
#> 118       Sud Kivu              sk Fizi Zone de Santé            1727.2500
#> 119        Lualaba         ll Fungurume Zone de Santé            1436.7500
#> 120       Bas Uele             bu Ganga Zone de Santé             572.2500
#> 121    Nord Ubangi         nu Gbadolite Zone de Santé             766.6667
#> 122     Sud Ubangi            su Gemena Zone de Santé            1583.5000
#> 123          Ituri              it Gety Zone de Santé             873.3333
#> 124      Nord Kivu              nk Goma Zone de Santé            1131.4167
#> 125      Haut Uele           hu Gombari Zone de Santé             500.5000
#> 126       Kinshasa             kn Gombe Zone de Santé             444.0833
#> 127  Kongo Central      kc Gombe Matadi Zone de Santé             414.9167
#> 128          Kwilu             kl Gungu Zone de Santé            1113.9167
#> 129       Sud Kivu      sk Haut Plateau Zone de Santé             617.5000
#> 130       Sud Kivu            sk Ibanda Zone de Santé            1824.1667
#> 131       Equateur             eq Iboko Zone de Santé             519.0000
#> 132          Kwilu            kl Idiofa Zone de Santé            1282.3333
#> 133       Sud Kivu             sk Idjwi Zone de Santé            1173.5833
#> 134        Tshuapa             tu Ikela Zone de Santé             794.1667
#> 135          Kasai             ks Ilebo Zone de Santé             890.1667
#> 136  Kongo Central              kc Inga Zone de Santé             386.5000
#> 137       Equateur           eq Ingende Zone de Santé             670.0000
#> 138      Maindombe            md Inongo Zone de Santé             945.6667
#> 139          Kwilu             kl Ipamu Zone de Santé             910.2500
#> 140       Equateur             eq Irebu Zone de Santé             230.4167
#> 141         Tshopo            tp Isangi Zone de Santé             737.4167
#> 142      Haut Uele             hu Isiro Zone de Santé            1190.9167
#> 143      Nord Kivu           nk Itebero Zone de Santé             817.5000
#> 144       Sud Kivu           sk Itombwe Zone de Santé             414.2500
#> 145          Ituri              it Jiba Zone de Santé             442.9167
#> 146     Tanganyika            tn Kabalo Zone de Santé            1088.0000
#> 147        Maniema         mn Kabambare Zone de Santé             628.1667
#> 148       Sud Kivu            sk Kabare Zone de Santé             881.6667
#> 149 Kasai Oriental   ke Kabeya Kamwanga Zone de Santé             888.6667
#> 150         Lomami           lm Kabinda Zone de Santé            1513.2500
#> 151         Tshopo           tp Kabondo Zone de Santé             757.0000
#> 152    Haut Lomami    hl Kabondo Dianda Zone de Santé            1125.0000
#> 153    Haut Lomami           hl Kabongo Zone de Santé            1643.0833
#> 154       Sud Kivu            sk Kadutu Zone de Santé            1518.9167
#> 155        Lualaba         ll Kafakumba Zone de Santé             552.9167
#> 156   Haut Katanga            hk Kafubu Zone de Santé             696.9167
#> 157         Kwango           kg Kahemba Zone de Santé            1174.6667
#> 158        Maniema             mn Kailo Zone de Santé             749.0833
#> 159         Kwango            kg Kajiji Zone de Santé             683.4167
#> 160          Kasai           ks Kakenge Zone de Santé             912.1667
#> 161        Lualaba           ll Kalamba Zone de Santé             537.8333
#> 162         Lomami lm Kalambayi Kabanga Zone de Santé             891.0000
#> 163       Kinshasa          kn Kalamu 1 Zone de Santé            1137.0833
#> 164       Kinshasa          kn Kalamu 2 Zone de Santé             960.0000
#> 165       Sud Kivu            sk Kalehe Zone de Santé             737.9167
#> 166     Tanganyika           tn Kalemie Zone de Santé            1481.7500
#> 167         Lomami           lm Kalenda Zone de Santé             898.2500
#> 168        Maniema            mn Kalima Zone de Santé             631.2500
#> 169       Sud Kivu            sk Kalole Zone de Santé             604.5833
#> 170  Kasai Central           kr Kalomba Zone de Santé             735.4167
#> 171         Lomami       lm Kalonda Est Zone de Santé            1033.9167
#> 172          Kasai     ks Kalonda Ouest Zone de Santé            1860.0833
#> 173       Sud Kivu           sk Kalonge Zone de Santé             820.2500
#> 174      Nord Kivu         nk Kalunguta Zone de Santé             819.4167
#> 175   Haut Katanga         hk Kamalondo Zone de Santé             142.5833
#> 176         Lomami            lm Kamana Zone de Santé             886.2500
#> 177      Nord Kivu           nk Kamango Zone de Santé             504.9167
#> 178          Ituri           it Kambala Zone de Santé             604.4167
#> 179   Haut Katanga           hk Kambove Zone de Santé             752.6667
#> 180         Lomami            lm Kamiji Zone de Santé             438.9167
#> 181    Haut Lomami            hl Kamina Zone de Santé            1335.1667
#> 182       Sud Kivu          sk Kamituga Zone de Santé             829.6667
#> 183          Kasai           ks Kamonia Zone de Santé            1852.8333
#> 184   Haut Katanga          hk Kampemba Zone de Santé            1927.5000
#> 185        Maniema           mn Kampene Zone de Santé             693.1667
#> 186          Kasai          ks Kamwesha Zone de Santé            2050.5000
#> 187  Kasai Central           kr Kananga Zone de Santé            1287.2500
#> 188         Lomami       lm Kanda Kanda Zone de Santé            1037.0000
#> 189  Kongo Central             kc Kangu Zone de Santé             443.5833
#> 190    Haut Lomami           hl Kaniama Zone de Santé            1307.7500
#> 191       Sud Kivu           sk Kaniola Zone de Santé             766.5000
#> 192 Kasai Oriental           ke Kansele Zone de Santé            1136.1667
#> 193     Tanganyika          tn Kansimba Zone de Santé             723.5000
#> 194          Kasai           ks Kanzala Zone de Santé            1166.1667
#> 195        Lualaba          ll Kanzenze Zone de Santé             943.7500
#> 196        Lualaba           ll Kapanga Zone de Santé             666.7500
#> 197   Haut Katanga          hk Kapolowe Zone de Santé            1271.5833
#> 198    Nord Ubangi            nu Karawa Zone de Santé            1143.6667
#> 199      Nord Kivu         nk Karisimbi Zone de Santé            2284.0000
#> 200       Kinshasa         kn Kasa Vubu Zone de Santé             673.9167
#> 201        Lualaba            ll Kasaji Zone de Santé            1157.8333
#> 202 Kasai Oriental           ke Kasansa Zone de Santé             918.5833
#> 203   Haut Katanga           hk Kasenga Zone de Santé             742.7500
#> 204   Haut Katanga          hk Kashobwe Zone de Santé             653.5833
#> 205        Maniema           mn Kasongo Zone de Santé            1026.6667
#> 206         Kwango     kg Kasongo Lunda Zone de Santé             731.5000
#> 207        Sankuru      sn Katako Kombe Zone de Santé             605.5000
#> 208       Sud Kivu            sk Katana Zone de Santé             946.0000
#> 209  Kasai Central           kr Katende Zone de Santé             433.5833
#> 210  Kasai Central            kr Katoka Zone de Santé             611.3333
#> 211      Nord Kivu            nk Katoyi Zone de Santé            1315.5000
#> 212   Haut Katanga            hk Katuba Zone de Santé             627.8333
#> 213      Nord Kivu             nk Katwa Zone de Santé            1898.6667
#> 214    Haut Lomami           hl Kayamba Zone de Santé             454.8333
#> 215      Nord Kivu             nk Kayna Zone de Santé            1559.0000
#> 216       Sud Kivu            sk Kaziba Zone de Santé             542.5833
#> 217         Kwango             kg Kenge Zone de Santé            1232.5000
#> 218   Haut Katanga             hk Kenya Zone de Santé            1070.0000
#> 219     Tanganyika            tn Kiambi Zone de Santé             728.0000
#> 220      Nord Kivu          nk Kibirizi Zone de Santé            1481.5000
#> 221        Maniema           mn Kibombo Zone de Santé             461.2500
#> 222      Nord Kivu             nk Kibua Zone de Santé             491.7500
#> 223  Kongo Central           kc Kibunzi Zone de Santé             291.8333
#> 224       Kinshasa            kn Kikimi Zone de Santé            1301.8333
#> 225          Kwilu           kl Kikongo Zone de Santé             837.0000
#> 226   Haut Katanga            hk Kikula Zone de Santé            1126.5000
#> 227          Kwilu       kl Kikwit Nord Zone de Santé            1063.6667
#> 228          Kwilu        kl Kikwit Sud Zone de Santé            1142.2500
#> 229   Haut Katanga    hk Kilela Balanda Zone de Santé             306.5000
#> 230          Ituri              it Kilo Zone de Santé             226.6667
#> 231   Haut Katanga             hk Kilwa Zone de Santé            1922.0000
#> 232       Kinshasa        kn Kimbanseke Zone de Santé            1298.8333
#> 233         Kwango            kg Kimbao Zone de Santé             876.7500
#> 234       Sud Kivu     sk Kimbi Lulenge Zone de Santé            1512.2500
#> 235  Kongo Central          kc Kimpangu Zone de Santé             511.6667
#> 236  Kongo Central           kc Kimpese Zone de Santé             725.6667
#> 237          Kwilu           kl Kimputu Zone de Santé             880.3333
#> 238  Kongo Central           kc Kimvula Zone de Santé             350.1667
#> 239    Haut Lomami             hl Kinda Zone de Santé             396.5833
#> 240        Maniema             mn Kindu Zone de Santé            1138.4167
#> 241       Kinshasa          kn Kingabwa Zone de Santé            1129.9167
#> 242          Kwilu          kl Kingandu Zone de Santé             483.7500
#> 243       Kinshasa         kn Kingasani Zone de Santé            1100.9167
#> 244    Haut Lomami         hl Kinkondja Zone de Santé            1224.4167
#> 245  Kongo Central          kc Kinkonzi Zone de Santé             305.1667
#> 246       Kinshasa          kn Kinshasa Zone de Santé             914.9167
#> 247       Kinshasa          kn Kintambo Zone de Santé             386.5000
#> 248   Haut Katanga           hk Kipushi Zone de Santé            1011.9167
#> 249      Maindombe              md Kiri Zone de Santé             511.0833
#> 250      Nord Kivu          nk Kirotshe Zone de Santé            1786.1667
#> 251   Haut Katanga           hk Kisanga Zone de Santé            2147.5000
#> 252         Kwango           kg Kisanji Zone de Santé             527.1667
#> 253  Kongo Central           kc Kisantu Zone de Santé             805.8333
#> 254       Kinshasa           kn Kisenso Zone de Santé            1773.0833
#> 255          Kasai          ks Kitangwa Zone de Santé            1238.3333
#> 256         Kwango           kg Kitenda Zone de Santé             692.2500
#> 257    Haut Lomami           hl Kitenge Zone de Santé            1240.7500
#> 258  Kongo Central            kc Kitona Zone de Santé             426.2500
#> 259       Sud Kivu            sk Kitutu Zone de Santé             762.7500
#> 260  Kongo Central              kc Kizu Zone de Santé             275.3333
#> 261       Kinshasa            kn Kokolo Zone de Santé            1671.8333
#> 262        Sankuru              sn Kole Zone de Santé             596.6667
#> 263          Ituri           it Komanda Zone de Santé            1084.4167
#> 264     Tanganyika           tn Kongolo Zone de Santé            1364.0000
#> 265          Kwilu        kl Koshibanda Zone de Santé             914.8333
#> 266   Haut Katanga              hk Kowe Zone de Santé             251.0000
#> 267  Kongo Central            kc Kuimba Zone de Santé             429.2500
#> 268        Maniema             mn Kunda Zone de Santé            1281.0833
#> 269     Sud Ubangi             su Kungu Zone de Santé             985.0833
#> 270      Maindombe          md Kwamouth Zone de Santé             686.2500
#> 271  Kongo Central      kc Kwilu Ngongo Zone de Santé             589.9167
#> 272      Nord Kivu            nk Kyondo Zone de Santé             796.7500
#> 273          Ituri             it Laybo Zone de Santé             674.3333
#> 274       Kinshasa             kn Lemba Zone de Santé            1004.9167
#> 275       Sud Kivu            sk Lemera Zone de Santé             755.5833
#> 276     Sud Ubangi           su Libenge Zone de Santé             962.5833
#> 277   Haut Katanga            hk Likasi Zone de Santé             987.1667
#> 278       Bas Uele            bu Likati Zone de Santé             344.4167
#> 279       Equateur   eq Lilanga Bobangi Zone de Santé             367.4167
#> 280       Kinshasa            kn Limete Zone de Santé            1242.5000
#> 281          Ituri             it Linga Zone de Santé             623.2500
#> 282        Tshuapa           tu Lingomo Zone de Santé             572.5833
#> 283       Kinshasa          kn Lingwala Zone de Santé             427.8333
#> 284        Mongala            mg Lisala Zone de Santé            1387.5833
#> 285          Ituri              it Lita Zone de Santé             591.5000
#> 286        Sankuru             sn Lodja Zone de Santé            1497.4167
#> 287          Ituri              it Logo Zone de Santé            1078.8333
#> 288    Nord Ubangi              nu Loko Zone de Santé             560.7500
#> 289        Mongala              mg Lolo Zone de Santé             673.0000
#> 290          Ituri             it Lolwa Zone de Santé             429.8333
#> 291        Sankuru            sn Lomela Zone de Santé             568.6667
#> 292       Equateur           eq Lotumbe Zone de Santé             537.2500
#> 293         Tshopo              tp Lowa Zone de Santé             580.3333
#> 294        Lualaba           ll Lualaba Zone de Santé             747.3333
#> 295  Kasai Central            kr Luambo Zone de Santé            1236.9167
#> 296         Lomami             lm Lubao Zone de Santé             978.5833
#> 297      Nord Kivu            nk Lubero Zone de Santé            1241.4167
#> 298 Kasai Oriental         ke Lubilanji Zone de Santé            1142.3333
#> 299  Kasai Central         kr Lubondaie Zone de Santé             682.0000
#> 300        Lualaba            ll Lubudi Zone de Santé             500.3333
#> 301   Haut Katanga        hk Lubumbashi Zone de Santé            1240.3333
#> 302  Kasai Central           kr Lubunga Zone de Santé             469.3333
#> 303  Kasai Central           kr Lubunga Zone de Santé             469.3333
#> 304         Tshopo           tp Lubunga Zone de Santé             667.9167
#> 305         Tshopo           tp Lubunga Zone de Santé             667.9167
#> 306        Maniema            mn Lubutu Zone de Santé             585.4167
#> 307         Lomami    lm Ludimbi Lukula Zone de Santé             706.4167
#> 308          Kasai             ks Luebo Zone de Santé            1232.6667
#> 309  Kasai Central             kr Luiza Zone de Santé             781.8333
#> 310   Haut Katanga            hk Lukafu Zone de Santé             634.6667
#> 311 Kasai Oriental         ke Lukelenge Zone de Santé            1226.6667
#> 312       Equateur          eq Lukolela Zone de Santé             658.1667
#> 313  Kasai Central           kr Lukonga Zone de Santé            1233.9167
#> 314  Kongo Central            kc Lukula Zone de Santé             708.5833
#> 315       Sud Kivu           sk Lulingu Zone de Santé             782.2500
#> 316  Kongo Central             kc Luozi Zone de Santé             438.7500
#> 317         Lomami            lm Luputa Zone de Santé            1224.3333
#> 318        Sankuru           sn Lusambo Zone de Santé             603.0000
#> 319          Kwilu           kl Lusanga Zone de Santé            1218.8333
#> 320        Maniema           mn Lusangi Zone de Santé             746.8333
#> 321    Haut Lomami            hl Lwamba Zone de Santé             609.7500
#> 322      Nord Kivu          nk Mabalako Zone de Santé             840.3333
#> 323          Ituri            it Mahagi Zone de Santé             877.3333
#> 324       Kinshasa            kn Makala Zone de Santé            1501.8333
#> 325       Equateur           eq Makanza Zone de Santé             576.7500
#> 326         Tshopo  tp Makiso Kisangani Zone de Santé            1956.5000
#> 327      Haut Uele            hu Makoro Zone de Santé             619.3333
#> 328         Lomami            lm Makota Zone de Santé            1048.2500
#> 329    Haut Lomami     hl Malemba Nkulu Zone de Santé            1528.8333
#> 330       Kinshasa          kn Maluku 1 Zone de Santé            1036.5000
#> 331       Kinshasa          kn Maluku 2 Zone de Santé             406.3333
#> 332          Ituri           it Mambasa Zone de Santé             447.0833
#> 333       Equateur           eq Mampoko Zone de Santé             497.5000
#> 334          Ituri           it Mandima Zone de Santé             680.7500
#> 335          Ituri           it Mangala Zone de Santé             444.7500
#> 336  Kongo Central          kc Mangembo Zone de Santé             302.9167
#> 337         Tshopo           tp Mangobo Zone de Santé             935.3333
#> 338      Nord Kivu      nk Manguredjipa Zone de Santé             335.3333
#> 339        Lualaba            ll Manika Zone de Santé            1689.5833
#> 340     Tanganyika            tn Manono Zone de Santé            1342.6667
#> 341      Nord Kivu          nk Masereka Zone de Santé             653.1667
#> 342          Kwilu      kl Masi Manimba Zone de Santé            1064.0833
#> 343       Kinshasa          kn Masina 1 Zone de Santé            2511.8333
#> 344       Kinshasa          kn Masina 2 Zone de Santé            1483.3333
#> 345      Nord Kivu            nk Masisi Zone de Santé            1568.8333
#> 346  Kongo Central             kc Massa Zone de Santé             449.0833
#> 347  Kasai Central           kr Masuika Zone de Santé            1062.2500
#> 348  Kongo Central            kc Matadi Zone de Santé            1104.5833
#> 349       Kinshasa            kn Matete Zone de Santé            1304.1667
#> 350     Sud Ubangi            su Mawuya Zone de Santé             695.2500
#> 351       Equateur          eq Mbandaka Zone de Santé             985.5833
#> 352  Kongo Central     kc Mbanza Ngungu Zone de Santé             584.0000
#> 353     Sud Ubangi             su Mbaya Zone de Santé             305.4167
#> 354     Tanganyika           tn Mbulula Zone de Santé             840.8333
#> 355 Kasai Oriental             ke Miabi Zone de Santé             697.2500
#> 356  Kasai Central          kr Mikalayi Zone de Santé             914.6667
#> 357          Kasai            ks Mikope Zone de Santé             902.0833
#> 358      Maindombe             md Mimia Zone de Santé             247.2500
#> 359       Sud Kivu          sk Minembwe Zone de Santé             397.3333
#> 360        Sankuru             sn Minga Zone de Santé             697.6667
#> 361       Sud Kivu            sk Minova Zone de Santé            1395.9167
#> 362       Sud Kivu      sk Miti Murhesa Zone de Santé            1077.8333
#> 363   Haut Katanga           hk Mitwaba Zone de Santé             710.1667
#> 364          Kwilu            kl Moanza Zone de Santé             774.6667
#> 365     Tanganyika              tn Moba Zone de Santé            1427.0833
#> 366    Nord Ubangi     nu Mobayi Mbongo Zone de Santé             600.7500
#> 367          Kwilu            kl Mokala Zone de Santé             969.7500
#> 368        Tshuapa           tu Mompono Zone de Santé             603.6667
#> 369        Tshuapa          tu Mondombe Zone de Santé             734.3333
#> 370       Bas Uele             bu Monga Zone de Santé             359.1667
#> 371          Ituri         it Mongbwalu Zone de Santé             610.6667
#> 372       Equateur           eq Monieka Zone de Santé             344.5833
#> 373        Tshuapa           tu Monkoto Zone de Santé             530.0000
#> 374       Kinshasa    kn Mont Ngafula 1 Zone de Santé            1427.3333
#> 375       Kinshasa    kn Mont Ngafula 2 Zone de Santé             964.3333
#> 376          Kwilu           kl Mosango Zone de Santé             542.4167
#> 377 Kasai Oriental           ke Mpokolo Zone de Santé            1244.5833
#> 378  Kongo Central            kc Muanda Zone de Santé             730.0833
#> 379       Sud Kivu         sk Mubumbano Zone de Santé             812.3333
#> 380  Kasai Central           kr Muetshi Zone de Santé             517.9167
#> 381   Haut Katanga    hk Mufunga Sampwe Zone de Santé             840.0833
#> 382    Haut Lomami           hl Mukanga Zone de Santé             909.6667
#> 383          Kwilu            kl Mukedi Zone de Santé             794.0000
#> 384 Kasai Oriental           ke Mukumbi Zone de Santé             657.3333
#> 385    Haut Lomami           hl Mulongo Zone de Santé            1386.9167
#> 386         Lomami           lm Mulumba Zone de Santé            1409.4167
#> 387       Sud Kivu           sk Mulungu Zone de Santé             683.2500
#> 388   Haut Katanga          hk Mumbunda Zone de Santé            1460.5000
#> 389          Kwilu          kl Mungindu Zone de Santé             572.5833
#> 390          Kasai          ks Mushenge Zone de Santé             812.4167
#> 391      Maindombe            md Mushie Zone de Santé             590.5000
#> 392      Nord Kivu         nk Musienene Zone de Santé            1107.3333
#> 393          Kasai            ks Mutena Zone de Santé            1240.7500
#> 394  Kasai Central            kr Mutoto Zone de Santé             602.7500
#> 395        Lualaba        ll Mutshatsha Zone de Santé             333.6667
#> 396      Nord Kivu          nk Mutwanga Zone de Santé            1221.8333
#> 397 Kasai Oriental              ke Muya Zone de Santé            1481.8333
#> 398       Sud Kivu             sk Mwana Zone de Santé             580.0833
#> 399          Kasai             ks Mweka Zone de Santé            1157.5000
#> 400         Kwango      kg Mwela Lembwa Zone de Santé             420.4167
#> 401         Lomami         lm Mweneditu Zone de Santé            1916.0000
#> 402       Sud Kivu            sk Mwenga Zone de Santé             600.0833
#> 403      Nord Kivu             nk Mweso Zone de Santé            1799.8333
#> 404     Sud Ubangi             su Ndage Zone de Santé             611.0000
#> 405  Kasai Central          kr Ndekesha Zone de Santé             754.9167
#> 406  Kasai Central            kr Ndesha Zone de Santé             475.3333
#> 407       Kinshasa            kn Ndjili Zone de Santé            1505.9167
#> 408          Kasai     ks Ndjoko Mpunda Zone de Santé             740.4167
#> 409       Kinshasa             kn Ngaba Zone de Santé             852.8333
#> 410         Lomami        lm Ngandajika Zone de Santé            1373.6667
#> 411  Kongo Central          kc Ngidinga Zone de Santé             574.0833
#> 412       Kinshasa       kn Ngiri Ngiri Zone de Santé            1246.2500
#> 413          Ituri           it Nia Nia Zone de Santé             460.5833
#> 414      Haut Uele          hu Niangara Zone de Santé             499.5833
#> 415      Maindombe             md Nioki Zone de Santé             720.4167
#> 416          Ituri              it Nizi Zone de Santé             889.1667
#> 417       Kinshasa             kn Nsele Zone de Santé            1803.6667
#> 418  Kongo Central             kc Nselo Zone de Santé             409.1667
#> 419  Kongo Central      kc Nsona Mpangu Zone de Santé             444.5000
#> 420      Maindombe       md Ntandembelo Zone de Santé             386.0833
#> 421       Equateur            eq Ntondo Zone de Santé             306.0000
#> 422       Sud Kivu             sk Nundu Zone de Santé             986.3333
#> 423          Kasai            ks Nyanga Zone de Santé             588.1667
#> 424       Sud Kivu          sk Nyangezi Zone de Santé             724.6667
#> 425          Ituri         it Nyankunde Zone de Santé             438.0833
#> 426       Sud Kivu         sk Nyantende Zone de Santé             596.5833
#> 427          Ituri          it Nyarambe Zone de Santé             976.1667
#> 428     Tanganyika            tn Nyemba Zone de Santé            1384.1667
#> 429      Nord Kivu        nk Nyiragongo Zone de Santé            1295.4167
#> 430     Tanganyika            tn Nyunzu Zone de Santé            1095.1667
#> 431 Kasai Oriental             ke Nzaba Zone de Santé            1303.8333
#> 432  Kongo Central            kc Nzanza Zone de Santé             672.9167
#> 433        Maniema           mn Obokote Zone de Santé             336.3333
#> 434      Nord Kivu             nk Oicha Zone de Santé            1226.9167
#> 435        Sankuru         sn Omendjadi Zone de Santé             704.0833
#> 436         Tshopo             tp Opala Zone de Santé             582.5833
#> 437         Tshopo           tp Opienge Zone de Santé             279.2500
#> 438      Maindombe             md Oshwe Zone de Santé             659.3333
#> 439        Sankuru             sn Ototo Zone de Santé             636.4167
#> 440   Haut Katanga             hk Panda Zone de Santé             400.0000
#> 441        Maniema             mn Pangi Zone de Santé             403.4167
#> 442        Sankuru     sn Pania Mutombo Zone de Santé             402.0833
#> 443         Kwango             kg Panzi Zone de Santé             778.9167
#> 444      Haut Uele              hu Pawa Zone de Santé             752.9167
#> 445          Kwilu       kl Pay Kongila Zone de Santé             670.3333
#> 446      Maindombe           md Pendjwa Zone de Santé             388.5833
#> 447        Mongala              mg Pimu Zone de Santé            1172.2500
#> 448      Nord Kivu             nk Pinga Zone de Santé             739.1667
#> 449       Bas Uele              bu Poko Zone de Santé             560.5833
#> 450       Kinshasa            kn Police Zone de Santé             608.4167
#> 451         Kwango        kg Popokabaka Zone de Santé             977.9167
#> 452        Maniema             mn Punia Zone de Santé             523.0833
#> 453   Haut Katanga             hk Pweto Zone de Santé            1349.5000
#> 454          Ituri             it Rethy Zone de Santé             923.8333
#> 455          Ituri             it Rimba Zone de Santé             975.3333
#> 456   Haut Katanga            hk Ruashi Zone de Santé            2787.6667
#> 457      Haut Uele             hu Rungu Zone de Santé             508.0000
#> 458      Nord Kivu          nk Rutshuru Zone de Santé            1133.8333
#> 459       Sud Kivu            sk Ruzizi Zone de Santé             743.7500
#> 460          Ituri          it Rwampara Zone de Santé             905.8333
#> 461      Nord Kivu          nk Rwanguba Zone de Santé            1158.5000
#> 462   Haut Katanga           hk Sakania Zone de Santé            1709.4167
#> 463        Maniema             mn Samba Zone de Santé             539.6667
#> 464        Lualaba            ll Sandoa Zone de Santé             965.1667
#> 465        Maniema        mn Saramabila Zone de Santé             661.3333
#> 466  Kongo Central        kc Seke Banza Zone de Santé             629.5000
#> 467       Kinshasa          kn Selembao Zone de Santé            1765.6667
#> 468       Sud Kivu          sk Shabunda Zone de Santé             765.0000
#> 469          Kwilu               kl Sia Zone de Santé             493.0000
#> 470  Kongo Central         kc Sona Bata Zone de Santé             443.3333
#> 471    Haut Lomami             hl Songa Zone de Santé             870.5833
#> 472     Sud Ubangi           su Tandala Zone de Santé            1270.7500
#> 473          Ituri           it Tchomia Zone de Santé             495.2500
#> 474         Kwango             kg Tembo Zone de Santé             451.7500
#> 475       Bas Uele            bu Titule Zone de Santé             362.5833
#> 476   Haut Katanga       hk Tshamilemba Zone de Santé            1065.2500
#> 477  Kongo Central            kc Tshela Zone de Santé             369.6667
#> 478  Kasai Central          kr Tshibala Zone de Santé            1106.4167
#> 479  Kasai Central          kr Tshikaji Zone de Santé             561.6667
#> 480          Kasai          ks Tshikapa Zone de Santé            1705.0000
#> 481  Kasai Central          kr Tshikula Zone de Santé             604.7500
#> 482 Kasai Oriental         ke Tshilenge Zone de Santé            1295.0833
#> 483 Kasai Oriental        ke Tshishimbi Zone de Santé             805.7500
#> 484         Lomami            lm Tshofa Zone de Santé             615.5000
#> 485         Tshopo            tp Tshopo Zone de Santé             831.9167
#> 486        Sankuru       sn Tshudi Loto Zone de Santé             362.5000
#> 487        Sankuru           sn Tshumbe Zone de Santé             483.3333
#> 488        Maniema             mn Tunda Zone de Santé             393.1667
#> 489         Tshopo            tp Ubundu Zone de Santé             447.1667
#> 490       Sud Kivu             sk Uvira Zone de Santé            1412.6667
#> 491  Kongo Central              kc Vaku Zone de Santé             331.2500
#> 492          Kwilu             kl Vanga Zone de Santé            1286.1667
#> 493        Sankuru        sn Vanga Kete Zone de Santé             590.1667
#> 494   Haut Katanga             hk Vangu Zone de Santé             651.0000
#> 495       Bas Uele           bu Viadana Zone de Santé             498.2500
#> 496      Nord Kivu            nk Vuhovi Zone de Santé             520.5833
#> 497      Nord Kivu          nk Walikale Zone de Santé             711.0833
#> 498       Sud Kivu           sk Walungu Zone de Santé            1126.7500
#> 499      Haut Uele             hu Wamba Zone de Santé             586.2500
#> 500         Kwango       kg Wamba Lwadi Zone de Santé             500.8333
#> 501       Equateur           eq Wangata Zone de Santé             888.2500
#> 502         Tshopo       tp Wanierukula Zone de Santé             344.4167
#> 503    Nord Ubangi           nu Wapinda Zone de Santé             339.3333
#> 504    Nord Ubangi            nu Wasolo Zone de Santé             343.2500
#> 505      Haut Uele             hu Watsa Zone de Santé            1230.7500
#> 506        Tshuapa              tu Wema Zone de Santé             465.3333
#> 507        Sankuru       sn Wembo Nyama Zone de Santé             481.6667
#> 508         Lomami            lm Wikong Zone de Santé             545.0833
#> 509         Tshopo          tp Yabaondo Zone de Santé             737.1667
#> 510         Tshopo          tp Yahisuli Zone de Santé             424.0000
#> 511         Tshopo            tp Yahuma Zone de Santé             930.4167
#> 512    Nord Ubangi            nu Yakoma Zone de Santé             472.4167
#> 513         Tshopo            tp Yakusu Zone de Santé             723.9167
#> 514         Tshopo            tp Yaleko Zone de Santé             681.4167
#> 515        Tshuapa          tu Yalifafu Zone de Santé             714.9167
#> 516         Tshopo        tp Yalimbongo Zone de Santé             490.8333
#> 517        Mongala          mg Yamaluka Zone de Santé             671.9167
#> 518        Mongala           mg Yambuku Zone de Santé            1312.5000
#> 519        Mongala         mg Yamongili Zone de Santé             668.2500
#> 520  Kasai Central           kr Yangala Zone de Santé             707.4167
#> 521          Kwilu        kl Yasa Bonga Zone de Santé            1007.8333
#> 522      Maindombe             md Yumbi Zone de Santé             518.5833
#> 523     Sud Ubangi             su Zongo Zone de Santé             361.3333
#>     naissance_mois_ajust survivants_mois_admin survivant_mois_ajust
#> 1               700.7500              758.1667             611.4167
#> 2               354.0000              325.2500             308.8333
#> 3               994.7500              795.0833             649.2500
#> 4               594.0000              542.1667             518.2500
#> 5               994.4167             1183.7500             539.7500
#> 6              1027.8333              938.5000             896.7500
#> 7               633.2500              611.0833             325.5000
#> 8               706.5833              616.5000             616.5000
#> 9               915.5833              765.0000             678.9167
#> 10             1117.3333             1087.0833             974.9167
#> 11             1289.6667             1029.7500             834.9167
#> 12             1038.6667             1065.6667             731.0833
#> 13              771.8333              744.4167             673.4167
#> 14              424.5000              379.1667             266.0000
#> 15              698.6667              550.5000             320.0000
#> 16              857.3333              729.8333             690.0833
#> 17              851.7500              686.7500             500.4167
#> 18              161.5000              144.0000             128.5833
#> 19              833.6667              674.0833             637.9167
#> 20              668.5833              579.0833             579.0833
#> 21             1121.9167             1043.6667             548.6667
#> 22              698.0833              609.0833             609.0833
#> 23              929.8333              925.4167             811.3333
#> 24              798.8333              839.4167             678.7500
#> 25             1272.0833              975.0833             564.5000
#> 26              621.8333              598.2500             489.3333
#> 27              759.0833              853.6667             662.2500
#> 28             1213.4167             1617.7500             363.8333
#> 29             1105.5000              961.9167             955.5833
#> 30             1644.6667             1443.5833             649.9167
#> 31             1010.2500             1094.6667             686.5833
#> 32             2569.6667             1496.0000             499.8333
#> 33             1479.5000             1177.1667            1137.5833
#> 34              561.5833              451.9167             451.9167
#> 35              829.0000              855.6667             448.0000
#> 36             1832.5833             1763.1667            1598.9167
#> 37              965.8333              826.0833             594.0833
#> 38              570.5000              496.8333             496.8333
#> 39              715.0000              746.0833             600.1667
#> 40              365.0833              344.9167             256.7500
#> 41              365.0833              344.9167             256.7500
#> 42              843.3333              735.7500             735.7500
#> 43              843.3333              735.7500             735.7500
#> 44              414.7500              394.0833             361.8333
#> 45             3593.0833             3563.0833            1075.9167
#> 46              803.4167              722.2500             659.0833
#> 47             2222.0000             2079.5833            1938.7500
#> 48             2114.8333             1826.3333            1375.6667
#> 49             1591.0000             1761.3333            1388.0833
#> 50              827.9167              788.4167             722.3333
#> 51              717.1667              600.5833             503.0000
#> 52             1310.7500             1065.9167             914.6667
#> 53              246.7500              216.1667             201.0833
#> 54             1252.5000             1086.5833             976.2500
#> 55              320.0833              318.9167             266.3333
#> 56              901.6667              662.9167             662.9167
#> 57              954.6667              897.5000             824.0833
#> 58              814.9167              733.2500             710.9167
#> 59             1103.1667              957.5833             902.0000
#> 60             1680.6667              905.1667             851.6667
#> 61             1461.5833              866.2500             760.4167
#> 62              483.7500              628.8333             422.0833
#> 63              827.9167              771.1667             532.7500
#> 64             1680.5000             1055.5833            1055.5833
#> 65              947.0000              897.0833             826.2500
#> 66              521.0000              405.7500             374.5833
#> 67              488.7500              536.5000             426.4167
#> 68              712.3333              810.0000             621.5000
#> 69              491.1667              425.3333             425.3333
#> 70             1383.6667             1153.5833             587.7500
#> 71             1394.5833             1306.7500             632.0000
#> 72              865.5833              937.6667             708.0000
#> 73             2343.9167             2222.0833             624.7500
#> 74             1126.6667              921.8333             643.5000
#> 75             1296.6667             1252.5833             495.3333
#> 76              754.7500              658.5000             658.5000
#> 77             1533.2500             1343.0833             870.0000
#> 78              974.5833              806.5833             716.4167
#> 79             1394.6667              845.9167             534.7500
#> 80             1507.8333             1639.9167            1315.6667
#> 81              870.3333              971.2500             737.8333
#> 82             1024.7500              893.4167             643.6667
#> 83             1230.5833             1164.3333            1073.6667
#> 84             1715.6667             1565.0833             945.0000
#> 85             1573.4167             1372.8333            1372.8333
#> 86             1493.7500             1653.5833            1303.3333
#> 87              369.4167              303.3333             214.4167
#> 88              515.7500              507.3333             450.0000
#> 89             1127.8333             1077.0000             926.3333
#> 90              522.5000              565.5000             371.8333
#> 91              607.0000              508.5833             480.4167
#> 92             1071.3333              988.5833             791.3333
#> 93              921.9167              804.4167             804.4167
#> 94              889.7500              993.5000             776.2500
#> 95             1523.6667             1007.8333             891.5833
#> 96              891.0833              801.8333             721.9167
#> 97             1476.1667             1359.8333             926.2500
#> 98              513.7500              448.2500             448.2500
#> 99             3061.0000             1890.9167             747.5000
#> 100            1682.4167             1336.1667            1336.1667
#> 101             910.5833              748.8333             715.0833
#> 102            1266.5000             1409.2500            1047.2500
#> 103            2057.2500             1207.2500             578.4167
#> 104            2011.6667             1909.8333             929.4167
#> 105            1040.5833             1108.5000             703.3333
#> 106            1780.3333             1637.2500            1445.0000
#> 107            1164.7500             1046.9167             359.5000
#> 108            3078.2500             2173.5833             873.1667
#> 109             514.0000              354.8333             354.8333
#> 110             969.1667              845.6667             845.6667
#> 111             334.9167              270.0000             270.0000
#> 112             686.2500              669.7500             598.7500
#> 113             616.3333              708.0000             537.8333
#> 114             808.7500              812.2500             480.9167
#> 115             581.4167              648.7500             507.2500
#> 116             619.0833              980.2500             210.0000
#> 117             699.6667              566.2500             566.2500
#> 118            2443.0833             1983.6667            1507.0833
#> 119            2361.5000             2254.3333            1253.5833
#> 120            1295.0833             1185.5000             499.3333
#> 121             766.6667              701.5833             668.9167
#> 122            1998.9167             1678.5000            1381.5833
#> 123             873.3333              921.0000             762.0000
#> 124            1917.9167             1596.7500             987.1667
#> 125             773.2500              772.0000             436.6667
#> 126             444.0833              455.2500             387.4167
#> 127             439.4167              386.0833             362.0000
#> 128            1113.9167             1060.3333             971.9167
#> 129             627.4167              704.9167             538.7500
#> 130            1824.1667             1758.5833            1591.5833
#> 131             654.0000              655.3333             452.8333
#> 132            1282.3333             1171.6667            1118.8333
#> 133            1173.5833             1193.1667            1024.0000
#> 134            1868.4167             1565.2500             692.8333
#> 135            1451.0833             1392.7500             776.6667
#> 136             424.3333              449.0000             337.2500
#> 137             670.0000              723.1667             584.5833
#> 138            1124.6667              866.0000             825.0000
#> 139             910.2500              832.6667             794.2500
#> 140             230.4167              223.7500             201.0000
#> 141            1204.0833             1123.0833             643.4167
#> 142            1571.0833             1628.5000            1039.0833
#> 143             817.5000              761.8333             713.2500
#> 144             517.5000              556.4167             361.4167
#> 145             442.9167              459.0833             386.4167
#> 146            1174.3333             1123.2500             949.3333
#> 147            1378.9167             1418.1667             548.0833
#> 148             974.3333              852.9167             769.2500
#> 149            1193.5000             1013.3333             775.3333
#> 150            1789.2500             1434.5833            1320.2500
#> 151            1017.9167              788.6667             660.4167
#> 152            1230.5833             1178.5833             981.5833
#> 153            1718.1667             1607.0833            1433.5833
#> 154            1608.7500             1728.6667            1325.1667
#> 155             909.4167              839.5000             482.4167
#> 156             696.9167              708.8333             608.0833
#> 157            1174.6667             1024.8333            1024.8333
#> 158            1849.0000             1804.5833             653.5833
#> 159             683.4167              596.2500             596.2500
#> 160             912.1667              841.0833             795.8333
#> 161             539.1667              469.2500             469.2500
#> 162            1108.3333              862.2500             777.5000
#> 163            1137.0833              992.1667             992.1667
#> 164             960.0000              837.5833             837.5833
#> 165             737.9167              721.4167             643.8333
#> 166            1862.8333             1726.9167            1292.8333
#> 167            1346.2500             1112.5833             783.7500
#> 168             881.2500              784.6667             550.6667
#> 169            1168.6667              734.7500             527.5000
#> 170             914.0000              818.3333             641.6667
#> 171            1223.5833             1168.1667             902.0833
#> 172            3185.1667             2954.5000            1622.9167
#> 173             998.6667              769.7500             715.6667
#> 174             874.4167              715.0000             715.0000
#> 175             170.3333              124.5000             124.5000
#> 176            1478.5000             1319.7500             773.2500
#> 177             538.3333              554.0000             440.5833
#> 178             604.4167              527.3333             527.3333
#> 179            1779.2500             1562.5000             656.7500
#> 180             470.5833              383.0000             383.0000
#> 181            1340.5000             1459.0833            1164.9167
#> 182             987.1667              829.2500             723.9167
#> 183            2058.3333             3098.5000            1616.5833
#> 184            3288.4167             2898.8333            1681.6667
#> 185            1054.5833             1088.0833             604.8333
#> 186            2623.5000             3105.1667            1789.0000
#> 187            1752.9167             1258.1667            1123.1667
#> 188            1214.4167              914.4167             904.7500
#> 189             525.5833              423.9167             387.0000
#> 190            1434.3333             1289.2500            1141.0000
#> 191             766.5000              800.4167             668.8333
#> 192            1214.4167             1062.0833             991.4167
#> 193             997.9167              945.4167             631.2500
#> 194            1272.3333             1667.8333            1017.5000
#> 195             943.7500              823.4167             823.4167
#> 196             666.7500              628.5000             581.7500
#> 197            2942.9167             2786.8333            1109.5000
#> 198            1143.6667              997.8333             997.8333
#> 199            2760.8333             2459.0833            1992.8333
#> 200             782.0000              733.0833             588.0000
#> 201            1538.4167             1447.0833            1010.1667
#> 202            1790.3333             1448.8333             801.4167
#> 203            1166.3333             1132.5000             648.0833
#> 204            1031.7500             1002.3333             570.2500
#> 205            1809.5833             1821.9167             895.7500
#> 206             958.5833              813.5833             638.2500
#> 207            1131.3333             1013.3333             528.3333
#> 208            1156.9167              941.6667             825.3333
#> 209             481.5000              378.2500             378.2500
#> 210             611.3333              589.3333             533.3333
#> 211            1630.4167             1358.7500            1147.7500
#> 212             799.1667              710.8333             547.7500
#> 213            2109.8333             1876.7500            1656.5833
#> 214             483.5833              431.1667             396.8333
#> 215            1563.0833             1360.1667            1360.1667
#> 216             813.5000              664.4167             473.3333
#> 217            1459.6667             1142.7500            1075.3333
#> 218            1576.3333             1537.1667             933.5833
#> 219             728.0000              755.5000             635.1667
#> 220            1806.9167             1391.4167            1292.6667
#> 221            1741.1667             2188.6667             402.5000
#> 222             551.9167              463.6667             429.0000
#> 223             291.8333              254.6667             254.6667
#> 224            1301.8333             1340.1667            1135.8333
#> 225             860.7500              774.7500             730.2500
#> 226            2037.4167             1679.7500             982.9167
#> 227            1063.6667             1014.6667             928.0000
#> 228            1142.2500             1085.6667             996.6667
#> 229             581.5833              549.0000             267.4167
#> 230             226.6667              197.7500             197.7500
#> 231            2421.4167             2306.5833            1676.9167
#> 232            1436.6667             1469.0000            1133.2500
#> 233             919.0000              847.4167             764.9167
#> 234            2811.2500             1479.5833            1319.3333
#> 235             597.9167              525.2500             446.4167
#> 236             725.6667              788.5833             633.0833
#> 237             880.3333              768.0000             768.0000
#> 238             518.7500              388.5833             305.5833
#> 239             396.5833              384.1667             346.0000
#> 240            2050.5000             1223.8333             993.2500
#> 241            1129.9167             1096.9167             985.9167
#> 242             483.7500              443.0833             422.0833
#> 243            1197.3333              960.5833             960.5833
#> 244            1224.4167             1284.2500            1068.2500
#> 245             305.1667              282.3333             266.2500
#> 246             914.9167              798.2500             798.2500
#> 247             412.2500              350.7500             337.2500
#> 248            1827.5000             1824.0833             882.9167
#> 249             696.5833              557.5000             445.9167
#> 250            1786.1667             1558.5000            1558.5000
#> 251            2147.5000             2460.2500            1873.6667
#> 252             527.1667              473.3333             460.0000
#> 253             805.8333              798.0000             703.0833
#> 254            1880.5833             1666.0000            1547.0000
#> 255            1238.3333             1196.7500            1080.5000
#> 256             772.9167              674.0833             604.0000
#> 257            1289.5000             1193.3333            1082.5000
#> 258             443.4167              371.9167             371.9167
#> 259             843.0833              965.5000             665.5000
#> 260             275.3333              251.0833             240.2500
#> 261            1671.8333             1458.6667            1458.6667
#> 262            1801.6667             1283.9167             520.5833
#> 263            1360.9167             1119.9167             946.1667
#> 264            1876.6667             1838.0000            1190.0833
#> 265             914.8333             1055.6667             798.1667
#> 266             286.6667              309.2500             219.0000
#> 267             429.2500              398.8333             374.5833
#> 268            2341.5000             2131.5833            1117.7500
#> 269            1492.5833             1092.7500             859.5000
#> 270             686.2500              598.7500             598.7500
#> 271             589.9167              617.5000             514.7500
#> 272             796.7500              695.1667             695.1667
#> 273             861.3333              706.5000             588.3333
#> 274            1004.9167              948.0833             876.7500
#> 275             755.5833              770.1667             659.1667
#> 276             962.5833              925.9167             839.9167
#> 277            1529.0833             1315.0000             861.2500
#> 278             639.0833              707.6667             300.5833
#> 279             403.3333              344.2500             320.5833
#> 280            1242.5000             1084.1667            1084.1667
#> 281             623.2500              577.2500             543.7500
#> 282            1026.6667              892.5000             499.6667
#> 283             427.8333              373.1667             373.1667
#> 284            3438.9167             3628.2500            1210.6667
#> 285             591.5000              593.4167             516.0000
#> 286            2260.3333             2040.4167            1306.5833
#> 287            1239.5000             1050.8333             941.2500
#> 288             560.7500              489.2500             489.2500
#> 289            1055.0000              979.5833             587.1667
#> 290             429.8333              375.0833             375.0833
#> 291             865.7500              921.8333             496.0833
#> 292            1017.6667              468.7500             468.7500
#> 293            1033.5000              926.5000             506.3333
#> 294            1320.5833             1708.0833             652.0833
#> 295            1236.9167             1106.1667            1079.2500
#> 296            1135.7500              913.5833             853.7500
#> 297            1241.4167             1083.1667            1083.1667
#> 298            1249.9167             1083.0833             996.6667
#> 299             682.0000              629.9167             595.0833
#> 300             521.2500              482.3333             436.5833
#> 301            1899.6667             1667.4167            1082.1667
#> 302             503.5000              519.7500             409.5000
#> 303             503.5000              519.7500             409.5000
#> 304            1108.8333             1031.0833             582.8333
#> 305            1108.8333             1031.0833             582.8333
#> 306             958.8333             1148.9167             510.8333
#> 307             727.8333              648.3333             616.3333
#> 308            1404.7500             1430.9167            1075.5000
#> 309             781.8333              710.8333             682.1667
#> 310            1830.9167             1727.1667             553.7500
#> 311            1560.1667             1611.2500            1070.2500
#> 312             658.1667              574.2500             574.2500
#> 313            1410.9167             1203.4167            1076.5833
#> 314            1152.8333              858.2500             618.2500
#> 315             782.2500              889.1667             682.5833
#> 316             438.7500              393.6667             382.8333
#> 317            1594.9167             1281.4167            1068.2500
#> 318            1205.5000              715.3333             526.0833
#> 319            1218.8333             1174.2500            1063.5000
#> 320            1278.9167             1467.7500             651.6667
#> 321             609.7500              655.2500             532.0000
#> 322             840.3333              744.8333             733.1667
#> 323             877.3333              835.5000             765.4167
#> 324            1501.8333             1310.3333            1310.3333
#> 325             576.7500              503.1667             503.1667
#> 326            2047.5833             1858.1667            1707.0833
#> 327            1533.6667             1201.1667             540.4167
#> 328            1048.2500             1180.3333             914.6667
#> 329            1528.8333             1785.5000            1333.9167
#> 330            1036.5000             1012.0000             904.3333
#> 331             406.3333              354.5000             354.5000
#> 332             447.0833              560.2500             390.0833
#> 333             578.4167              496.2500             434.0833
#> 334             680.7500              707.9167             594.0000
#> 335             444.7500              388.0833             388.0833
#> 336             306.6667              275.3333             264.2500
#> 337            1378.5000             1372.8333             816.0833
#> 338             633.2500              392.6667             292.5833
#> 339            1689.5833             2102.1667            1474.1667
#> 340            1544.0833             1559.6667            1171.4167
#> 341             653.1667              604.4167             569.8333
#> 342            1125.5000             1035.5000             928.3333
#> 343            2511.8333             2322.0000            2191.5833
#> 344            1483.3333             1294.2500            1294.2500
#> 345            2587.0000             1818.0833            1368.7500
#> 346             449.0833              454.9167             391.8333
#> 347            1084.5833             1024.5833             926.8333
#> 348            1104.5833             1137.5000             963.8333
#> 349            1304.1667             1137.9167            1137.9167
#> 350            1254.0833              844.9167             606.5833
#> 351             985.5833              993.9167             860.0000
#> 352             584.0000              640.4167             509.5833
#> 353             305.4167              266.4167             266.4167
#> 354             938.1667              907.6667             733.5833
#> 355             816.5000              825.5000             608.3333
#> 356            1018.3333              911.0833             798.0000
#> 357            1043.9167              900.1667             787.0833
#> 358             674.4167              623.3333             215.7500
#> 359             599.2500              633.5833             346.6667
#> 360            1770.1667             1256.5833             608.7500
#> 361            1395.9167             1709.0000            1217.9167
#> 362            1571.8333             1203.4167             940.4167
#> 363             835.1667              826.9167             619.6667
#> 364             774.6667              675.8333             675.8333
#> 365            1676.2500             1546.1667            1245.0833
#> 366             600.7500              601.0833             524.0833
#> 367             969.7500              846.1667             846.1667
#> 368            1003.3333              617.6667             526.6667
#> 369            1827.9167             1094.7500             640.6667
#> 370             512.5833              398.0833             313.4167
#> 371             610.6667              532.8333             532.8333
#> 372             344.5833              300.6667             300.6667
#> 373             911.6667             1071.3333             462.4167
#> 374            1630.7500             1623.7500            1245.3333
#> 375            1158.5000             1165.8333             841.4167
#> 376             542.4167              512.5000             473.2500
#> 377            1291.9167             1409.7500            1086.0000
#> 378             998.0000              827.5000             637.0833
#> 379            1101.7500              763.5000             708.7500
#> 380             669.1667              539.7500             451.9167
#> 381             920.6667              859.6667             732.9167
#> 382             910.5000             1099.0833             793.5833
#> 383             794.0000              727.9167             692.6667
#> 384             874.2500              769.6667             573.5000
#> 385            1473.5000             1585.0833            1210.0833
#> 386            1519.2500             1516.7500            1229.6667
#> 387            1433.5000             1262.4167             596.0833
#> 388            1460.5000             1508.5833            1274.2500
#> 389             712.1667              709.6667             499.6667
#> 390             907.3333              855.4167             708.8333
#> 391             664.7500              580.5833             515.1667
#> 392            1107.3333             1043.6667             966.2500
#> 393            1240.7500             1082.5000            1082.5000
#> 394             605.2500              525.9167             525.9167
#> 395             433.8333              485.1667             291.1667
#> 396            1221.8333             1066.0833            1066.0833
#> 397            1614.5833             1668.4167            1292.9167
#> 398             607.7500              558.2500             506.0833
#> 399            1310.4167             1181.5000            1009.9167
#> 400             454.0000              380.3333             366.7500
#> 401            2088.1667             1804.5000            1671.6667
#> 402             757.5833              609.0000             523.5833
#> 403            2119.5833             1714.5000            1570.4167
#> 404             783.4167              678.0833             533.0833
#> 405             807.8333              690.7500             658.6667
#> 406             475.3333              436.8333             414.7500
#> 407            1505.9167             1313.9167            1313.9167
#> 408             997.1667             1030.1667             646.0000
#> 409             852.8333              744.0833             744.0833
#> 410            1696.2500             1265.1667            1198.5833
#> 411             574.0833              575.4167             500.8333
#> 412            1246.2500             1087.3333            1087.3333
#> 413             696.9167              519.7500             401.8333
#> 414             618.2500              635.3333             435.8333
#> 415            1109.9167             1008.7500             628.5833
#> 416            1116.6667              932.6667             775.7500
#> 417            1803.6667             1573.7500            1573.7500
#> 418             409.1667              357.0000             357.0000
#> 419             444.5000              507.7500             387.8333
#> 420             402.5833              379.6667             336.8333
#> 421             512.2500              457.5833             266.9167
#> 422             986.3333              979.3333             860.5833
#> 423             595.6667              514.9167             513.0833
#> 424             883.7500              768.5000             632.3333
#> 425             548.0833              494.1667             382.2500
#> 426            1013.9167              839.5000             520.5000
#> 427             976.1667              951.8333             851.7500
#> 428            2464.1667             1657.2500            1207.6667
#> 429            2080.0833             1825.5833            1130.2500
#> 430            1972.4167             2110.9167             955.5000
#> 431            1627.3333             1408.7500            1137.5833
#> 432             672.9167              660.8333             587.1667
#> 433             376.0000              492.8333             293.5000
#> 434            1226.9167             1070.4167            1070.4167
#> 435            3226.3333             2358.0833             614.3333
#> 436            1270.0833             1285.6667             508.3333
#> 437             508.7500              657.1667             243.5833
#> 438             964.4167              606.5000             575.3333
#> 439            2446.8333             2231.4167             555.2500
#> 440             529.9167              534.7500             348.9167
#> 441             575.0833              626.5833             352.0000
#> 442             802.0833              664.1667             350.8333
#> 443             911.8333              834.4167             679.6667
#> 444             752.9167              755.0000             656.9167
#> 445             670.3333              586.2500             584.8333
#> 446             404.3333              390.8333             339.0833
#> 447            1874.3333             1096.6667            1022.6667
#> 448             780.7500              749.5833             644.9167
#> 449             575.9167              681.0833             489.0833
#> 450             608.4167              582.9167             530.8333
#> 451            1160.0833             1081.0833             853.2500
#> 452             523.0833              892.3333             456.4167
#> 453            1540.4167             1684.0833            1177.4167
#> 454             923.8333              806.0833             806.0833
#> 455             975.3333              921.1667             850.9167
#> 456            4447.8333             3770.9167            2432.2500
#> 457             542.7500              705.0833             443.1667
#> 458            1149.7500             1107.0833             989.2500
#> 459             743.7500              819.2500             649.0000
#> 460             905.8333              790.2500             790.2500
#> 461            1158.5000             1070.7500            1010.7500
#> 462            5075.1667             4974.9167            1491.5000
#> 463             759.7500              783.9167             470.8333
#> 464            1439.7500             1433.4167             842.0833
#> 465            2240.6667             1493.6667             577.0833
#> 466             629.5000              656.1667             549.2500
#> 467            2038.3333             1857.6667            1540.5000
#> 468             796.0000              709.0833             667.4167
#> 469             493.0000              430.1667             430.1667
#> 470             443.3333              476.8333             386.7500
#> 471             880.8333              806.7500             759.6667
#> 472            1492.4167             1108.8333            1108.8333
#> 473             535.7500              481.0000             432.0833
#> 474             499.8333              438.2500             394.1667
#> 475             453.6667              415.0833             316.4167
#> 476            1065.2500              986.5833             929.4167
#> 477             369.6667              322.5833             322.5833
#> 478            1296.0000              965.3333             965.3333
#> 479             569.0833              522.8333             490.0833
#> 480            1747.6667             2026.7500            1487.5833
#> 481             614.5833              608.9167             527.6667
#> 482            1735.3333             1462.0000            1129.9167
#> 483             894.0000             1009.5833             703.0000
#> 484             899.7500              537.0833             537.0833
#> 485             918.1667              788.0000             725.9167
#> 486             987.1667              793.7500             316.3333
#> 487             946.1667              980.2500             421.6667
#> 488             670.0000              720.9167             343.0833
#> 489             503.7500              519.7500             390.1667
#> 490            1465.0833             1583.0833            1232.5000
#> 491             346.9167              317.9167             289.0000
#> 492            1286.1667             1182.2500            1122.1667
#> 493            2107.0000             2053.0000             514.9167
#> 494             651.0000              568.0000             568.0000
#> 495             915.1667              681.3333             434.7500
#> 496             520.5833              474.5833             454.2500
#> 497             812.6667              704.3333             620.4167
#> 498            1145.7500             1131.1667             983.0833
#> 499             612.2500              900.9167             511.5833
#> 500             500.8333              464.4167             437.0000
#> 501             888.2500              843.8333             775.0000
#> 502             886.5000              936.5833             300.5833
#> 503             339.3333              328.2500             296.0000
#> 504             343.2500              319.8333             299.5000
#> 505            1358.0833             1507.6667            1073.8333
#> 506             714.3333              643.0833             406.0000
#> 507            1297.6667              827.2500             420.3333
#> 508             618.5000              569.7500             475.5000
#> 509            2923.0000             2963.9167             643.1667
#> 510             598.7500              797.5833             369.9167
#> 511            2324.0000             2049.3333             811.8333
#> 512             529.7500              470.0833             412.1667
#> 513             909.0000              837.3333             631.6667
#> 514             984.0000             1075.8333             594.5000
#> 515            2017.5833             1939.2500             623.7500
#> 516            1598.1667             1635.4167             428.2500
#> 517            2984.5833             4022.3333             586.2500
#> 518            6948.6667            12977.5833            1145.0833
#> 519            1389.0000             1575.5000             583.0000
#> 520             707.4167              624.0833             617.2500
#> 521            1169.0000             1593.3333             879.3333
#> 522             850.0000              546.5833             452.4167
#> 523             437.8333              411.4167             315.3333
#>       orgunitlevel6
#> 1             Isiro
#> 2         Gbadolite
#> 3               Aru
#> 4               Aru
#> 5              Buta
#> 6           Butembo
#> 7             Kindu
#> 8              Buta
#> 9               Aru
#> 10           Kabalo
#> 11              Aru
#> 12              Aru
#> 13              Aru
#> 14        Kisangani
#> 15        Kisangani
#> 16         Bandundu
#> 17           Bukavu
#> 18           Kamina
#> 19             Goma
#> 20            Bunia
#> 21        Kisangani
#> 22   Kinshasa Ouest
#> 23         Bandundu
#> 24         Tshikapa
#> 25           Gemena
#> 26           Inongo
#> 27   Kinshasa Ouest
#> 28           Lokutu
#> 29         Mbandaka
#> 30           Lokutu
#> 31           Boende
#> 32            Lodja
#> 33          Kananga
#> 34          Kananga
#> 35        Kisangani
#> 36          Butembo
#> 37       Mbuji Mayi
#> 38          Butembo
#> 39         Mbandaka
#> 40             Buta
#> 41        Gbadolite
#> 42             Buta
#> 43        Gbadolite
#> 44          Kananga
#> 45           Lisala
#> 46             Goma
#> 47   Kinshasa Ouest
#> 48   Kinshasa Ouest
#> 49       Mbuji Mayi
#> 50             Goma
#> 51              Aru
#> 52     Kinshasa Est
#> 53          Kananga
#> 54           Boende
#> 55            Bunia
#> 56           Gemena
#> 57            Kenge
#> 58    Mbanza Ngungu
#> 59           Gemena
#> 60            Nioki
#> 61          Bokungu
#> 62         Mbandaka
#> 63            Nioki
#> 64         Mbandaka
#> 65             Boma
#> 66             Boma
#> 67            Isiro
#> 68           Gemena
#> 69         Mbandaka
#> 70             Buta
#> 71           Lisala
#> 72       Mbuji Mayi
#> 73           Lisala
#> 74           Lisala
#> 75            Nioki
#> 76        Gbadolite
#> 77           Lisala
#> 78           Gemena
#> 79           Gemena
#> 80   Kabondo Dianda
#> 81            Mweka
#> 82           Gemena
#> 83           Kikwit
#> 84            Bumba
#> 85  Kinshasa Centre
#> 86            Bunia
#> 87          Kolwezi
#> 88          Kananga
#> 89           Bukavu
#> 90          Bokungu
#> 91        Gbadolite
#> 92             Buta
#> 93          Butembo
#> 94   Kabondo Dianda
#> 95           Gemena
#> 96       Mbuji Mayi
#> 97       Mbuji Mayi
#> 98            Bunia
#> 99            Mweka
#> 100         Kananga
#> 101         Kananga
#> 102      Mbuji Mayi
#> 103         Tshumbe
#> 104         Kolwezi
#> 105         Kisenge
#> 106      Mbuji Mayi
#> 107           Lodja
#> 108          Boende
#> 109        Mbandaka
#> 110        Bandundu
#> 111           Isiro
#> 112           Bunia
#> 113           Isiro
#> 114           Isiro
#> 115           Bunia
#> 116          Lubutu
#> 117           Kenge
#> 118           Uvira
#> 119         Kolwezi
#> 120            Buta
#> 121       Gbadolite
#> 122          Gemena
#> 123           Bunia
#> 124            Goma
#> 125           Isiro
#> 126  Kinshasa Ouest
#> 127   Mbanza Ngungu
#> 128          Kikwit
#> 129           Uvira
#> 130          Bukavu
#> 131        Mbandaka
#> 132          Kikwit
#> 133          Bukavu
#> 134         Bokungu
#> 135           Mweka
#> 136          Matadi
#> 137        Mbandaka
#> 138          Inongo
#> 139          Kikwit
#> 140        Mbandaka
#> 141          Lokutu
#> 142           Isiro
#> 143            Goma
#> 144           Uvira
#> 145           Bunia
#> 146          Kabalo
#> 147         Kasongo
#> 148          Bukavu
#> 149      Mbuji Mayi
#> 150         Kabinda
#> 151       Kisangani
#> 152  Kabondo Dianda
#> 153          Kamina
#> 154          Bukavu
#> 155         Kisenge
#> 156      Lubumbashi
#> 157         Kahemba
#> 158           Kindu
#> 159         Kahemba
#> 160           Mweka
#> 161         Kisenge
#> 162         Kabinda
#> 163 Kinshasa Centre
#> 164 Kinshasa Centre
#> 165          Bukavu
#> 166         Kalemie
#> 167       Mweneditu
#> 168           Kindu
#> 169          Bukavu
#> 170           Luiza
#> 171         Kabinda
#> 172        Tshikapa
#> 173          Bukavu
#> 174         Butembo
#> 175      Lubumbashi
#> 176         Kabinda
#> 177         Butembo
#> 178             Aru
#> 179          Likasi
#> 180       Mweneditu
#> 181          Kamina
#> 182          Bukavu
#> 183        Tshikapa
#> 184      Lubumbashi
#> 185         Kasongo
#> 186        Tshikapa
#> 187         Kananga
#> 188       Mweneditu
#> 189            Boma
#> 190          Kamina
#> 191          Bukavu
#> 192      Mbuji Mayi
#> 193         Kalemie
#> 194        Tshikapa
#> 195         Kolwezi
#> 196         Kisenge
#> 197          Likasi
#> 198       Gbadolite
#> 199            Goma
#> 200 Kinshasa Centre
#> 201         Kisenge
#> 202      Mbuji Mayi
#> 203      Lubumbashi
#> 204      Lubumbashi
#> 205         Kasongo
#> 206           Kenge
#> 207           Lodja
#> 208          Bukavu
#> 209         Kananga
#> 210         Kananga
#> 211            Goma
#> 212      Lubumbashi
#> 213         Butembo
#> 214          Kamina
#> 215            Goma
#> 216          Bukavu
#> 217           Kenge
#> 218      Lubumbashi
#> 219          Kabalo
#> 220            Goma
#> 221         Kasongo
#> 222            Goma
#> 223          Matadi
#> 224    Kinshasa Est
#> 225        Bandundu
#> 226          Likasi
#> 227          Kikwit
#> 228          Kikwit
#> 229          Likasi
#> 230           Bunia
#> 231      Lubumbashi
#> 232    Kinshasa Est
#> 233           Kenge
#> 234           Uvira
#> 235   Mbanza Ngungu
#> 236   Mbanza Ngungu
#> 237          Kikwit
#> 238   Mbanza Ngungu
#> 239          Kamina
#> 240           Kindu
#> 241 Kinshasa Centre
#> 242          Kikwit
#> 243    Kinshasa Est
#> 244  Kabondo Dianda
#> 245            Boma
#> 246  Kinshasa Ouest
#> 247  Kinshasa Ouest
#> 248      Lubumbashi
#> 249          Inongo
#> 250            Goma
#> 251      Lubumbashi
#> 252         Kahemba
#> 253   Mbanza Ngungu
#> 254 Kinshasa Centre
#> 255        Tshikapa
#> 256           Kenge
#> 257          Kamina
#> 258            Boma
#> 259          Bukavu
#> 260            Boma
#> 261  Kinshasa Ouest
#> 262           Lodja
#> 263           Bunia
#> 264          Kabalo
#> 265          Kikwit
#> 266      Lubumbashi
#> 267            Boma
#> 268         Kasongo
#> 269          Gemena
#> 270           Nioki
#> 271   Mbanza Ngungu
#> 272         Butembo
#> 273             Aru
#> 274 Kinshasa Centre
#> 275           Uvira
#> 276          Gemena
#> 277          Likasi
#> 278            Buta
#> 279        Mbandaka
#> 280 Kinshasa Centre
#> 281           Bunia
#> 282          Boende
#> 283  Kinshasa Ouest
#> 284          Lisala
#> 285           Bunia
#> 286           Lodja
#> 287             Aru
#> 288       Gbadolite
#> 289           Bumba
#> 290           Bunia
#> 291           Lodja
#> 292        Mbandaka
#> 293       Kisangani
#> 294         Kolwezi
#> 295           Luiza
#> 296         Kabinda
#> 297         Butembo
#> 298      Mbuji Mayi
#> 299         Kananga
#> 300         Kolwezi
#> 301      Lubumbashi
#> 302         Kananga
#> 303       Kisangani
#> 304         Kananga
#> 305       Kisangani
#> 306          Lubutu
#> 307         Kabinda
#> 308           Mweka
#> 309           Luiza
#> 310      Lubumbashi
#> 311      Mbuji Mayi
#> 312        Mbandaka
#> 313         Kananga
#> 314            Boma
#> 315          Bukavu
#> 316          Matadi
#> 317       Mweneditu
#> 318           Lodja
#> 319          Kikwit
#> 320         Kasongo
#> 321  Kabondo Dianda
#> 322         Butembo
#> 323             Aru
#> 324 Kinshasa Centre
#> 325        Mbandaka
#> 326       Kisangani
#> 327           Watsa
#> 328       Mweneditu
#> 329  Kabondo Dianda
#> 330    Kinshasa Est
#> 331    Kinshasa Est
#> 332           Bunia
#> 333        Mbandaka
#> 334           Bunia
#> 335           Bunia
#> 336          Matadi
#> 337       Kisangani
#> 338         Butembo
#> 339         Kolwezi
#> 340          Kabalo
#> 341         Butembo
#> 342          Kikwit
#> 343    Kinshasa Est
#> 344    Kinshasa Est
#> 345            Goma
#> 346   Mbanza Ngungu
#> 347           Luiza
#> 348          Matadi
#> 349 Kinshasa Centre
#> 350          Gemena
#> 351        Mbandaka
#> 352   Mbanza Ngungu
#> 353          Gemena
#> 354          Kabalo
#> 355      Mbuji Mayi
#> 356         Kananga
#> 357           Mweka
#> 358          Inongo
#> 359           Uvira
#> 360         Tshumbe
#> 361          Bukavu
#> 362          Bukavu
#> 363          Likasi
#> 364          Kikwit
#> 365         Kalemie
#> 366       Gbadolite
#> 367          Kikwit
#> 368          Boende
#> 369         Bokungu
#> 370            Buta
#> 371           Bunia
#> 372        Mbandaka
#> 373          Boende
#> 374  Kinshasa Ouest
#> 375  Kinshasa Ouest
#> 376          Kikwit
#> 377      Mbuji Mayi
#> 378            Boma
#> 379          Bukavu
#> 380         Kananga
#> 381          Likasi
#> 382  Kabondo Dianda
#> 383          Kikwit
#> 384      Mbuji Mayi
#> 385  Kabondo Dianda
#> 386         Kabinda
#> 387          Bukavu
#> 388      Lubumbashi
#> 389          Kikwit
#> 390           Mweka
#> 391           Nioki
#> 392         Butembo
#> 393        Tshikapa
#> 394         Kananga
#> 395         Kolwezi
#> 396         Butembo
#> 397      Mbuji Mayi
#> 398          Bukavu
#> 399           Mweka
#> 400           Kenge
#> 401       Mweneditu
#> 402          Bukavu
#> 403            Goma
#> 404          Gemena
#> 405         Kananga
#> 406         Kananga
#> 407    Kinshasa Est
#> 408           Mweka
#> 409 Kinshasa Centre
#> 410         Kabinda
#> 411   Mbanza Ngungu
#> 412 Kinshasa Centre
#> 413           Bunia
#> 414           Isiro
#> 415           Nioki
#> 416           Bunia
#> 417    Kinshasa Est
#> 418   Mbanza Ngungu
#> 419          Matadi
#> 420          Inongo
#> 421        Mbandaka
#> 422           Uvira
#> 423        Tshikapa
#> 424          Bukavu
#> 425           Bunia
#> 426          Bukavu
#> 427             Aru
#> 428         Kalemie
#> 429            Goma
#> 430         Kalemie
#> 431      Mbuji Mayi
#> 432          Matadi
#> 433          Lubutu
#> 434         Butembo
#> 435           Lodja
#> 436       Kisangani
#> 437       Kisangani
#> 438          Inongo
#> 439           Lodja
#> 440          Likasi
#> 441           Kindu
#> 442         Tshumbe
#> 443         Kahemba
#> 444           Isiro
#> 445          Kikwit
#> 446          Inongo
#> 447          Lisala
#> 448            Goma
#> 449            Buta
#> 450  Kinshasa Ouest
#> 451           Kenge
#> 452          Lubutu
#> 453      Lubumbashi
#> 454           Bunia
#> 455             Aru
#> 456      Lubumbashi
#> 457           Isiro
#> 458            Goma
#> 459           Uvira
#> 460           Bunia
#> 461            Goma
#> 462      Lubumbashi
#> 463         Kasongo
#> 464         Kisenge
#> 465         Kasongo
#> 466          Matadi
#> 467  Kinshasa Ouest
#> 468          Bukavu
#> 469        Bandundu
#> 470   Mbanza Ngungu
#> 471          Kamina
#> 472          Gemena
#> 473           Bunia
#> 474         Kahemba
#> 475            Buta
#> 476      Lubumbashi
#> 477            Boma
#> 478           Luiza
#> 479         Kananga
#> 480        Tshikapa
#> 481         Kananga
#> 482      Mbuji Mayi
#> 483      Mbuji Mayi
#> 484         Kabinda
#> 485       Kisangani
#> 486           Lodja
#> 487         Tshumbe
#> 488         Kasongo
#> 489       Kisangani
#> 490           Uvira
#> 491            Boma
#> 492        Bandundu
#> 493           Lodja
#> 494      Lubumbashi
#> 495            Buta
#> 496         Butembo
#> 497            Goma
#> 498          Bukavu
#> 499           Isiro
#> 500           Kenge
#> 501        Mbandaka
#> 502       Kisangani
#> 503       Gbadolite
#> 504       Gbadolite
#> 505           Watsa
#> 506          Boende
#> 507         Tshumbe
#> 508       Mweneditu
#> 509          Lokutu
#> 510       Kisangani
#> 511          Lokutu
#> 512       Gbadolite
#> 513       Kisangani
#> 514       Kisangani
#> 515         Bokungu
#> 516          Lokutu
#> 517           Bumba
#> 518           Bumba
#> 519           Bumba
#> 520           Luiza
#> 521          Kikwit
#> 522          Inongo
#> 523          Gemena

clean_names_dhis(vacc$orgunitlevel2,  has_prefix = 2,
                 suffix = "(Province|Zone de Sant[e\u00e9]|Aire de Sant[e\u00e9]|Centre de Sant[e\u00e9])")
#>   [1] "Haut Uele"      "Nord Ubangi"    "Ituri"          "Ituri"         
#>   [5] "Bas Uele"       "Nord Kivu"      "Maniema"        "Bas Uele"      
#>   [9] "Ituri"          "Tanganyika"     "Ituri"          "Ituri"         
#>  [13] "Ituri"          "Tshopo"         "Tshopo"         "Kwilu"         
#>  [17] "Sud Kivu"       "Haut Lomami"    "Nord Kivu"      "Ituri"         
#>  [21] "Tshopo"         "Kinshasa"       "Kwilu"          "Kasai"         
#>  [25] "Sud Ubangi"     "Maindombe"      "Kinshasa"       "Tshopo"        
#>  [29] "Equateur"       "Tshopo"         "Tshuapa"        "Sankuru"       
#>  [33] "Kasai Central"  "Kasai Central"  "Tshopo"         "Nord Kivu"     
#>  [37] "Kasai Oriental" "Nord Kivu"      "Equateur"       "Bas Uele"      
#>  [41] "Bas Uele"       "Nord Ubangi"    "Nord Ubangi"    "Kasai Central" 
#>  [45] "Mongala"        "Nord Kivu"      "Kinshasa"       "Kinshasa"      
#>  [49] "Kasai Oriental" "Nord Kivu"      "Ituri"          "Kinshasa"      
#>  [53] "Kasai Central"  "Tshuapa"        "Ituri"          "Sud Ubangi"    
#>  [57] "Kwango"         "Kongo Central"  "Sud Ubangi"     "Maindombe"     
#>  [61] "Tshuapa"        "Equateur"       "Maindombe"      "Equateur"      
#>  [65] "Kongo Central"  "Kongo Central"  "Haut Uele"      "Sud Ubangi"    
#>  [69] "Equateur"       "Bas Uele"       "Mongala"        "Kasai Oriental"
#>  [73] "Mongala"        "Mongala"        "Maindombe"      "Nord Ubangi"   
#>  [77] "Mongala"        "Sud Ubangi"     "Sud Ubangi"     "Haut Lomami"   
#>  [81] "Kasai"          "Sud Ubangi"     "Kwilu"          "Mongala"       
#>  [85] "Kinshasa"       "Ituri"          "Lualaba"        "Kasai Central" 
#>  [89] "Sud Kivu"       "Tshuapa"        "Nord Ubangi"    "Bas Uele"      
#>  [93] "Nord Kivu"      "Haut Lomami"    "Sud Ubangi"     "Kasai Oriental"
#>  [97] "Kasai Oriental" "Ituri"          "Kasai"          "Kasai Central" 
#> [101] "Kasai Central"  "Kasai Oriental" "Sankuru"        "Lualaba"       
#> [105] "Lualaba"        "Kasai Oriental" "Sankuru"        "Tshuapa"       
#> [109] "Equateur"       "Kwilu"          "Haut Uele"      "Ituri"         
#> [113] "Haut Uele"      "Haut Uele"      "Ituri"          "Maniema"       
#> [117] "Kwango"         "Sud Kivu"       "Lualaba"        "Bas Uele"      
#> [121] "Nord Ubangi"    "Sud Ubangi"     "Ituri"          "Nord Kivu"     
#> [125] "Haut Uele"      "Kinshasa"       "Kongo Central"  "Kwilu"         
#> [129] "Sud Kivu"       "Sud Kivu"       "Equateur"       "Kwilu"         
#> [133] "Sud Kivu"       "Tshuapa"        "Kasai"          "Kongo Central" 
#> [137] "Equateur"       "Maindombe"      "Kwilu"          "Equateur"      
#> [141] "Tshopo"         "Haut Uele"      "Nord Kivu"      "Sud Kivu"      
#> [145] "Ituri"          "Tanganyika"     "Maniema"        "Sud Kivu"      
#> [149] "Kasai Oriental" "Lomami"         "Tshopo"         "Haut Lomami"   
#> [153] "Haut Lomami"    "Sud Kivu"       "Lualaba"        "Haut Katanga"  
#> [157] "Kwango"         "Maniema"        "Kwango"         "Kasai"         
#> [161] "Lualaba"        "Lomami"         "Kinshasa"       "Kinshasa"      
#> [165] "Sud Kivu"       "Tanganyika"     "Lomami"         "Maniema"       
#> [169] "Sud Kivu"       "Kasai Central"  "Lomami"         "Kasai"         
#> [173] "Sud Kivu"       "Nord Kivu"      "Haut Katanga"   "Lomami"        
#> [177] "Nord Kivu"      "Ituri"          "Haut Katanga"   "Lomami"        
#> [181] "Haut Lomami"    "Sud Kivu"       "Kasai"          "Haut Katanga"  
#> [185] "Maniema"        "Kasai"          "Kasai Central"  "Lomami"        
#> [189] "Kongo Central"  "Haut Lomami"    "Sud Kivu"       "Kasai Oriental"
#> [193] "Tanganyika"     "Kasai"          "Lualaba"        "Lualaba"       
#> [197] "Haut Katanga"   "Nord Ubangi"    "Nord Kivu"      "Kinshasa"      
#> [201] "Lualaba"        "Kasai Oriental" "Haut Katanga"   "Haut Katanga"  
#> [205] "Maniema"        "Kwango"         "Sankuru"        "Sud Kivu"      
#> [209] "Kasai Central"  "Kasai Central"  "Nord Kivu"      "Haut Katanga"  
#> [213] "Nord Kivu"      "Haut Lomami"    "Nord Kivu"      "Sud Kivu"      
#> [217] "Kwango"         "Haut Katanga"   "Tanganyika"     "Nord Kivu"     
#> [221] "Maniema"        "Nord Kivu"      "Kongo Central"  "Kinshasa"      
#> [225] "Kwilu"          "Haut Katanga"   "Kwilu"          "Kwilu"         
#> [229] "Haut Katanga"   "Ituri"          "Haut Katanga"   "Kinshasa"      
#> [233] "Kwango"         "Sud Kivu"       "Kongo Central"  "Kongo Central" 
#> [237] "Kwilu"          "Kongo Central"  "Haut Lomami"    "Maniema"       
#> [241] "Kinshasa"       "Kwilu"          "Kinshasa"       "Haut Lomami"   
#> [245] "Kongo Central"  "Kinshasa"       "Kinshasa"       "Haut Katanga"  
#> [249] "Maindombe"      "Nord Kivu"      "Haut Katanga"   "Kwango"        
#> [253] "Kongo Central"  "Kinshasa"       "Kasai"          "Kwango"        
#> [257] "Haut Lomami"    "Kongo Central"  "Sud Kivu"       "Kongo Central" 
#> [261] "Kinshasa"       "Sankuru"        "Ituri"          "Tanganyika"    
#> [265] "Kwilu"          "Haut Katanga"   "Kongo Central"  "Maniema"       
#> [269] "Sud Ubangi"     "Maindombe"      "Kongo Central"  "Nord Kivu"     
#> [273] "Ituri"          "Kinshasa"       "Sud Kivu"       "Sud Ubangi"    
#> [277] "Haut Katanga"   "Bas Uele"       "Equateur"       "Kinshasa"      
#> [281] "Ituri"          "Tshuapa"        "Kinshasa"       "Mongala"       
#> [285] "Ituri"          "Sankuru"        "Ituri"          "Nord Ubangi"   
#> [289] "Mongala"        "Ituri"          "Sankuru"        "Equateur"      
#> [293] "Tshopo"         "Lualaba"        "Kasai Central"  "Lomami"        
#> [297] "Nord Kivu"      "Kasai Oriental" "Kasai Central"  "Lualaba"       
#> [301] "Haut Katanga"   "Kasai Central"  "Kasai Central"  "Tshopo"        
#> [305] "Tshopo"         "Maniema"        "Lomami"         "Kasai"         
#> [309] "Kasai Central"  "Haut Katanga"   "Kasai Oriental" "Equateur"      
#> [313] "Kasai Central"  "Kongo Central"  "Sud Kivu"       "Kongo Central" 
#> [317] "Lomami"         "Sankuru"        "Kwilu"          "Maniema"       
#> [321] "Haut Lomami"    "Nord Kivu"      "Ituri"          "Kinshasa"      
#> [325] "Equateur"       "Tshopo"         "Haut Uele"      "Lomami"        
#> [329] "Haut Lomami"    "Kinshasa"       "Kinshasa"       "Ituri"         
#> [333] "Equateur"       "Ituri"          "Ituri"          "Kongo Central" 
#> [337] "Tshopo"         "Nord Kivu"      "Lualaba"        "Tanganyika"    
#> [341] "Nord Kivu"      "Kwilu"          "Kinshasa"       "Kinshasa"      
#> [345] "Nord Kivu"      "Kongo Central"  "Kasai Central"  "Kongo Central" 
#> [349] "Kinshasa"       "Sud Ubangi"     "Equateur"       "Kongo Central" 
#> [353] "Sud Ubangi"     "Tanganyika"     "Kasai Oriental" "Kasai Central" 
#> [357] "Kasai"          "Maindombe"      "Sud Kivu"       "Sankuru"       
#> [361] "Sud Kivu"       "Sud Kivu"       "Haut Katanga"   "Kwilu"         
#> [365] "Tanganyika"     "Nord Ubangi"    "Kwilu"          "Tshuapa"       
#> [369] "Tshuapa"        "Bas Uele"       "Ituri"          "Equateur"      
#> [373] "Tshuapa"        "Kinshasa"       "Kinshasa"       "Kwilu"         
#> [377] "Kasai Oriental" "Kongo Central"  "Sud Kivu"       "Kasai Central" 
#> [381] "Haut Katanga"   "Haut Lomami"    "Kwilu"          "Kasai Oriental"
#> [385] "Haut Lomami"    "Lomami"         "Sud Kivu"       "Haut Katanga"  
#> [389] "Kwilu"          "Kasai"          "Maindombe"      "Nord Kivu"     
#> [393] "Kasai"          "Kasai Central"  "Lualaba"        "Nord Kivu"     
#> [397] "Kasai Oriental" "Sud Kivu"       "Kasai"          "Kwango"        
#> [401] "Lomami"         "Sud Kivu"       "Nord Kivu"      "Sud Ubangi"    
#> [405] "Kasai Central"  "Kasai Central"  "Kinshasa"       "Kasai"         
#> [409] "Kinshasa"       "Lomami"         "Kongo Central"  "Kinshasa"      
#> [413] "Ituri"          "Haut Uele"      "Maindombe"      "Ituri"         
#> [417] "Kinshasa"       "Kongo Central"  "Kongo Central"  "Maindombe"     
#> [421] "Equateur"       "Sud Kivu"       "Kasai"          "Sud Kivu"      
#> [425] "Ituri"          "Sud Kivu"       "Ituri"          "Tanganyika"    
#> [429] "Nord Kivu"      "Tanganyika"     "Kasai Oriental" "Kongo Central" 
#> [433] "Maniema"        "Nord Kivu"      "Sankuru"        "Tshopo"        
#> [437] "Tshopo"         "Maindombe"      "Sankuru"        "Haut Katanga"  
#> [441] "Maniema"        "Sankuru"        "Kwango"         "Haut Uele"     
#> [445] "Kwilu"          "Maindombe"      "Mongala"        "Nord Kivu"     
#> [449] "Bas Uele"       "Kinshasa"       "Kwango"         "Maniema"       
#> [453] "Haut Katanga"   "Ituri"          "Ituri"          "Haut Katanga"  
#> [457] "Haut Uele"      "Nord Kivu"      "Sud Kivu"       "Ituri"         
#> [461] "Nord Kivu"      "Haut Katanga"   "Maniema"        "Lualaba"       
#> [465] "Maniema"        "Kongo Central"  "Kinshasa"       "Sud Kivu"      
#> [469] "Kwilu"          "Kongo Central"  "Haut Lomami"    "Sud Ubangi"    
#> [473] "Ituri"          "Kwango"         "Bas Uele"       "Haut Katanga"  
#> [477] "Kongo Central"  "Kasai Central"  "Kasai Central"  "Kasai"         
#> [481] "Kasai Central"  "Kasai Oriental" "Kasai Oriental" "Lomami"        
#> [485] "Tshopo"         "Sankuru"        "Sankuru"        "Maniema"       
#> [489] "Tshopo"         "Sud Kivu"       "Kongo Central"  "Kwilu"         
#> [493] "Sankuru"        "Haut Katanga"   "Bas Uele"       "Nord Kivu"     
#> [497] "Nord Kivu"      "Sud Kivu"       "Haut Uele"      "Kwango"        
#> [501] "Equateur"       "Tshopo"         "Nord Ubangi"    "Nord Ubangi"   
#> [505] "Haut Uele"      "Tshuapa"        "Sankuru"        "Lomami"        
#> [509] "Tshopo"         "Tshopo"         "Tshopo"         "Nord Ubangi"   
#> [513] "Tshopo"         "Tshopo"         "Tshuapa"        "Tshopo"        
#> [517] "Mongala"        "Mongala"        "Mongala"        "Kasai Central" 
#> [521] "Kwilu"          "Maindombe"      "Sud Ubangi"    
```

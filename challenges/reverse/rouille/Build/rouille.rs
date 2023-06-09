use std::process;

fn main() {
    let passwd = std::env::args().nth(1).expect("Usage ./chall <flag>");
    let mut state = [[0u8; 25]; 11];
    let mut beacon = 29104991u32;

    if passwd.chars().count() != 25 {
        println!("Nope !");
        process::exit(1);
    }

    while beacon != 0 {
        match beacon {
            29104991 => {state[1][6] = 160 ^ passwd.as_bytes()[6]; beacon = 34810493}
            34810493 => {state[3][3] = 243 ^ passwd.as_bytes()[3]; beacon = 40399072}
            40399072 => {state[5][14] = 231 ^ passwd.as_bytes()[14]; beacon = 42388800}
            42388800 => {state[10][23] = 95 ^ passwd.as_bytes()[23]; beacon = 45528402}
            45528402 => {state[1][10] = 164 ^ passwd.as_bytes()[10]; beacon = 56086874}
            56086874 => {state[5][10] = 111 ^ passwd.as_bytes()[10]; beacon = 81432515}
            81432515 => {state[4][3] = 69 ^ passwd.as_bytes()[3]; beacon = 133610560}
            133610560 => {state[8][10] = 127 ^ passwd.as_bytes()[10]; beacon = 153084046}
            153084046 => {state[2][7] = 0 ^ passwd.as_bytes()[7]; beacon = 163876438}
            163876438 => {state[2][21] = 42 ^ passwd.as_bytes()[21]; beacon = 176149912}
            176149912 => {state[10][5] = 194 ^ passwd.as_bytes()[5]; beacon = 204676338}
            204676338 => {state[8][3] = 233 ^ passwd.as_bytes()[3]; beacon = 206760909}
            206760909 => {state[3][1] = 82 ^ passwd.as_bytes()[1]; beacon = 218481519}
            218481519 => {state[6][12] = 53 ^ passwd.as_bytes()[12]; beacon = 222342037}
            222342037 => {state[6][15] = 151 ^ passwd.as_bytes()[15]; beacon = 225812774}
            225812774 => {state[2][18] = 22 ^ passwd.as_bytes()[18]; beacon = 311642894}
            311642894 => {state[5][18] = 163 ^ passwd.as_bytes()[18]; beacon = 312956275}
            312956275 => {state[8][23] = 174 ^ passwd.as_bytes()[23]; beacon = 326373356}
            326373356 => {state[3][0] = 146 ^ passwd.as_bytes()[0]; beacon = 349921564}
            349921564 => {state[5][3] = 142 ^ passwd.as_bytes()[3]; beacon = 383721053}
            383721053 => {state[8][1] = 251 ^ passwd.as_bytes()[1]; beacon = 386544690}
            386544690 => {state[5][17] = 33 ^ passwd.as_bytes()[17]; beacon = 397682459}
            397682459 => {state[6][8] = 215 ^ passwd.as_bytes()[8]; beacon = 399758997}
            399758997 => {state[0][1] = 230 ^ passwd.as_bytes()[1]; beacon = 400418617}
            400418617 => {state[3][16] = 223 ^ passwd.as_bytes()[16]; beacon = 407451152}
            407451152 => {state[3][21] = 111 ^ passwd.as_bytes()[21]; beacon = 419005411}
            419005411 => {state[9][18] = 145 ^ passwd.as_bytes()[18]; beacon = 422679729}
            422679729 => {state[1][1] = 239 ^ passwd.as_bytes()[1]; beacon = 433134870}
            433134870 => {state[9][21] = 170 ^ passwd.as_bytes()[21]; beacon = 438301428}
            438301428 => {state[1][16] = 162 ^ passwd.as_bytes()[16]; beacon = 455628820}
            455628820 => {state[5][11] = 231 ^ passwd.as_bytes()[11]; beacon = 458119539}
            458119539 => {state[3][18] = 166 ^ passwd.as_bytes()[18]; beacon = 497943994}
            497943994 => {state[4][16] = 47 ^ passwd.as_bytes()[16]; beacon = 501742901}
            501742901 => {state[7][12] = 203 ^ passwd.as_bytes()[12]; beacon = 517129434}
            517129434 => {state[8][7] = 133 ^ passwd.as_bytes()[7]; beacon = 520231500}
            520231500 => {state[10][4] = 17 ^ passwd.as_bytes()[4]; beacon = 526767619}
            526767619 => {state[0][12] = 30 ^ passwd.as_bytes()[12]; beacon = 542528720}
            542528720 => {state[8][11] = 113 ^ passwd.as_bytes()[11]; beacon = 552437235}
            552437235 => {state[5][7] = 63 ^ passwd.as_bytes()[7]; beacon = 558748747}
            558748747 => {state[1][13] = 248 ^ passwd.as_bytes()[13]; beacon = 574114369}
            574114369 => {state[10][1] = 123 ^ passwd.as_bytes()[1]; beacon = 599424218}
            599424218 => {state[9][20] = 50 ^ passwd.as_bytes()[20]; beacon = 603494171}
            603494171 => {state[10][14] = 239 ^ passwd.as_bytes()[14]; beacon = 609348257}
            609348257 => {state[2][5] = 197 ^ passwd.as_bytes()[5]; beacon = 612735312}
            612735312 => {state[6][10] = 182 ^ passwd.as_bytes()[10]; beacon = 613920231}
            613920231 => {state[10][15] = 132 ^ passwd.as_bytes()[15]; beacon = 629777804}
            629777804 => {state[7][3] = 161 ^ passwd.as_bytes()[3]; beacon = 634677055}
            634677055 => {state[4][1] = 27 ^ passwd.as_bytes()[1]; beacon = 656662133}
            656662133 => {state[1][22] = 146 ^ passwd.as_bytes()[22]; beacon = 669401812}
            669401812 => {state[7][16] = 86 ^ passwd.as_bytes()[16]; beacon = 682728373}
            682728373 => {state[10][7] = 145 ^ passwd.as_bytes()[7]; beacon = 695997836}
            695997836 => {state[9][23] = 30 ^ passwd.as_bytes()[23]; beacon = 701996759}
            701996759 => {state[4][20] = 227 ^ passwd.as_bytes()[20]; beacon = 705557825}
            705557825 => {state[6][2] = 41 ^ passwd.as_bytes()[2]; beacon = 706035333}
            706035333 => {state[9][22] = 160 ^ passwd.as_bytes()[22]; beacon = 707326733}
            707326733 => {state[8][14] = 30 ^ passwd.as_bytes()[14]; beacon = 713590382}
            713590382 => {state[5][23] = 170 ^ passwd.as_bytes()[23]; beacon = 723666574}
            723666574 => {state[2][22] = 186 ^ passwd.as_bytes()[22]; beacon = 784442922}
            784442922 => {state[9][4] = 78 ^ passwd.as_bytes()[4]; beacon = 785139561}
            785139561 => {state[8][19] = 4 ^ passwd.as_bytes()[19]; beacon = 803089360}
            803089360 => {state[0][16] = 17 ^ passwd.as_bytes()[16]; beacon = 832435675}
            832435675 => {state[0][15] = 48 ^ passwd.as_bytes()[15]; beacon = 848898170}
            848898170 => {state[5][1] = 246 ^ passwd.as_bytes()[1]; beacon = 881431513}
            881431513 => {state[4][22] = 111 ^ passwd.as_bytes()[22]; beacon = 882158348}
            882158348 => {state[0][24] = 110 ^ passwd.as_bytes()[24]; beacon = 885381367}
            885381367 => {state[1][24] = 24 ^ passwd.as_bytes()[24]; beacon = 889903814}
            889903814 => {state[6][9] = 151 ^ passwd.as_bytes()[9]; beacon = 889905022}
            889905022 => {state[6][23] = 3 ^ passwd.as_bytes()[23]; beacon = 900536788}
            900536788 => {state[3][13] = 191 ^ passwd.as_bytes()[13]; beacon = 911128619}
            911128619 => {state[4][5] = 118 ^ passwd.as_bytes()[5]; beacon = 912215573}
            912215573 => {state[7][23] = 161 ^ passwd.as_bytes()[23]; beacon = 913598336}
            913598336 => {state[7][6] = 252 ^ passwd.as_bytes()[6]; beacon = 948287654}
            948287654 => {state[8][16] = 232 ^ passwd.as_bytes()[16]; beacon = 948653577}
            948653577 => {state[2][8] = 69 ^ passwd.as_bytes()[8]; beacon = 957454588}
            957454588 => {state[2][19] = 62 ^ passwd.as_bytes()[19]; beacon = 972896251}
            972896251 => {state[1][18] = 11 ^ passwd.as_bytes()[18]; beacon = 975337008}
            975337008 => {state[8][12] = 11 ^ passwd.as_bytes()[12]; beacon = 1006705039}
            1006705039 => {state[0][22] = 102 ^ passwd.as_bytes()[22]; beacon = 1056607695}
            1056607695 => {state[9][16] = 3 ^ passwd.as_bytes()[16]; beacon = 1059809305}
            1059809305 => {state[7][19] = 4 ^ passwd.as_bytes()[19]; beacon = 1069032586}
            1069032586 => {state[6][5] = 118 ^ passwd.as_bytes()[5]; beacon = 1100153346}
            1100153346 => {state[9][7] = 0 ^ passwd.as_bytes()[7]; beacon = 1101973321}
            1101973321 => {state[10][3] = 47 ^ passwd.as_bytes()[3]; beacon = 1103728226}
            1103728226 => {state[8][17] = 111 ^ passwd.as_bytes()[17]; beacon = 1137006632}
            1137006632 => {state[0][20] = 218 ^ passwd.as_bytes()[20]; beacon = 1137883328}
            1137883328 => {state[8][6] = 189 ^ passwd.as_bytes()[6]; beacon = 1144082988}
            1144082988 => {state[1][20] = 146 ^ passwd.as_bytes()[20]; beacon = 1145062016}
            1145062016 => {state[4][7] = 0 ^ passwd.as_bytes()[7]; beacon = 1146761070}
            1146761070 => {state[7][18] = 97 ^ passwd.as_bytes()[18]; beacon = 1150751723}
            1150751723 => {state[7][21] = 85 ^ passwd.as_bytes()[21]; beacon = 1156074030}
            1156074030 => {state[3][4] = 150 ^ passwd.as_bytes()[4]; beacon = 1200136326}
            1200136326 => {state[9][0] = 57 ^ passwd.as_bytes()[0]; beacon = 1208306319}
            1208306319 => {state[8][8] = 202 ^ passwd.as_bytes()[8]; beacon = 1225922577}
            1225922577 => {state[6][13] = 254 ^ passwd.as_bytes()[13]; beacon = 1231146997}
            1231146997 => {state[1][3] = 143 ^ passwd.as_bytes()[3]; beacon = 1237504314}
            1237504314 => {state[10][0] = 112 ^ passwd.as_bytes()[0]; beacon = 1244497490}
            1244497490 => {state[0][23] = 52 ^ passwd.as_bytes()[23]; beacon = 1275634393}
            1275634393 => {state[6][14] = 148 ^ passwd.as_bytes()[14]; beacon = 1282789586}
            1282789586 => {state[10][20] = 96 ^ passwd.as_bytes()[20]; beacon = 1288399870}
            1288399870 => {state[3][20] = 154 ^ passwd.as_bytes()[20]; beacon = 1318431925}
            1318431925 => {state[10][17] = 93 ^ passwd.as_bytes()[17]; beacon = 1326372081}
            1326372081 => {state[4][6] = 75 ^ passwd.as_bytes()[6]; beacon = 1389830675}
            1389830675 => {state[2][20] = 89 ^ passwd.as_bytes()[20]; beacon = 1424315779}
            1424315779 => {state[1][23] = 170 ^ passwd.as_bytes()[23]; beacon = 1504561012}
            1504561012 => {state[3][7] = 211 ^ passwd.as_bytes()[7]; beacon = 1520115729}
            1520115729 => {state[2][14] = 28 ^ passwd.as_bytes()[14]; beacon = 1520308811}
            1520308811 => {state[6][3] = 76 ^ passwd.as_bytes()[3]; beacon = 1520600692}
            1520600692 => {state[8][5] = 118 ^ passwd.as_bytes()[5]; beacon = 1599805228}
            1599805228 => {state[9][15] = 88 ^ passwd.as_bytes()[15]; beacon = 1602284418}
            1602284418 => {state[2][16] = 153 ^ passwd.as_bytes()[16]; beacon = 1616208215}
            1616208215 => {state[3][12] = 184 ^ passwd.as_bytes()[12]; beacon = 1630400202}
            1630400202 => {state[1][17] = 126 ^ passwd.as_bytes()[17]; beacon = 1634943428}
            1634943428 => {state[4][24] = 77 ^ passwd.as_bytes()[24]; beacon = 1662797366}
            1662797366 => {state[9][13] = 111 ^ passwd.as_bytes()[13]; beacon = 1665197991}
            1665197991 => {state[5][13] = 85 ^ passwd.as_bytes()[13]; beacon = 1695801135}
            1695801135 => {state[8][15] = 48 ^ passwd.as_bytes()[15]; beacon = 1733277437}
            1733277437 => {state[10][13] = 219 ^ passwd.as_bytes()[13]; beacon = 1737540460}
            1737540460 => {state[6][16] = 178 ^ passwd.as_bytes()[16]; beacon = 1745403671}
            1745403671 => {state[7][10] = 187 ^ passwd.as_bytes()[10]; beacon = 1770234794}
            1770234794 => {state[8][20] = 106 ^ passwd.as_bytes()[20]; beacon = 1848681384}
            1848681384 => {state[0][6] = 178 ^ passwd.as_bytes()[6]; beacon = 1861240448}
            1861240448 => {state[0][9] = 66 ^ passwd.as_bytes()[9]; beacon = 1874915013}
            1874915013 => {state[6][20] = 172 ^ passwd.as_bytes()[20]; beacon = 1882326369}
            1882326369 => {state[2][6] = 11 ^ passwd.as_bytes()[6]; beacon = 1885076974}
            1885076974 => {state[4][19] = 209 ^ passwd.as_bytes()[19]; beacon = 1906825189}
            1906825189 => {state[8][4] = 87 ^ passwd.as_bytes()[4]; beacon = 1913548420}
            1913548420 => {state[4][10] = 111 ^ passwd.as_bytes()[10]; beacon = 1917906850}
            1917906850 => {state[7][5] = 118 ^ passwd.as_bytes()[5]; beacon = 1918054508}
            1918054508 => {state[6][18] = 93 ^ passwd.as_bytes()[18]; beacon = 1936588543}
            1936588543 => {state[5][4] = 125 ^ passwd.as_bytes()[4]; beacon = 1936847343}
            1936847343 => {state[6][1] = 194 ^ passwd.as_bytes()[1]; beacon = 1946100315}
            1946100315 => {state[5][0] = 6 ^ passwd.as_bytes()[0]; beacon = 1962992404}
            1962992404 => {state[2][4] = 134 ^ passwd.as_bytes()[4]; beacon = 1972265251}
            1972265251 => {state[1][15] = 197 ^ passwd.as_bytes()[15]; beacon = 1975929398}
            1975929398 => {state[2][10] = 111 ^ passwd.as_bytes()[10]; beacon = 1979038912}
            1979038912 => {state[2][11] = 207 ^ passwd.as_bytes()[11]; beacon = 1994041156}
            1994041156 => {state[4][4] = 125 ^ passwd.as_bytes()[4]; beacon = 2039308216}
            2039308216 => {state[5][15] = 89 ^ passwd.as_bytes()[15]; beacon = 2059644089}
            2059644089 => {state[3][5] = 43 ^ passwd.as_bytes()[5]; beacon = 2077834278}
            2077834278 => {state[1][8] = 211 ^ passwd.as_bytes()[8]; beacon = 2083125621}
            2083125621 => {state[5][24] = 125 ^ passwd.as_bytes()[24]; beacon = 2083945084}
            2083945084 => {state[0][2] = 246 ^ passwd.as_bytes()[2]; beacon = 2105602854}
            2105602854 => {state[8][9] = 62 ^ passwd.as_bytes()[9]; beacon = 2111043338}
            2111043338 => {state[1][14] = 202 ^ passwd.as_bytes()[14]; beacon = 2118762908}
            2118762908 => {state[5][8] = 69 ^ passwd.as_bytes()[8]; beacon = 2157958652}
            2157958652 => {state[0][7] = 0 ^ passwd.as_bytes()[7]; beacon = 2164510454}
            2164510454 => {state[8][18] = 227 ^ passwd.as_bytes()[18]; beacon = 2169930768}
            2169930768 => {state[7][20] = 112 ^ passwd.as_bytes()[20]; beacon = 2175372405}
            2175372405 => {state[3][10] = 111 ^ passwd.as_bytes()[10]; beacon = 2178066355}
            2178066355 => {state[4][14] = 88 ^ passwd.as_bytes()[14]; beacon = 2182295987}
            2182295987 => {state[10][9] = 228 ^ passwd.as_bytes()[9]; beacon = 2191961860}
            2191961860 => {state[8][24] = 217 ^ passwd.as_bytes()[24]; beacon = 2203001595}
            2203001595 => {state[0][3] = 39 ^ passwd.as_bytes()[3]; beacon = 2240345666}
            2240345666 => {state[3][9] = 114 ^ passwd.as_bytes()[9]; beacon = 2250009375}
            2250009375 => {state[0][13] = 100 ^ passwd.as_bytes()[13]; beacon = 2268927766}
            2268927766 => {state[4][9] = 190 ^ passwd.as_bytes()[9]; beacon = 2280586821}
            2280586821 => {state[10][12] = 110 ^ passwd.as_bytes()[12]; beacon = 2321356625}
            2321356625 => {state[6][22] = 104 ^ passwd.as_bytes()[22]; beacon = 2340971995}
            2340971995 => {state[0][0] = 83 ^ passwd.as_bytes()[0]; beacon = 2345267258}
            2345267258 => {state[4][15] = 33 ^ passwd.as_bytes()[15]; beacon = 2385641180}
            2385641180 => {state[9][5] = 118 ^ passwd.as_bytes()[5]; beacon = 2429301980}
            2429301980 => {state[1][12] = 114 ^ passwd.as_bytes()[12]; beacon = 2435190604}
            2435190604 => {state[0][19] = 186 ^ passwd.as_bytes()[19]; beacon = 2455593977}
            2455593977 => {state[7][1] = 57 ^ passwd.as_bytes()[1]; beacon = 2479110563}
            2479110563 => {state[4][11] = 127 ^ passwd.as_bytes()[11]; beacon = 2485267738}
            2485267738 => {state[6][4] = 101 ^ passwd.as_bytes()[4]; beacon = 2489248328}
            2489248328 => {state[2][17] = 56 ^ passwd.as_bytes()[17]; beacon = 2501880920}
            2501880920 => {state[4][2] = 103 ^ passwd.as_bytes()[2]; beacon = 2511278811}
            2511278811 => {state[10][22] = 180 ^ passwd.as_bytes()[22]; beacon = 2554042566}
            2554042566 => {state[5][6] = 111 ^ passwd.as_bytes()[6]; beacon = 2560928967}
            2560928967 => {state[3][15] = 128 ^ passwd.as_bytes()[15]; beacon = 2565950712}
            2565950712 => {state[2][0] = 241 ^ passwd.as_bytes()[0]; beacon = 2605163545}
            2605163545 => {state[4][21] = 85 ^ passwd.as_bytes()[21]; beacon = 2614847792}
            2614847792 => {state[10][10] = 32 ^ passwd.as_bytes()[10]; beacon = 2632854947}
            2632854947 => {state[2][13] = 142 ^ passwd.as_bytes()[13]; beacon = 2639777486}
            2639777486 => {state[1][7] = 0 ^ passwd.as_bytes()[7]; beacon = 2642800998}
            2642800998 => {state[10][21] = 72 ^ passwd.as_bytes()[21]; beacon = 2659309612}
            2659309612 => {state[7][8] = 61 ^ passwd.as_bytes()[8]; beacon = 2721230589}
            2721230589 => {state[2][3] = 185 ^ passwd.as_bytes()[3]; beacon = 2724055225}
            2724055225 => {state[4][13] = 165 ^ passwd.as_bytes()[13]; beacon = 2775065724}
            2775065724 => {state[1][9] = 29 ^ passwd.as_bytes()[9]; beacon = 2788162524}
            2788162524 => {state[10][16] = 118 ^ passwd.as_bytes()[16]; beacon = 2792531015}
            2792531015 => {state[7][13] = 241 ^ passwd.as_bytes()[13]; beacon = 2795089678}
            2795089678 => {state[5][12] = 112 ^ passwd.as_bytes()[12]; beacon = 2832256025}
            2832256025 => {state[6][0] = 100 ^ passwd.as_bytes()[0]; beacon = 2850235300}
            2850235300 => {state[3][17] = 185 ^ passwd.as_bytes()[17]; beacon = 2850557292}
            2850557292 => {state[9][3] = 88 ^ passwd.as_bytes()[3]; beacon = 2884383375}
            2884383375 => {state[8][21] = 85 ^ passwd.as_bytes()[21]; beacon = 2884469330}
            2884469330 => {state[3][6] = 117 ^ passwd.as_bytes()[6]; beacon = 2885816028}
            2885816028 => {state[10][18] = 44 ^ passwd.as_bytes()[18]; beacon = 2899516580}
            2899516580 => {state[0][14] = 143 ^ passwd.as_bytes()[14]; beacon = 2904688899}
            2904688899 => {state[9][9] = 68 ^ passwd.as_bytes()[9]; beacon = 2934831517}
            2934831517 => {state[10][19] = 137 ^ passwd.as_bytes()[19]; beacon = 2936067180}
            2936067180 => {state[0][18] = 121 ^ passwd.as_bytes()[18]; beacon = 2937068955}
            2937068955 => {state[9][14] = 7 ^ passwd.as_bytes()[14]; beacon = 2944483162}
            2944483162 => {state[3][24] = 70 ^ passwd.as_bytes()[24]; beacon = 2988712340}
            2988712340 => {state[2][2] = 33 ^ passwd.as_bytes()[2]; beacon = 2999806010}
            2999806010 => {state[0][5] = 54 ^ passwd.as_bytes()[5]; beacon = 3034124452}
            3034124452 => {state[7][14] = 224 ^ passwd.as_bytes()[14]; beacon = 3091021335}
            3091021335 => {state[0][21] = 195 ^ passwd.as_bytes()[21]; beacon = 3103259723}
            3103259723 => {state[8][0] = 120 ^ passwd.as_bytes()[0]; beacon = 3118997879}
            3118997879 => {state[5][2] = 114 ^ passwd.as_bytes()[2]; beacon = 3122592949}
            3122592949 => {state[0][10] = 53 ^ passwd.as_bytes()[10]; beacon = 3137150384}
            3137150384 => {state[7][22] = 109 ^ passwd.as_bytes()[22]; beacon = 3171598260}
            3171598260 => {state[3][14] = 114 ^ passwd.as_bytes()[14]; beacon = 3175257800}
            3175257800 => {state[4][8] = 69 ^ passwd.as_bytes()[8]; beacon = 3238720246}
            3238720246 => {state[0][11] = 54 ^ passwd.as_bytes()[11]; beacon = 3245490099}
            3245490099 => {state[2][9] = 68 ^ passwd.as_bytes()[9]; beacon = 3257156746}
            3257156746 => {state[7][9] = 71 ^ passwd.as_bytes()[9]; beacon = 3260990316}
            3260990316 => {state[2][24] = 11 ^ passwd.as_bytes()[24]; beacon = 3272385072}
            3272385072 => {state[9][6] = 75 ^ passwd.as_bytes()[6]; beacon = 3272817292}
            3272817292 => {state[3][22] = 194 ^ passwd.as_bytes()[22]; beacon = 3298684710}
            3298684710 => {state[1][21] = 6 ^ passwd.as_bytes()[21]; beacon = 3312072150}
            3312072150 => {state[4][23] = 17 ^ passwd.as_bytes()[23]; beacon = 3330100931}
            3330100931 => {state[3][8] = 51 ^ passwd.as_bytes()[8]; beacon = 3333773833}
            3333773833 => {state[5][20] = 81 ^ passwd.as_bytes()[20]; beacon = 3336966418}
            3336966418 => {state[8][2] = 90 ^ passwd.as_bytes()[2]; beacon = 3339346557}
            3339346557 => {state[3][23] = 9 ^ passwd.as_bytes()[23]; beacon = 3370193915}
            3370193915 => {state[4][12] = 85 ^ passwd.as_bytes()[12]; beacon = 3394881174}
            3394881174 => {state[7][2] = 176 ^ passwd.as_bytes()[2]; beacon = 3395673166}
            3395673166 => {state[0][4] = 211 ^ passwd.as_bytes()[4]; beacon = 3399073600}
            3399073600 => {state[1][2] = 230 ^ passwd.as_bytes()[2]; beacon = 3429096242}
            3429096242 => {state[9][19] = 182 ^ passwd.as_bytes()[19]; beacon = 3436033069}
            3436033069 => {state[7][17] = 111 ^ passwd.as_bytes()[17]; beacon = 3440806578}
            3440806578 => {state[2][15] = 78 ^ passwd.as_bytes()[15]; beacon = 3459509320}
            3459509320 => {state[9][8] = 69 ^ passwd.as_bytes()[8]; beacon = 3467041391}
            3467041391 => {state[10][6] = 111 ^ passwd.as_bytes()[6]; beacon = 3474683863}
            3474683863 => {state[1][11] = 246 ^ passwd.as_bytes()[11]; beacon = 3483150106}
            3483150106 => {state[6][19] = 4 ^ passwd.as_bytes()[19]; beacon = 3486498134}
            3486498134 => {state[6][21] = 85 ^ passwd.as_bytes()[21]; beacon = 3532347992}
            3532347992 => {state[1][19] = 5 ^ passwd.as_bytes()[19]; beacon = 3559204878}
            3559204878 => {state[10][8] = 132 ^ passwd.as_bytes()[8]; beacon = 3568495104}
            3568495104 => {state[2][23] = 64 ^ passwd.as_bytes()[23]; beacon = 3605812012}
            3605812012 => {state[6][7] = 0 ^ passwd.as_bytes()[7]; beacon = 3607036899}
            3607036899 => {state[2][1] = 175 ^ passwd.as_bytes()[1]; beacon = 3621745921}
            3621745921 => {state[5][22] = 243 ^ passwd.as_bytes()[22]; beacon = 3624581732}
            3624581732 => {state[7][7] = 47 ^ passwd.as_bytes()[7]; beacon = 3638456833}
            3638456833 => {state[0][17] = 68 ^ passwd.as_bytes()[17]; beacon = 3651867633}
            3651867633 => {state[8][13] = 121 ^ passwd.as_bytes()[13]; beacon = 3669782621}
            3669782621 => {state[6][11] = 225 ^ passwd.as_bytes()[11]; beacon = 3674543822}
            3674543822 => {state[10][24] = 90 ^ passwd.as_bytes()[24]; beacon = 3679247554}
            3679247554 => {state[7][4] = 219 ^ passwd.as_bytes()[4]; beacon = 3688006657}
            3688006657 => {state[9][12] = 86 ^ passwd.as_bytes()[12]; beacon = 3690903120}
            3690903120 => {state[7][0] = 233 ^ passwd.as_bytes()[0]; beacon = 3692307313}
            3692307313 => {state[5][9] = 68 ^ passwd.as_bytes()[9]; beacon = 3749796580}
            3749796580 => {state[9][2] = 33 ^ passwd.as_bytes()[2]; beacon = 3759458697}
            3759458697 => {state[6][17] = 111 ^ passwd.as_bytes()[17]; beacon = 3776322519}
            3776322519 => {state[7][24] = 203 ^ passwd.as_bytes()[24]; beacon = 3798244514}
            3798244514 => {state[10][2] = 168 ^ passwd.as_bytes()[2]; beacon = 3830327080}
            3830327080 => {state[1][4] = 213 ^ passwd.as_bytes()[4]; beacon = 3834038571}
            3834038571 => {state[4][18] = 71 ^ passwd.as_bytes()[18]; beacon = 3878433345}
            3878433345 => {state[6][6] = 91 ^ passwd.as_bytes()[6]; beacon = 3919721074}
            3919721074 => {state[1][5] = 229 ^ passwd.as_bytes()[5]; beacon = 3932821180}
            3932821180 => {state[5][5] = 118 ^ passwd.as_bytes()[5]; beacon = 3939257445}
            3939257445 => {state[8][22] = 194 ^ passwd.as_bytes()[22]; beacon = 3950180964}
            3950180964 => {state[9][11] = 0 ^ passwd.as_bytes()[11]; beacon = 3984042850}
            3984042850 => {state[9][17] = 111 ^ passwd.as_bytes()[17]; beacon = 3998967607}
            3998967607 => {state[7][11] = 85 ^ passwd.as_bytes()[11]; beacon = 4030600578}
            4030600578 => {state[9][24] = 109 ^ passwd.as_bytes()[24]; beacon = 4043759956}
            4043759956 => {state[9][10] = 111 ^ passwd.as_bytes()[10]; beacon = 4051512898}
            4051512898 => {state[4][17] = 107 ^ passwd.as_bytes()[17]; beacon = 4052450747}
            4052450747 => {state[5][19] = 115 ^ passwd.as_bytes()[19]; beacon = 4059174551}
            4059174551 => {state[3][11] = 247 ^ passwd.as_bytes()[11]; beacon = 4067490822}
            4067490822 => {state[10][11] = 164 ^ passwd.as_bytes()[11]; beacon = 4073866342}
            4073866342 => {state[9][1] = 55 ^ passwd.as_bytes()[1]; beacon = 4081776896}
            4081776896 => {state[7][15] = 159 ^ passwd.as_bytes()[15]; beacon = 4091465802}
            4091465802 => {state[1][0] = 197 ^ passwd.as_bytes()[0]; beacon = 4120302359}
            4120302359 => {state[3][2] = 182 ^ passwd.as_bytes()[2]; beacon = 4130766158}
            4130766158 => {state[5][16] = 237 ^ passwd.as_bytes()[16]; beacon = 4138499758}
            4138499758 => {state[2][12] = 145 ^ passwd.as_bytes()[12]; beacon = 4143692041}
            4143692041 => {state[0][8] = 90 ^ passwd.as_bytes()[8]; beacon = 4168526219}
            4168526219 => {state[6][24] = 144 ^ passwd.as_bytes()[24]; beacon = 4232287366}
            4232287366 => {state[5][21] = 85 ^ passwd.as_bytes()[21]; beacon = 4237604169}
            4237604169 => {state[4][0] = 227 ^ passwd.as_bytes()[0]; beacon = 4287918471}
            4287918471 => {state[3][19] = 238 ^ passwd.as_bytes()[19]; beacon = 0}
            _ => println!("Erreur, contactez le challmaker")
        }

    }

    if state[0][7]==0x30&&state[1][7]==0x30&&state[2][7]==0x30&&state[2][8]==0x30&&state[2][9]==0x30&&state[2][10]==0x30&&state[3][10]==0x30&&state[4][10]==0x30&&state[5][10]==0x30&&state[5][9]==0x30&&state[5][8]==0x30&&state[4][8]==0x30&&state[4][7]==0x30&&state[4][6]==0x30&&state[4][5]==0x30&&state[5][5]==0x30&&state[6][5]==0x30&&state[7][5]==0x30&&state[8][5]==0x30&&state[9][5]==0x30&&state[9][6]==0x30&&state[9][7]==0x30&&state[9][8]==0x30&&state[9][9]==0x30&&state[9][10]==0x30&&state[9][11]==0x30&&state[9][12]==0x30&&state[9][13]==0x30&&state[9][14]==0x30&&state[9][15]==0x30&&state[9][16]==0x30&&state[9][17]==0x30&&state[8][17]==0x30&&state[7][17]==0x30&&state[6][17]==0x30&&state[6][18]==0x30&&state[6][19]==0x30&&state[7][19]==0x30&&state[8][19]==0x30&&state[8][20]==0x30&&state[8][21]==0x30&&state[7][21]==0x30&&state[6][21]==0x30&&state[5][21]==0x30&&state[4][21]==0x30&&state[4][22]==0x30&&state[4][23]==0x30&&state[4][24] == 0x30{
         println!("Félicitation ! Vous pouvez valider avec ce flag");
    }
    else {
        println!("Nope !");
    }

}

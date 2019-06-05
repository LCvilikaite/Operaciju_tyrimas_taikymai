# III užduotis (gamybos planavimo uždavinys)
## Atliko: Laura Cvilikaitė, DGTfm-18

## Užduoties aprašymas
**Tikslas** – apskaičiuoti maksimalų pelną, kurį gaus gamykla.

Pagal duotą sąlygą apskaičiuojame lentelės reikšmes:

```Matlab
%clc;
%clear;
darbo_laikas  = [mod(20182746,2)+5 mod(20182746,3)+4 mod(20182746,4)+1 mod(20182746,5)+5];
disp("darbo_laikas");
disp(darbo_laikas);
sanaudos_1  = [mod(20182746,7)+3 mod(20182746,5)+4 mod(20182746,9)+2 mod(20182746,3)+5];
disp("sanaudos_1");
disp(sanaudos_1);
sanaudos_2  = [mod(20182746,13)+2 mod(20182746,4)+7 mod(20182746,9)+4 mod(20182746,3)+3];
disp("sanaudos_2");
disp(sanaudos_2);
sanaudos_3  = [mod(20182746,6)+2 mod(20182746,7)+4 mod(20182746,6)+5 mod(20182746,3)+1];
disp("sanaudos_3");
disp(sanaudos_3);
pard_kaina  = [mod(20182746,11)+60 mod(20182746,6)+50 mod(20182746,21)+20 mod(20182746,36)+70];
disp("pard_kaina");
disp(pard_kaina);
```
---- | "A" | "B" | "C" | "D" |
 ---- | ---- |  ---- | ---- | 
Vieno darbininko darbo laikas vienos rūšies gaminio gamybai, (val.) | 5   |  4  |   3  |   6

6     5     5     5

14     9     7     3

2     7     5     1

61    50    23   100

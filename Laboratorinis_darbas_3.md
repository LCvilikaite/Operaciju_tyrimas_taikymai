# III užduotis (gamybos planavimo uždavinys)
## Atliko: Laura Cvilikaitė, DGTfm-18

## Užduoties aprašymas
**Tikslas** – apskaičiuoti maksimalų pelną, kurį gaus gamykla.

Pagal duotą sąlygą apskaičiuojame lentelės ir apribojimų reikšmes:

```Matlab
%apsibrėžiame kintamuosius iš sąlygos
darbo_laikas  = [5+mod(20182746,2) 4+mod(20182746,3) 1+mod(20182746,4) 5+mod(20182746,5)];
%išvedame rezultatus su disp funkcija
disp("darbo_laikas");
disp(darbo_laikas);
sanaudos_1  = [3+mod(20182746,7) 4+mod(20182746,5) 2+mod(20182746,9) 5+mod(20182746,3)];
disp("sanaudos_1");
disp(sanaudos_1);
sanaudos_2  = [2+mod(20182746,13) 7+mod(20182746,4) 4+mod(20182746,9) 3+mod(20182746,3)];
disp("sanaudos_2");
disp(sanaudos_2);
sanaudos_3  = [2+mod(20182746,6) 4+mod(20182746,7) 5+mod(20182746,6) 1+mod(20182746,3)];
disp("sanaudos_3");
disp(sanaudos_3);
pard_kaina  = [60+mod(20182746,11) 50+mod(20182746,6) 20+mod(20182746,21) 70+mod(20182746,36)];
disp("pard_kaina");
disp(pard_kaina);
%apsibrėžiame apribojimus
%apribojimas gamybos terminui
gamyb_apr = 780;
%apribojimas pirmosioms sąnaudoms, gauname 492
san_apr1 = 400 + 2* mod(20182746,100);
disp("san_apr1");
disp(san_apr1);
%apribojimas antrosioms sąnaudoms, gauname 946
san_apr2 = 700 + mod(20182746,300);
disp("san_apr2");
disp(san_apr2);
%apribojimas gaminiams, gauname 346
gamin_sk_apr = 250 + mod(20182746,150);
disp("gamin_sk_apr");
disp(gamin_sk_apr);
```

## Lentelės ir apribojimų reikšmės:

```Matlab
darbo_laikas  
     5     4     3     6  
sanaudos_1  
     6     5     5     5  
sanaudos_2  
    14     9     7     3  
sanaudos_3  
     2     7     5     1  
pard_kaina  
    61    50    23   100  
san_apr1  
   492  
san_apr2  
   946  
gamin_sk_apr  
   346  
 ```
Įsistatome apskaičiuotas reikšmes į sąlygą:
Gamybos terminas – dvi darbo savaitės, t.y., 10 darbo. Darbininkų darbo laiko ištekliai per 10 darbo dienų – 780 val.  
Analogišką nelygybę 1 klasės sąnaudoms. Per dvi darbo savaites turi būti sunaudota ne daugiau kaip 492.  
Tokia pat nelygybę 2 klasės sąnaudoms. Per dvi darbo savaites turi būti sunaudota ne daugiau kaip 946, jų kaina yra 15 eurų už vienetą.  
3 klasės sąnaudos apribojimų neturi, jų kaina yra 50 eurų už sunaudotą vienetą.  
Apribojimas: gaminių A, B, C ir D per 10 dienų turi būti pagaminta > negu 346.  

## Kintamųjų lentelė:
Reikšmė  | "A" | "B" | "C" | "D" |
 ---- | ---- | ---- |  ---- | ---- | 
Vieno darbininko darbo laikas vienos rūšies gaminio gamybai, (val.) | 5   |  4  |   3  |   6
1 klasės sąnaudos vienam gaminiui | 6  |   5  |   5 |    5
2 klasės sąnaudos vienam gaminiui | 14  |   9  |   7  |   3
3 klasės sąnaudos vienam gaminiui | 2  |   7   |  5  |   1
Pardavimo kaina, vnt. | 61  |  50  |  23  | 100

## Užduoties matematinė išraiška

![](https://latex.codecogs.com/gif.latex?%5Cinline%205x_1%20&plus;%204x_2%20&plus;%203x_3%20&plus;%206x_4%20%5Cleq%20780)  
![](https://latex.codecogs.com/gif.latex?%5Cinline%206x_1%20&plus;%205x_2%20&plus;%205x_3%20&plus;%205x_4%20%5Cleq%20492)  
![](https://latex.codecogs.com/gif.latex?%5Cinline%2014x_1%20&plus;%209x_2%20&plus;%207x_3%20&plus;%203x_4%20%5Cleq%20946)  
![Užduoties matematinė išraiška](https://latex.codecogs.com/gif.latex?%5Cinline%20-x_1%20-%20x_2%20-%20x_3%20-%20x_4%20%5Cleq%20-346)  

## m failas

```Matlab 
%ciklo ilgis
n = length(pard_kaina); 
%pridedame gaminį matriciniu pavidalu
gam = [1 1 1 1];
%jungiame masyvus vertikaliai su vertcat funkcija
koef = vertcat(darbo_laikas, sanaudos_1, sanaudos_2, -gam);
apribojimai = [gamyb_apr san_apr1 san_apr2 -gamin_sk_apr];
%viršutinė riba
virs = []; 
%apatinė riba
apat = zeros(n,1); 
%kuriame optimizavimo struktūrą
options = optimset; 
%išvedame kiekvieną iteraciją į ekraną
options.Display = 'iter';
%pasirenkame algoritmą
options.Algorithm = 'interior-point-legacy';
%pritaikome linprog algoritmą
[x,fval,exitflag,output,lambda] = linprog(-pard_kaina,koef,apribojimai,[],[],apat,virs,[],options);
%Lagranžo daugikliai nelygybei
Lagranzo = lambda.ineqlin;
%ciklas iteracijų išvedimui į ekraną
for i=1:n 
    fprintf('\n x%1.0f = %8.4f',i,x(i));
end
fprintf('\n %8.4f\n',-fval);
```
## m failo rezultatai:  

```Matlab
  Residuals:   Primal     Dual     Duality    Total  
               Infeas    Infeas      Gap       Rel  
               A*x-b    A'*y+z-f    x'*z      Error  
  ---------------------------------------------------  
  Iter    0:  9.24e+03 2.90e+02 1.15e+05 5.50e+04  
  Iter    1:  4.49e+03 4.47e+01 4.00e+04 3.28e+00  
  Iter    2:  4.14e+03 7.52e-12 3.51e+05 3.03e+00  
  Iter    3:  3.97e+03 1.86e-09 2.17e+05 2.90e+00  
  Iter    4:  3.97e+03 2.34e-03 5.83e+10 2.90e+00  
  Iter    5:  3.97e+03 1.41e-03 6.42e+10 2.90e+00  
  Iter    6:  3.97e+03 2.23e+05 7.25e+18 1.73e+03  
  Iter    7:  3.97e+03 3.08e+05 7.05e+18 2.38e+03  
Exiting: One or more of the residuals, duality gap, or total relative error  
 has grown 100000 times greater than its minimum value so far:  
         the primal appears to be infeasible (and the dual unbounded).  
         (The dual residual < OptimalityTolerance=1.00e-08.)  

 x1 =   0.0019  
 x2 =   0.0960  
 x3 = 331.7006  
 x4 = 168.4804  
 24482.0760  
```
## Rezultatų apibendrinimas:

X reikšmės | x1  | x2  | x3 | x4
 ---- | ---- | ---- |  ---- | ---- | 
Optimalus sprendinys | 0.0019 | 0.0960 | 331.7006 | 168.4804

Tikslo funkcijos optimali reikšmė yra 24482.0760.

# Pridėkime naują prekę "E"

Pridekime naują prekę „E“, suteikime jai savo parametrus ties sąnaudomis ir jos kaina. Patikrinkime, kiek iteracijų įvykdo programa dabar.

```Matlab
%apsibrėžiame kintamuosius iš sąlygos, pridedame prekę "E"
darbo_laikas_E  = [5+mod(20182746,2) 4+mod(20182746,3) 1+mod(20182746,4) 5+mod(20182746,5) 8+mod(20182746,5)];
%išvedame rezultatus su disp funkcija
disp("darbo_laikas_E");
disp(darbo_laikas_E);
sanaudos_1_E  = [3+mod(20182746,7) 4+mod(20182746,5) 2+mod(20182746,9) 5+mod(20182746,3) 2+mod(20182746,7)];
disp("sanaudos_1_E");
disp(sanaudos_1_E);
sanaudos_2_E  = [2+mod(20182746,13) 7+mod(20182746,4) 4+mod(20182746,9) 3+mod(20182746,3) 6+mod(20182746,1)];
disp("sanaudos_2_E");
disp(sanaudos_2_E);
sanaudos_3_E  = [2+mod(20182746,6) 4+mod(20182746,7) 5+mod(20182746,6) 1+mod(20182746,3) 9+mod(20182746,5)];
disp("sanaudos_3_E");
disp(sanaudos_3_E);
pard_kaina_E  = [60+mod(20182746,11) 50+mod(20182746,6) 20+mod(20182746,21) 70+mod(20182746,36) 39+mod(20182746,3)];
disp("pard_kaina_E");
disp(pard_kaina_E);
%apsibrėžiame apribojimus
%apribojimas gamybos terminui
gamyb_apr_E = 780;
%apribojimas pirmosioms sąnaudoms, gauname 492
san_apr1_E=400 + 2* mod(20182746,100);
disp("san_apr1_E");
disp(san_apr1_E);
%apribojimas antrosioms sąnaudoms, gauname 946
san_apr2_E=700 + mod(20182746,300);
disp("san_apr2_E");
disp(san_apr2_E);
%apribojimas gaminiams, gauname 346
gamin_sk_apr_E = 250 + mod(20182746,150);
disp("gamin_sk_apr_E");
disp(gamin_sk_apr_E);
```
## Lentelės ir apribojimų reikšmės su "E":

```Matlab
darbo_laikas_E
     5     4     3     6     9

sanaudos_1_E
     6     5     5     5     5

sanaudos_2_E
    14     9     7     3     6

sanaudos_3_E
     2     7     5     1    10

pard_kaina_E
    61    50    23   100    39

san_apr1_E
   492

san_apr2_E
   946

gamin_sk_apr_E
   346
```
## Kintamųjų lentelė su "E":
Reikšmė  | "A" | "B" | "C" | "D" | "E" |
 ---- | ---- | ---- |  ---- | ---- | ---- |
Vieno darbininko darbo laikas vienos rūšies gaminio gamybai, (val.) | 5   |  4  |   3  |   6  |  9
1 klasės sąnaudos vienam gaminiui | 6  |   5  |   5 |    5  |  5
2 klasės sąnaudos vienam gaminiui | 14  |   9  |   7  |   3  |  6
3 klasės sąnaudos vienam gaminiui | 2  |   7   |  5  |   1  |  10
Pardavimo kaina, vnt. | 61  |  50  |  23  | 100 |  39

## m failas su "E"

```Matlab
%ciklo ilgis
n=length(pard_kaina_E); 
%pridedame gaminį matriciniu pavidalu
gam_E = [1 1 1 1 1];
%jungiame masyvus vertikaliai su vertcat funkcija
koef_E = vertcat(darbo_laikas_E, sanaudos_1_E, sanaudos_2_E, -gam_E);
apribojimai_E = [gamyb_apr_E san_apr1_E san_apr2_E -gamin_sk_apr_E];
%viršutinė riba
virs_E = []; 
%apatinė riba
apat_E = zeros(n,1); 
%kuriame optimizavimo struktūrą
options = optimset; 
%išvedame kiekvieną iteraciją į ekraną
options.Display = 'iter';
%pasirenkame algoritmą
options.Algorithm = 'interior-point-legacy';
%pritaikome linprog algoritmą
[x,fval,exitflag,output,lambda] = linprog(-pard_kaina_E,koef_E,apribojimai_E,[],[],apat_E,virs_E,[],options);
%Lagranžo daugikliai nelygybei
Lagranzo_E = lambda.ineqlin;
%ciklas iteracijų išvedimui į ekraną
for i=1:n 
    fprintf('\n x%1.0f = %8.4f',i,x(i));
end
fprintf('\n %8.4f\n',-fval);
```
## m failo rezultatai su "E":

```Matlab
Residuals:   Primal     Dual     Duality    Total
               Infeas    Infeas      Gap       Rel
               A*x-b    A'*y+z-f    x'*z      Error
  ---------------------------------------------------
  Iter    0:  1.20e+04 3.09e+02 1.34e+05 6.50e+04
  Iter    1:  5.79e+03 5.33e+01 5.14e+04 4.24e+00
  Iter    2:  5.19e+03 3.57e-11 1.91e+05 3.80e+00
  Iter    3:  5.11e+03 2.90e-08 9.49e+06 3.75e+00
  Iter    4:  5.11e+03 2.14e-01 2.06e+12 3.74e+00
  Iter    5:  5.11e+03 1.10e-01 1.48e+12 3.74e+00
  Iter    6:  5.11e+03 1.40e+01 1.67e+12 3.74e+00
Exiting: One or more of the residuals, duality gap, or total relative error
 has grown 100000 times greater than its minimum value so far:
         the primal appears to be infeasible (and the dual unbounded).
         (The dual residual < OptimalityTolerance=1.00e-08.)

 x1 =   0.0000
 x2 =   0.0993
 x3 = 351.7941
 x4 = 174.5203
 x5 =  78.1255
 28595.1496
 ```
 
 ## Rezultatų apibendrinimas:

X reikšmės | x_1  | x_2  | x3 | x4 | x5  |
 ---- | ---- | ---- |  ---- | ---- | 
Optimalus sprendinys | 0.0000 | 0.0993 | 351.7941 | 174.5203 | 78.1255

Tikslo funkcijos optimali reikšmė yra 28595.1496.  
Taigi, pridėjus naują prekę "E" iteracijų skaičius sumažėjo, tikslo funkcijos optimali reikšmė tapo didesnė.
 

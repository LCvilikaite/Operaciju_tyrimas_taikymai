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

 ![](http://latex.codecogs.com/gif.latex?5x_%7B1%7D&plus;4x_%7B2%7D&plus;1x_%7B3%7D&plus;8x_%7B4%7D%5Cleq%20780)<br>
 ![](http://latex.codecogs.com/gif.latex?9x_%7B1%7D&plus;7x_%7B2%7D&plus;5x_%7B3%7D&plus;5x_%7B4%7D%5Cleq%20456)<br>
 ![](http://latex.codecogs.com/gif.latex?12x_%7B1%7D&plus;7x_%7B2%7D&plus;7x_%7B3%7D&plus;3x_%7B4%7D%5Cleq%20928)<br>
 ![](http://latex.codecogs.com/gif.latex?-x_%7B1%7D-x_%7B2%7D-x_%7B3%7D-x_%7B4%7D%5Cleq%20-328)<br>

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




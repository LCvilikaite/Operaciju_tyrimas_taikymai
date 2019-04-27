# II užduotis (Simplekso metodas)

## Atliko: Laura Cvilikaitė, DGTfm-18
## Užduoties aprašymas

**Tikslas** – rasti funkcijos ![5](C:\Users\Laura\Desktop\Darbai\Operacijų_tyrimas_taikymai\2lab\Final\5.gif) minimumą ir minimumo tašką

**Apie funkciją**: Ši funkcija vadinama Rozenbroko. Tai viena iš testinių funkcijų, naudojamų optimizavimo algoritmų vertinimui. Funkcija yra dviejų kintamųjų, ![57](C:\Users\Laura\Desktop\Darbai\Operacijų_tyrimas_taikymai\2lab\Final\57.gif.)
Funkcijos grafikas (paimta iš http:||en.wikipedia.org|wiki|Rosenbrock_function):

![1](C:\Users\Laura\Desktop\Darbai\Operacijų_tyrimas_taikymai\2lab\Final\1.png)


Čia mėlyna spalva pažymėtas „griovys“, kuriame yra globalus funkcijos minimumas. Rasti šį griovį nėra sudėtinga, bet rasti patį tikslų minimumą sudėtingas uždavinys.

Atlikite šias užduotis:

1. Sumodeliuokite MS Excel‘yje arba suprogramuokite Matlab‘e paprasto (ne deformuoto) simplekso metodą.

    1.1. Pasirinkus metodo modeliavimą MS Excel‘yje, pradžioje reikia pasirinkti bazinį tašką  

![51](C:\Users\Laura\Desktop\Darbai\Operacijų_tyrimas_taikymai\2lab\Final\51.gif)

 ir simplekso dydį reguliuojančio parametro reikšmę ![52](C:\Users\Laura\Desktop\Darbai\Operacijų_tyrimas_taikymai\2lab\Final\52.gif). Sumodeliuoti simplekso metodo 5–7 žingsnių skaičiavimą. Rezultatas: gauta mažiausia funkcijos reikšmė bei taškas.
    P. S. Atlikus šią, o ne 1.2 užduotį, maksimalus galimas balas yra 8.

​		1.2. Pasirinkus programavimo darbą, reikia Matlab‘e sukurti funkciją, kuri rastų funkcijos minimumo tašką bei minimumą paprastu simplekso metodu norimu tikslumu. Norimas tikslumas, bazinis taškas, bei simplekso dydį reguliuojančio parametro reikšmė turi būti perduodama funkcijos argumentu.Rezultatas: funkcijos minimumas, minimumo taškas bei simplekso „apvertimų“ skaičius.
​        1.2.1. Atlikti kelis bandymus parinkus kitą bazinį tašką. Ar gaunami rezultatai skiriasi? Užfiksuokite gautus rezultatus.
​        1.2.2. Atlikti eksperimentus keičiant norimą tikslumą (arba iteracijų skaičių) naudojant tą patį bazinį tašką. Ar gaunami rezultatai skiriasi? Užfiksuokite gautus rezultatus.

2. Raskite funkcijos minimumą bei minimumo tašką naudojant Matlab funkciją fminsearch, kurioje įgyvendintas deformuotojo simplekso metodas:

    2.1. Atlikite 1.2.1 ir 1.2.2 punktuose nurodytas užduotis naudojant funkciją fminsearch. Palyginkite juos su rezultatais, gautais paprasto simplekso metodu.
    
3. Matlab aplinkoje nubraižykite funkcijos grafiką, užrašykite ašių pavadinimus.

## Sprendimas

```matlab
%apsibrėžiame tikslo funkciją, formulė buvo duota sąlygoje
function [y] = f_tikslo(x)
 y = 100* (x(2)-(x(1))^2)^2 + (1-x(1))^2;
end
```

```Matlab

    %apsirašome funkciją, kuri ieškotų funkcijos minimumo ir minimumo taško
    %paprastuoju simpleks metodu
function [x_min_simpleks, f_min_simpleks, iteration_simpleks] = f_simpleks(x0, n, alfa)
    %priskiriame pradinę 0 iteracijos reikšmę
    iteration_simpleks = 0;
    stop_ = 0;
    %apsibrėžiame maksimalų iteracijų skaičių
    m = 1000;
    %apskaičiuojame delta1 ir delta2, formulės iš paskaitos skaidrių
    delta1 = (sqrt(n+1) + n - 1)* alfa|(n * sqrt(2));
    delta2 = (sqrt(n+1) - 1) * alfa|(n * sqrt(2)); 
    %apskaičiuojamos kitos viršūnės, formulės iš paskaitos skaidrių
    for i = 1:n     
       for j = 1:n
           if j == i
             x1(j) =  x0(j) + delta2;
           else
             x1(j) =  x0(j) + delta1;
           end
       end
      x{i} = x1;
    end
    %vykdysime ciklą while
    while stop_ == 0 
    %priskiriame tikslo funkcijos reikšmę x0 taške
       fx0 = f_tikslo(x0);
       %sukame ciklą susirinkti tikslo funkcijos reikšmėms
        for i = 1:n
           fx(i) = f_tikslo(x{i});
        end
        %randamos viršūnių svorio centro koordinatės
        for i = 1:n
            xc(i) = 0;
            for j = 1:n
                xc(i) = xc(i) + x{i}(j);
            end
            %daliname iš n pagal formulę
            xc(i) = xc(i) | n;
        end
          
        %naujos simplekso viršūnės apskaičiavimas
        x_naujas = -x0 + 2 * xc; 
        %apsibrėžiame funkcijos reikšmę naujoje simpleks viršūnėje
        f_x_naujas = f_tikslo(x_naujas); 
        
        %toliau ieškome maksimalios funkcijos reikšmės
        maksimali = 1;
        f_maksimali = fx(maksimali); 
        for i = 1:n
            %jei i-toji funkcijos reikmšmė didesnė už maksimalią, bus
            %randama maksimali reikšmė
            if(fx(i) > f_maksimali)
                f_maksimali = fx(i); 
                maksimali = i;
            end
        end
        %jei f-jos reikšmė naujoje simplekso viršūneje didesnė negu
        %kitose - nutraukiama
        if(f_maksimali < f_x_naujas)
            stop_ = 1; 
        else 
            x{maksimali} = x_naujas;
        end
        %jei iteracijų skaičius viršija maksimalų iteracijų skaičių m -
        %nutraukiama
         if(iteration_simpleks > m)     
            stop_ = 1;
        end       
        iteration_simpleks = iteration_simpleks + 1; 
    end

    %ieškome minimalios funkcijos reikšmės
    minimali = 1;
    fminx = fx(maksimali);
    %sukame for ciklą, kol randamas funkcijos minimumas
    for i = 1:n
        if(fx(i) < fminx)
            fminx = fx(i); 
            imin = i;
        end
    end
    %x reikšmės paprastojo simplekso metodu
    x_min_simpleks = x{minimali}; 
    %f-jos minimumas paprastojo simplekso metodu
    f_min_simpleks = fminx; 
end
```

```Matlab

   %funkcija, minimumo taško bei minimumo radimui simplekso metodu ir
   %pasinaudojant fminsearch
function [x0, alfa, x_minsearch, f_minsearch, x_min_simpleks, f_min_simpleks, iteration_simpleks] = f_minimumui(x_minsearch)
   %apsibrėžiame kintamuosius iš sąlygos
   %studentės numeris
   stud_nr = 20182746;
   %pasirenkame bazinį tašką x0, šiuo atveju x0=(4, 4)
   x0 = [mod(stud_nr, 10)|2 + 1,  mod(stud_nr, 10)|2 + 1]; 
   %pradinis variantas, kuomet simplekso dydį reguliuojančio parametro
   %reikšmė alfa lygi 0.5
   alfa = 0.5;
   %funkcija dviejų kintamųjų, todėl n=2
   n = 2; 
   %apsibrėžiame parametrus fminsearch funkcijai
   options = optimset('Display', 'iter' , 'TolX', alfa, 'PlotFcns',@optimplotfval); 
   %brėžiame x1, x2 grafiką
   [X1, X2] = meshgrid(-4:0.1:4, -4:0.1:4);
   %randame y reikšmes 
   y = 100.*(X2-X1.^2).^2 + (1-X1).^2;
    surf(X1,X2,y);
    xlabel('x1');
    ylabel('x2');
    zlabel('F(x1,x2)');
    title('F(x1,x2)=100*(x2-x1^2)^2 + (1-x1)^2');
    %kviečiame fminsearch minimų radimui
  [x_minsearch, f_minsearch] = fminsearch(@f_tikslo, x0, options)
    %kviečiame simpleks metodą minimumų radimui
  [x_min_simpleks, f_min_simpleks, iteration_simpleks] = f_simpleks(x0, n, alfa)
end
```
1. Kai ![53](C:\Users\Laura\Desktop\Darbai\Operacijų_tyrimas_taikymai\2lab\Final\53.gif)

```matlab

 Iteration   Func-count     min f(x)         Procedure
     0            1            14409         
     1            3            13933         initial simplex
     2            5          7506.32         expand
     3            7          4643.37         expand
     4            9          117.812         expand
     5           11          12.9125         reflect
     6           13          12.9125         contract outside
     7           15          12.9125         contract inside
     8           17          5.73854         contract inside
     9           19          5.73854         contract outside
    10           21          4.38548         contract inside
    11           23          2.42195         contract inside
    12           24          2.42195         reflect
    13           26            1.929         contract inside
    14           27            1.929         reflect
    15           29          1.83016         contract inside
    16           31          1.83016         contract outside
    17           33          1.83016         contract inside
    18           35          1.82055         reflect
    19           37           1.7613         expand
    20           38           1.7613         reflect
    21           40          1.65914         expand
    22           42          1.65914         contract inside
    23           44          1.54143         expand
    24           46          1.33831         expand
    25           48          1.32988         reflect
    26           50          1.23231         reflect
    27           52          1.23231         contract inside
    28           54          1.07014         expand
    29           56          1.07014         contract inside
    30           58          1.03062         expand
    31           60         0.787722         expand
    32           61         0.787722         reflect
    33           63         0.646928         reflect
    34           65         0.646928         contract inside
    35           67         0.492605         expand
    36           69         0.492605         contract inside
    37           70         0.492605         reflect
    38           72         0.416067         reflect
    39           74         0.416067         contract inside
    40           76         0.312338         expand
    41           78         0.312338         contract inside
    42           79         0.312338         reflect
    43           81         0.227263         expand
    44           83         0.227263         contract inside
    45           85         0.186207         reflect
    46           87         0.186207         contract inside
    47           88         0.186207         reflect
    48           90         0.138664         expand
    49           92         0.138664         contract inside
    50           94         0.110841         expand
    51           96         0.098963         reflect
    52           98        0.0440066         expand
    53          100        0.0440066         contract inside
    54          101        0.0440066         reflect
    55          103        0.0199177         reflect
    56          105        0.0199177         contract outside
    57          106        0.0199177         reflect
    58          108       0.00632582         expand
    59          110       0.00632582         contract outside
    60          111       0.00632582         reflect
    61          113       0.00325137         contract inside
    62          115       0.00325137         contract inside
    63          117       0.00174505         reflect
    64          119       0.00171006         contract inside
    65          121        0.0004272         reflect
    66          123        0.0004272         contract inside
    67          125      0.000231555         reflect
    68          127      0.000140244         reflect
    69          129      0.000112192         reflect
    70          131      3.37736e-05         contract inside
    71          133      1.01773e-05         contract inside
    72          135      1.01773e-05         contract inside
 
Optimization terminated:
 the current x satisfies the termination criteria using OPTIONS.TolX of 5.000000e-01 
 and F(X) satisfies the convergence criteria using OPTIONS.TolFun of 1.000000e-04 


x_minsearch =

    0.9979    0.9956


f_minsearch =

   1.0177e-05


x_min_simpleks =

    4.1294    4.4830


f_min_simpleks =

   1.5808e+04


iteration_simpleks =

     1


ans =

     4     4
```
2. Kai ![54](C:\Users\Laura\Desktop\Darbai\Operacijų_tyrimas_taikymai\2lab\Final\54.gif)
```matlab

 Iteration   Func-count     min f(x)         Procedure
     0            1           810081         
     1            3           801106         initial simplex
     2            5           493570         expand
     3            7           364570         expand
     4            9          68279.1         expand
     5           11          177.954         expand
     6           12          177.954         reflect
     7           14          177.954         contract outside
     8           15          177.954         reflect
     9           17          177.954         contract inside
    10           19          177.954         contract inside
    11           21          177.954         contract inside
    12           23          41.6885         contract inside
    13           24          41.6885         reflect
    14           26          13.7852         contract inside
    15           28          13.7852         contract outside
    16           30          11.5016         contract inside
    17           31          11.5016         reflect
    18           33          8.84774         contract inside
    19           34          8.84774         reflect
    20           36          8.84774         contract inside
    21           38          8.73108         contract inside
    22           40          8.73108         contract inside
    23           42          8.45128         expand
    24           43          8.45128         reflect
    25           45          8.00505         expand
    26           47          7.99647         reflect
    27           49          7.16824         expand
    28           50          7.16824         reflect
    29           52          7.16824         contract inside
    30           53          7.16824         reflect
    31           55          6.77816         expand
    32           57          6.66343         reflect
    33           59          5.71463         expand
    34           61          5.71463         contract inside
    35           62          5.71463         reflect
    36           64          5.10325         reflect
    37           66          5.10325         contract outside
    38           67          5.10325         reflect
    39           69          4.88129         reflect
    40           70          4.88129         reflect
    41           72          4.57468         reflect
    42           74          4.57468         contract inside
    43           76          4.51914         reflect
    44           78          4.22925         expand
    45           80          4.16273         expand
    46           82          3.76996         reflect
    47           83          3.76996         reflect
    48           85          3.50547         reflect
    49           87          3.50547         contract inside
    50           89          3.02205         expand
    51           90          3.02205         reflect
    52           92           2.9215         reflect
    53           94          2.85071         reflect
    54           96          2.56253         reflect
    55           97          2.56253         reflect
    56           99          2.31875         reflect
    57          101          2.31875         contract inside
    58          103          2.21316         reflect
    59          105           2.1633         reflect
    60          107          2.02691         reflect
    61          108          2.02691         reflect
    62          110           1.8314         reflect
    63          112           1.8314         contract inside
    64          114          1.81696         reflect
    65          116          1.57544         expand
    66          118          1.57544         contract inside
    67          119          1.57544         reflect
    68          121          1.47347         expand
    69          123             1.31         expand
    70          125          1.07043         reflect
    71          127          1.07043         contract inside
    72          128          1.07043         reflect
    73          130         0.928032         reflect
    74          132         0.928032         contract inside
    75          134         0.745993         expand
    76          135         0.745993         reflect
    77          137         0.684242         reflect
    78          139          0.67698         reflect
    79          141         0.570419         reflect
    80          142         0.570419         reflect
    81          144         0.506852         reflect
    82          146         0.491154         contract inside
    83          148         0.416297         reflect
    84          150         0.416297         contract inside
    85          152         0.392021         reflect
    86          154         0.313558         expand
    87          155         0.313558         reflect
    88          157         0.227982         expand
    89          158         0.227982         reflect
    90          160          0.20943         reflect
    91          162         0.177136         contract inside
    92          164        0.0896418         expand
    93          166        0.0896418         contract inside
    94          168        0.0896418         contract inside
    95          169        0.0896418         reflect
    96          171        0.0589355         reflect
    97          173        0.0589355         contract inside
    98          175        0.0476031         expand
    99          177        0.0322084         reflect
   100          179       0.00895191         expand
   101          181       0.00895191         contract inside
   102          182       0.00895191         reflect
   103          184       0.00418004         contract outside
   104          186       0.00418004         contract inside
   105          188       0.00108496         expand
   106          190       0.00108496         contract inside
   107          192       0.00108496         contract inside
   108          194      5.06692e-06         reflect
   109          196      5.06692e-06         contract inside
   110          198      5.06692e-06         contract outside
   111          200      5.06692e-06         contract inside
   112          202      5.06692e-06         contract outside
   113          204      5.06692e-06         contract outside
 
Optimization terminated:
 the current x satisfies the termination criteria using OPTIONS.TolX of 5.000000e-01 
 and F(X) satisfies the convergence criteria using OPTIONS.TolFun of 1.000000e-04 


x_minsearch =

    0.9978    0.9955


f_minsearch =

   5.0669e-06


x_min_simpleks =

   10.1294   10.4830


f_min_simpleks =

   8.4873e+05


iteration_simpleks =

     1


ans =

    10    10
```
3. Kai ![55](C:\Users\Laura\Desktop\Darbai\Operacijų_tyrimas_taikymai\2lab\Final\55.gif)

```matlab

 Iteration   Func-count     min f(x)         Procedure
     0            1       4.4102e+06         
     1            3      4.37875e+06         initial simplex
     2            5      2.75991e+06         expand
     3            7      2.09539e+06         expand
     4            9           469081         expand
     5           11          21656.6         expand
     6           12          21656.6         reflect
     7           14          21656.6         contract outside
     8           16          21656.6         contract inside
     9           18          11341.3         contract inside
    10           20          6188.26         contract inside
    11           22          230.245         contract inside
    12           23          230.245         reflect
    13           25          230.245         contract inside
    14           27          230.245         contract inside
    15           29          33.4702         contract inside
    16           30          33.4702         reflect
    17           32          26.5317         contract inside
    18           34          26.5317         contract outside
    19           36          20.7377         contract inside
    20           38          16.0398         contract inside
    21           39          16.0398         reflect
    22           41          15.7994         contract inside
    23           43          15.7994         contract outside
    24           45          15.5181         contract inside
    25           46          15.5181         reflect
    26           48          15.5181         contract inside
    27           50          15.5181         contract inside
    28           52          15.5181         contract inside
    29           53          15.5181         reflect
    30           55          15.4799         expand
    31           57          15.4799         contract inside
    32           59          15.4512         expand
    33           61          15.3768         expand
    34           63          15.3446         expand
    35           65          15.1685         expand
    36           66          15.1685         reflect
    37           68          15.1114         expand
    38           70          14.7306         expand
    39           71          14.7306         reflect
    40           73          14.3233         expand
    41           75          14.1814         reflect
    42           77           13.705         expand
    43           79          12.8947         expand
    44           80          12.8947         reflect
    45           82          11.2351         expand
    46           84          11.2351         contract inside
    47           86          11.2351         contract outside
    48           88          10.2749         expand
    49           90          9.89486         expand
    50           91          9.89486         reflect
    51           93          7.39683         expand
    52           95          7.39683         contract inside
    53           97          7.39683         contract inside
    54           99          7.39683         contract inside
    55          101          7.04219         expand
    56          103           6.5382         reflect
    57          105          5.83367         reflect
    58          107          5.83367         contract inside
    59          108          5.83367         reflect
    60          110          5.35906         reflect
    61          112          5.35906         contract inside
    62          114          5.07969         expand
    63          116          4.75141         reflect
    64          118          4.13279         expand
    65          119          4.13279         reflect
    66          121          3.75757         reflect
    67          122          3.75757         reflect
    68          124           3.6457         reflect
    69          126          3.28541         contract inside
    70          128          2.67144         expand
    71          130          2.67144         contract inside
    72          131          2.67144         reflect
    73          133          2.44713         reflect
    74          134          2.44713         reflect
    75          136          2.13287         reflect
    76          138          2.13287         contract inside
    77          140          2.09436         reflect
    78          142          1.91635         reflect
    79          143          1.91635         reflect
    80          145          1.77117         reflect
    81          147          1.77117         contract inside
    82          149          1.55861         expand
    83          151          1.54648         reflect
    84          153          1.23511         expand
    85          154          1.23511         reflect
    86          156          0.89568         expand
    87          157          0.89568         reflect
    88          159          0.89568         contract inside
    89          161         0.872032         contract inside
    90          163         0.867117         contract inside
    91          165         0.778392         contract inside
    92          166         0.778392         reflect
    93          168         0.778392         contract inside
    94          169         0.778392         reflect
    95          171         0.684606         expand
    96          172         0.684606         reflect
    97          174         0.628377         expand
    98          176         0.473525         expand
    99          178         0.473525         contract inside
   100          179         0.473525         reflect
   101          181         0.381509         expand
   102          183         0.355924         reflect
   103          185         0.263623         reflect
   104          187         0.263623         contract inside
   105          189         0.170293         expand
   106          191         0.170293         contract outside
   107          193        0.0703278         expand
   108          195        0.0703278         contract inside
   109          196        0.0703278         reflect
   110          198        0.0703278         contract inside
   111          200        0.0703278         contract inside
   112          202        0.0597175         reflect
   113          204        0.0558506         reflect
   114          206        0.0442966         reflect
   115          207        0.0442966         reflect
   116          209        0.0354082         reflect
   117          211        0.0341855         contract inside
   118          213        0.0187075         expand
   119          215        0.0187075         contract inside
   120          217        0.0151268         reflect
   121          219       0.00379917         expand
   122          221       0.00379917         contract inside
   123          222       0.00379917         reflect
   124          224       0.00212662         reflect
   125          226       0.00192629         contract inside
   126          228       0.00111259         reflect
   127          229       0.00111259         reflect
   128          231      0.000896357         reflect
   129          233      9.14209e-05         contract inside
   130          234      9.14209e-05         reflect
   131          236      9.14209e-05         contract inside
   132          238      6.64122e-05         contract outside
 
Optimization terminated:
 the current x satisfies the termination criteria using OPTIONS.TolX of 5.000000e-01 
 and F(X) satisfies the convergence criteria using OPTIONS.TolFun of 1.000000e-04 


x_minsearch =

    1.0016    1.0024


f_minsearch =

   6.6412e-05


x_min_simpleks =

   15.1294   15.4830


f_min_simpleks =

   4.5548e+06


iteration_simpleks =

     1


ans =

    15    15
```
4. Kai ![56](C:\Users\Laura\Desktop\Darbai\Operacijų_tyrimas_taikymai\2lab\Final\56.gif)

```matlab

 Iteration   Func-count     min f(x)         Procedure
     0            1       4.4102e+06         
     1            3      4.37875e+06         initial simplex
     2            5      2.75991e+06         expand
     3            7      2.09539e+06         expand
     4            9           469081         expand
     5           11          21656.6         expand
     6           12          21656.6         reflect
     7           14          21656.6         contract outside
     8           16          21656.6         contract inside
     9           18          11341.3         contract inside
    10           20          6188.26         contract inside
    11           22          230.245         contract inside
    12           23          230.245         reflect
    13           25          230.245         contract inside
    14           27          230.245         contract inside
    15           29          33.4702         contract inside
    16           30          33.4702         reflect
    17           32          26.5317         contract inside
    18           34          26.5317         contract outside
    19           36          20.7377         contract inside
    20           38          16.0398         contract inside
    21           39          16.0398         reflect
    22           41          15.7994         contract inside
    23           43          15.7994         contract outside
    24           45          15.5181         contract inside
    25           46          15.5181         reflect
    26           48          15.5181         contract inside
    27           50          15.5181         contract inside
    28           52          15.5181         contract inside
    29           53          15.5181         reflect
    30           55          15.4799         expand
    31           57          15.4799         contract inside
    32           59          15.4512         expand
    33           61          15.3768         expand
    34           63          15.3446         expand
    35           65          15.1685         expand
    36           66          15.1685         reflect
    37           68          15.1114         expand
    38           70          14.7306         expand
    39           71          14.7306         reflect
    40           73          14.3233         expand
    41           75          14.1814         reflect
    42           77           13.705         expand
    43           79          12.8947         expand
    44           80          12.8947         reflect
    45           82          11.2351         expand
    46           84          11.2351         contract inside
    47           86          11.2351         contract outside
    48           88          10.2749         expand
    49           90          9.89486         expand
    50           91          9.89486         reflect
    51           93          7.39683         expand
    52           95          7.39683         contract inside
    53           97          7.39683         contract inside
    54           99          7.39683         contract inside
    55          101          7.04219         expand
    56          103           6.5382         reflect
    57          105          5.83367         reflect
    58          107          5.83367         contract inside
    59          108          5.83367         reflect
    60          110          5.35906         reflect
    61          112          5.35906         contract inside
    62          114          5.07969         expand
    63          116          4.75141         reflect
    64          118          4.13279         expand
    65          119          4.13279         reflect
    66          121          3.75757         reflect
    67          122          3.75757         reflect
    68          124           3.6457         reflect
    69          126          3.28541         contract inside
    70          128          2.67144         expand
    71          130          2.67144         contract inside
    72          131          2.67144         reflect
    73          133          2.44713         reflect
    74          134          2.44713         reflect
    75          136          2.13287         reflect
    76          138          2.13287         contract inside
    77          140          2.09436         reflect
    78          142          1.91635         reflect
    79          143          1.91635         reflect
    80          145          1.77117         reflect
    81          147          1.77117         contract inside
    82          149          1.55861         expand
    83          151          1.54648         reflect
    84          153          1.23511         expand
    85          154          1.23511         reflect
    86          156          0.89568         expand
    87          157          0.89568         reflect
    88          159          0.89568         contract inside
    89          161         0.872032         contract inside
    90          163         0.867117         contract inside
    91          165         0.778392         contract inside
    92          166         0.778392         reflect
    93          168         0.778392         contract inside
    94          169         0.778392         reflect
    95          171         0.684606         expand
    96          172         0.684606         reflect
    97          174         0.628377         expand
    98          176         0.473525         expand
    99          178         0.473525         contract inside
   100          179         0.473525         reflect
   101          181         0.381509         expand
   102          183         0.355924         reflect
   103          185         0.263623         reflect
   104          187         0.263623         contract inside
   105          189         0.170293         expand
   106          191         0.170293         contract outside
   107          193        0.0703278         expand
   108          195        0.0703278         contract inside
   109          196        0.0703278         reflect
   110          198        0.0703278         contract inside
   111          200        0.0703278         contract inside
   112          202        0.0597175         reflect
   113          204        0.0558506         reflect
   114          206        0.0442966         reflect
   115          207        0.0442966         reflect
   116          209        0.0354082         reflect
   117          211        0.0341855         contract inside
   118          213        0.0187075         expand
   119          215        0.0187075         contract inside
   120          217        0.0151268         reflect
   121          219       0.00379917         expand
   122          221       0.00379917         contract inside
   123          222       0.00379917         reflect
   124          224       0.00212662         reflect
   125          226       0.00192629         contract inside
   126          228       0.00111259         reflect
   127          229       0.00111259         reflect
   128          231      0.000896357         reflect
   129          233      9.14209e-05         contract inside
   130          234      9.14209e-05         reflect
   131          236      9.14209e-05         contract inside
   132          238      6.64122e-05         contract outside
 
Optimization terminated:
 the current x satisfies the termination criteria using OPTIONS.TolX of 5.000000e-02 
 and F(X) satisfies the convergence criteria using OPTIONS.TolFun of 1.000000e-04 


x_minsearch =

    1.0016    1.0024


f_minsearch =

   6.6412e-05


x_min_simpleks =

   15.0129   15.0483


f_min_simpleks =

   4.4245e+06


iteration_simpleks =

     1


ans =

    15    15
    
Rezultatų lentelė:
```

|                                | kai alfa=0.5, x0=(4; 4) | kai alfa=0.5, x0 = (10; 10) | kai alfa=0.5, x0 = (15; 15) | kai alfa=0.05, x0 = (15; 15) |
| :----------------------------: | :---------------------: | :-------------------------: | :-------------------------: | :--------------------------: |
|   minimumo taškas fminsearch   |   [0.9979;   0.9956]    |     [0.9978;   0.9955]      |     [1.0016;   1.0024]      |      [1.0016;   1.0024]      |
| funkcijos minimumas fminsearch |       1.0177e-05        |         5.0669e-06          |         6.6412e-05          |          6.6412e-05          |
| iteracijų skaičius fminsearch  |           72            |             113             |             132             |             132              |
|    minimumo taškas simpleks    |   [4.1294;   4.4830]    |    [10.1294;   10.4830]     |    [15.1294;   15.4830]     |     [15.0129;   15.0483]     |
|  funkcijos minimumas simpleks  |       1.5808e+04        |         8.4873e+05          |         4.5548e+06          |          4.4245e+06          |
|  iteracijų skaičius simpleks   |            1            |              1              |              1              |              1               |

Išvados:

1. Keičiant bazinius taškus, keitėsi iteracijų skaičius fminsearch atveju, tačiau simpleks atveju iteracijų skaičius nesikeitė. Taip pat keitėsi minimumo taškai ir funkcijų minimumai.
2. Keičiant tikslumo reikšmę, kai alfa lygi 0.5 ir kai alfa lygi 0.05, minimumo taškas fminsearch atveju nepasikeitė, o simpleks atveju, šiek tiek pasikeitė. Iteracijų skaičius taip pat liko nekitęs.
3. Tikslesni rezultatai gaunami naudojantis fminsearch, tačiau, naudojantis fminsearch, iteracijų atliekama žymiai daugiau.

Grafikai atveju, kai ![56](C:\Users\Laura\Desktop\Darbai\Operacijų_tyrimas_taikymai\2lab\Final\56.gif)

![2](C:\Users\Laura\Desktop\Darbai\Operacijų_tyrimas_taikymai\2lab\Final\2.PNG)

![3](C:\Users\Laura\Desktop\Darbai\Operacijų_tyrimas_taikymai\2lab\Final\3.PNG)
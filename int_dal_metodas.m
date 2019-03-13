              
                                      %intervalo dalijimo pusiau metodas
function [x_min_m, f_min, nauja_a, nauja_b, iteration, L1, xpoint, xvalue] = int_dal_metodas(a, b)
    iteration = 1;                    %pirma iteracija
    x_m = (a + b)/2;                  %x_m - intervalo vidurio ta�kas, a - intervalo prad�ia, b - intervalo pabaiga 
    fx_m = tikslo_funkcija(x_m);      %tikslo funkcijos reik�m� intervalo vidurio ta�ke
    x_min_m = x_m;                    %turima minimali intervalo vidurio koordinat�
    fx_m1 = fx_m;                     %nauja funkcijos reik�m�
    fx_m2 = fx_m;                     %nauja funkcijos reik�m�  
    xpoint(iteration) = x_m;          %i�saugomas ta�kas x_m
    xvalue(iteration) = fx_m1;        %i�saugoma funkcijos reik�m� x_m ta�ke 
    nauja_a = a;                      %nauja intervalo prad�ia
    nauja_b = b;                      %nauja intervalo pabaiga
    L = b - a;                        %randame intervalo ilg�
    L1 = L;                           %i�saugome intervalo ilg�
    
    while fx_m2 >= fx_m1              %ciklas ta�kams palyginti
        iteration = iteration + 1;    %didiname iteracij� skai�i�
        x1 = a + L/4;                 %didiname prad�ios ta�k� ketvirtadaliu
        x2 = b - L/4;                 %ma�iname pabaigos ta�k� ketvirtadaliu
        fx1 = tikslo_funkcija(x1);    %funkcijos reik�m� naujoje intervalo prad�ioje ta�ke x1
        fx2 = tikslo_funkcija(x2);    %funkcijos reik�m� naujoje intervalo pabaigoje ta�ke x2
        
                                      %jeigu funkcijos reik�m� naujoje intervalo prad�ioje yra ma�esne u�
                                      %tikslo funkcijos reik�m� buvusiame vidurio ta�ke, tuomet
        if(fx1 < fx_m)
            b = x_m;                  %intervalo pabaiga yra lygi buvusiam vidurio ta�kui
            x_m = x1;                 %buv�s vidurio ta�kas tampa nauja intervalo prad�ia
        else                          %jei funkcijos reik�m� naujoje intervalo pabaigoje yra ma�esn�
                                      %u� matematinio modelio reik�m� buvusiame vidurio ta�ke, tuomet
            if(fx2 < fx_m)                
                a = x_m;              %intervalo prad�ia yra lygi buvusiam vidurio ta�kui
                x_m = x2;             %buv�s vidurio ta�kas tampa nauja intervalo pabaiga
            else                      %kitu atveju
                a = x1;               %intervalo prad�ia pasistumia ketvirtadaliu viso intervalo ilgio
                b = x2;               %intervalo b atsitraukia ketvirtadaliu viso intervalo ilgio
            end
        end
        
        fx_m1 = tikslo_funkcija(x_m); %tikslo funkcijos reik�m� naujame vidurio ta�ke
        xpoint(iteration) = x_m;      %i�saugomas ta�kas
        xvalue(iteration) = fx_m1;    %i�saugoma reik�m�
        L = b - a;                    %i�saugomas naujas intervalo ilgis
        if(fx_m2 > fx_m1)             %jeigu tenkinama s�lyg�
            L1 = L;                   %perkeliamas ta�kas 
            nauja_a = a;              %perkeliamas ta�kas
            nauja_b = b;              %perkeliamas ta�kas
            x_min_m = x_m;            %perkeliamas ta�kas
            fx_m2 = fx_m1;            %perkeliamas ta�kas
        end
    end

    f_min = fx_m2;                    %rasta tikslo funkcijos minimali reik�m�
end


              
                                      %intervalo dalijimo pusiau metodas
function [x_min_m, f_min, nauja_a, nauja_b, iteration, L1, xpoint, xvalue] = int_dal_metodas(a, b)
    iteration = 1;                    %pirma iteracija
    x_m = (a + b)/2;                  %x_m - intervalo vidurio taðkas, a - intervalo pradþia, b - intervalo pabaiga 
    fx_m = tikslo_funkcija(x_m);      %tikslo funkcijos reikðmë intervalo vidurio taðke
    x_min_m = x_m;                    %turima minimali intervalo vidurio koordinatë
    fx_m1 = fx_m;                     %nauja funkcijos reikðmë
    fx_m2 = fx_m;                     %nauja funkcijos reikðmë  
    xpoint(iteration) = x_m;          %iðsaugomas taðkas x_m
    xvalue(iteration) = fx_m1;        %iðsaugoma funkcijos reikðmë x_m taðke 
    nauja_a = a;                      %nauja intervalo pradþia
    nauja_b = b;                      %nauja intervalo pabaiga
    L = b - a;                        %randame intervalo ilgá
    L1 = L;                           %iðsaugome intervalo ilgá
    
    while fx_m2 >= fx_m1              %ciklas taðkams palyginti
        iteration = iteration + 1;    %didiname iteracijø skaièiø
        x1 = a + L/4;                 %didiname pradþios taðkà ketvirtadaliu
        x2 = b - L/4;                 %maþiname pabaigos taðkà ketvirtadaliu
        fx1 = tikslo_funkcija(x1);    %funkcijos reikðmë naujoje intervalo pradþioje taðke x1
        fx2 = tikslo_funkcija(x2);    %funkcijos reikðmë naujoje intervalo pabaigoje taðke x2
        
                                      %jeigu funkcijos reikðmë naujoje intervalo pradþioje yra maþesne uþ
                                      %tikslo funkcijos reikðmæ buvusiame vidurio taðke, tuomet
        if(fx1 < fx_m)
            b = x_m;                  %intervalo pabaiga yra lygi buvusiam vidurio taðkui
            x_m = x1;                 %buvæs vidurio taðkas tampa nauja intervalo pradþia
        else                          %jei funkcijos reikðmë naujoje intervalo pabaigoje yra maþesnë
                                      %uþ matematinio modelio reikðmæ buvusiame vidurio taðke, tuomet
            if(fx2 < fx_m)                
                a = x_m;              %intervalo pradþia yra lygi buvusiam vidurio taðkui
                x_m = x2;             %buvæs vidurio taðkas tampa nauja intervalo pabaiga
            else                      %kitu atveju
                a = x1;               %intervalo pradþia pasistumia ketvirtadaliu viso intervalo ilgio
                b = x2;               %intervalo b atsitraukia ketvirtadaliu viso intervalo ilgio
            end
        end
        
        fx_m1 = tikslo_funkcija(x_m); %tikslo funkcijos reikðmë naujame vidurio taðke
        xpoint(iteration) = x_m;      %iðsaugomas taðkas
        xvalue(iteration) = fx_m1;    %iðsaugoma reikðmë
        L = b - a;                    %iðsaugomas naujas intervalo ilgis
        if(fx_m2 > fx_m1)             %jeigu tenkinama sàlygà
            L1 = L;                   %perkeliamas taðkas 
            nauja_a = a;              %perkeliamas taðkas
            nauja_b = b;              %perkeliamas taðkas
            x_min_m = x_m;            %perkeliamas taðkas
            fx_m2 = fx_m1;            %perkeliamas taðkas
        end
    end

    f_min = fx_m2;                    %rasta tikslo funkcijos minimali reikðmë
end


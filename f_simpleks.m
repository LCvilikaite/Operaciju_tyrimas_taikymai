
    %apsiraðome funkcijà, kuri ieðkotø funkcijos minimumo ir minimumo taðko
    %paprastuoju simpleks metodu
function [x_min_simpleks, f_min_simpleks, iteration_simpleks] = f_simpleks(x0, n, alfa)
    %priskiriame pradinæ 0 iteracijos reikðmæ
    iteration_simpleks = 0;
    stop_ = 0;
    %apsibrëþiame maksimalø iteracijø skaièiø
    m = 1000;
    %apskaièiuojame delta1 ir delta2, formulës ið paskaitos skaidriø
    delta1 = (sqrt(n+1) + n - 1)* alfa/(n * sqrt(2));
    delta2 = (sqrt(n+1) - 1) * alfa/(n * sqrt(2)); 
    %apskaièiuojamos kitos virðûnës, formulës ið paskaitos skaidriø
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
    %vykdysime ciklà while
    while stop_ == 0 
    %priskiriame tikslo funkcijos reikðmæ x0 taðke
       fx0 = f_tikslo(x0);
       %sukame ciklà susirinkti tikslo funkcijos reikðmëms
        for i = 1:n
           fx(i) = f_tikslo(x{i});
        end
        %randamos virðûniø svorio centro koordinatës
        for i = 1:n
            xc(i) = 0;
            for j = 1:n
                xc(i) = xc(i) + x{i}(j);
            end
            %daliname ið n pagal formulæ
            xc(i) = xc(i) / n;
        end
          
        %naujos simplekso virðûnës apskaièiavimas
        x_naujas = -x0 + 2 * xc; 
        %apsibrëþiame funkcijos reikðmæ naujoje simpleks virðûnëje
        f_x_naujas = f_tikslo(x_naujas); 
        
        %toliau ieðkome maksimalios funkcijos reikðmës
        maksimali = 1;
        f_maksimali = fx(maksimali); 
        for i = 1:n
            %jei i-toji funkcijos reikmðmë didesnë uþ maksimalià, bus
            %randama maksimali reikðmë
            if(fx(i) > f_maksimali)
                f_maksimali = fx(i); 
                maksimali = i;
            end
        end
        %jei f-jos reikðmë naujoje simplekso virðûneje didesnë negu
        %kitose - nutraukiama
        if(f_maksimali < f_x_naujas)
            stop_ = 1; 
        else 
            x{maksimali} = x_naujas;
        end
        %jei iteracijø skaièius virðija maksimalø iteracijø skaièiø m -
        %nutraukiama
         if(iteration_simpleks > m)     
            stop_ = 1;
        end       
        iteration_simpleks = iteration_simpleks + 1; 
    end

    %ieðkome minimalios funkcijos reikðmës
    minimali = 1;
    fminx = fx(maksimali);
    %sukame for ciklà, kol randamas funkcijos minimumas
    for i = 1:n
        if(fx(i) < fminx)
            fminx = fx(i); 
            imin = i;
        end
    end
    %x reikðmës paprastojo simplekso metodu
    x_min_simpleks = x{minimali}; 
    %f-jos minimumas paprastojo simplekso metodu
    f_min_simpleks = fminx; 
end
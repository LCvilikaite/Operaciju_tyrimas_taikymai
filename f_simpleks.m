
    %apsira�ome funkcij�, kuri ie�kot� funkcijos minimumo ir minimumo ta�ko
    %paprastuoju simpleks metodu
function [x_min_simpleks, f_min_simpleks, iteration_simpleks] = f_simpleks(x0, n, alfa)
    %priskiriame pradin� 0 iteracijos reik�m�
    iteration_simpleks = 0;
    stop_ = 0;
    %apsibr��iame maksimal� iteracij� skai�i�
    m = 1000;
    %apskai�iuojame delta1 ir delta2, formul�s i� paskaitos skaidri�
    delta1 = (sqrt(n+1) + n - 1)* alfa/(n * sqrt(2));
    delta2 = (sqrt(n+1) - 1) * alfa/(n * sqrt(2)); 
    %apskai�iuojamos kitos vir��n�s, formul�s i� paskaitos skaidri�
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
    %vykdysime cikl� while
    while stop_ == 0 
    %priskiriame tikslo funkcijos reik�m� x0 ta�ke
       fx0 = f_tikslo(x0);
       %sukame cikl� susirinkti tikslo funkcijos reik�m�ms
        for i = 1:n
           fx(i) = f_tikslo(x{i});
        end
        %randamos vir��ni� svorio centro koordinat�s
        for i = 1:n
            xc(i) = 0;
            for j = 1:n
                xc(i) = xc(i) + x{i}(j);
            end
            %daliname i� n pagal formul�
            xc(i) = xc(i) / n;
        end
          
        %naujos simplekso vir��n�s apskai�iavimas
        x_naujas = -x0 + 2 * xc; 
        %apsibr��iame funkcijos reik�m� naujoje simpleks vir��n�je
        f_x_naujas = f_tikslo(x_naujas); 
        
        %toliau ie�kome maksimalios funkcijos reik�m�s
        maksimali = 1;
        f_maksimali = fx(maksimali); 
        for i = 1:n
            %jei i-toji funkcijos reikm�m� didesn� u� maksimali�, bus
            %randama maksimali reik�m�
            if(fx(i) > f_maksimali)
                f_maksimali = fx(i); 
                maksimali = i;
            end
        end
        %jei f-jos reik�m� naujoje simplekso vir��neje didesn� negu
        %kitose - nutraukiama
        if(f_maksimali < f_x_naujas)
            stop_ = 1; 
        else 
            x{maksimali} = x_naujas;
        end
        %jei iteracij� skai�ius vir�ija maksimal� iteracij� skai�i� m -
        %nutraukiama
         if(iteration_simpleks > m)     
            stop_ = 1;
        end       
        iteration_simpleks = iteration_simpleks + 1; 
    end

    %ie�kome minimalios funkcijos reik�m�s
    minimali = 1;
    fminx = fx(maksimali);
    %sukame for cikl�, kol randamas funkcijos minimumas
    for i = 1:n
        if(fx(i) < fminx)
            fminx = fx(i); 
            imin = i;
        end
    end
    %x reik�m�s paprastojo simplekso metodu
    x_min_simpleks = x{minimali}; 
    %f-jos minimumas paprastojo simplekso metodu
    f_min_simpleks = fminx; 
end
                                                   
                                                    %funkcija minimalioms i�laidoms rasti
function [q, t, x_min_m, f_min, islaidos, iteration, L] = min_islaidos(a, b)
  [x_min_m, f_min, nauja_a, nauja_b, iteration, L, xpoint, xvalue] = int_dal_metodas(a, b);
  mid_point = (nauja_a+nauja_b)/2;                  %mid_point - intervalo vidurio ta�kas, nauja_a - intervalo prad�ia, nauja_b - intervalo pabaiga 
  mid_point_floor = floor(mid_point);               %vidurio ta�ko apatin� riba
  f_floor = tikslo_funkcija(mid_point_floor);       %tikslo funkcijos reik�m� ta�ke mid_point_floor
  mid_point_ceil = ceil(mid_point);                 %vidurio ta�ko vir�utin� riba
  f_ceil = tikslo_funkcija(mid_point_ceil);         %tikslo funkcijos reik�m� ta�ke mid_point_ceil
  
  if(f_floor > f_ceil)                              %lyginame tikslo funkcijos reik�m� su apatine reik�me
    islaidos = f_ceil;                              %i�saugoma vir�utin� reik�m�
    t = mid_point_ceil                              %i�saugoma vir�utin� reik�m�
  else                                              
    islaidos = f_floor;                             %i�saugoma apatin� reik�m�
    t = mid_point_floor;                            %i�saugoma reik�m�
  end
 
  x = a:1:b;                                        %vektorius nuo intervalo prad�ios iki pabaigos
  y = tikslo_funkcija(x);                           %tikslo funkcija
 
                                                    %aukso pj�vis ir interpoliacija
  optimization = optimset('Display', 'iter', 'MaxFunEvals', 1000, 'PlotFcns', @optimplotfval , 'TolX', L);
  [xfminbnd, yfminbnd] = fminbnd(@tikslo_funkcija, a, b, optimization)
  
  figure                                            %br��iame grafik�
  plot(x, y, '.-', xpoint, xvalue, '.-'), legend('Kiekviename ta�ke', 'Dalijame interval� pusiau'); 
  title('I�laid� kitimas pagal ve�imo period� t');
  xlabel('Preki� ve�imo periodas (t)');
  ylabel('I�laidos per dien�'); 
  
  b = mod(20182746, 7)/2 + 2.5;                     %parametras b duotas s�lygoje, �sistatome savo stud_nr
  q = t * b;                                        %vienos partijos dydis
  f_min                                             %tikslo f-jos minimumas
  x_min_m                                           %tikslo f-jos minimumo ta�kas
  t                                                 %optimalus preki� ve�imo periodas dienomis                                
  q                                                 %optimali preki� partijos apimtis
  islaidos                                          %optimalus sprendinys                                   
  iteration                                         %iteracij� skai�ius
  L                                                 %intervalo ilgis
  xfminbnd                                          %funkcijos minimalaus ta�ko koordinat� auksinio pj�vio ir kvadratin�s interpoliacijos metodu
  yfminbnd                                          %funkcijos minimumo reik�m� auksinio pj�vio ir kvadratin�s interpoliacijos metodu
  
end

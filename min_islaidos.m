                                                   
                                                    %funkcija minimalioms iðlaidoms rasti
function [q, t, x_min_m, f_min, islaidos, iteration, L] = min_islaidos(a, b)
  [x_min_m, f_min, nauja_a, nauja_b, iteration, L, xpoint, xvalue] = int_dal_metodas(a, b);
  mid_point = (nauja_a+nauja_b)/2;                  %mid_point - intervalo vidurio taðkas, nauja_a - intervalo pradþia, nauja_b - intervalo pabaiga 
  mid_point_floor = floor(mid_point);               %vidurio taðko apatinë riba
  f_floor = tikslo_funkcija(mid_point_floor);       %tikslo funkcijos reikðmë taðke mid_point_floor
  mid_point_ceil = ceil(mid_point);                 %vidurio taðko virðutinë riba
  f_ceil = tikslo_funkcija(mid_point_ceil);         %tikslo funkcijos reikðmë taðke mid_point_ceil
  
  if(f_floor > f_ceil)                              %lyginame tikslo funkcijos reikðmæ su apatine reikðme
    islaidos = f_ceil;                              %iðsaugoma virðutinë reikðmë
    t = mid_point_ceil                              %iðsaugoma virðutinë reikðmë
  else                                              
    islaidos = f_floor;                             %iðsaugoma apatinë reikðmë
    t = mid_point_floor;                            %iðsaugoma reikðmë
  end
 
  x = a:1:b;                                        %vektorius nuo intervalo pradþios iki pabaigos
  y = tikslo_funkcija(x);                           %tikslo funkcija
 
                                                    %aukso pjûvis ir interpoliacija
  optimization = optimset('Display', 'iter', 'MaxFunEvals', 1000, 'PlotFcns', @optimplotfval , 'TolX', L);
  [xfminbnd, yfminbnd] = fminbnd(@tikslo_funkcija, a, b, optimization)
  
  figure                                            %brëþiame grafikà
  plot(x, y, '.-', xpoint, xvalue, '.-'), legend('Kiekviename taðke', 'Dalijame intervalà pusiau'); 
  title('Iðlaidø kitimas pagal veþimo periodà t');
  xlabel('Prekiø veþimo periodas (t)');
  ylabel('Iðlaidos per dienà'); 
  
  b = mod(20182746, 7)/2 + 2.5;                     %parametras b duotas sàlygoje, ásistatome savo stud_nr
  q = t * b;                                        %vienos partijos dydis
  f_min                                             %tikslo f-jos minimumas
  x_min_m                                           %tikslo f-jos minimumo taðkas
  t                                                 %optimalus prekiø veþimo periodas dienomis                                
  q                                                 %optimali prekiø partijos apimtis
  islaidos                                          %optimalus sprendinys                                   
  iteration                                         %iteracijø skaièius
  L                                                 %intervalo ilgis
  xfminbnd                                          %funkcijos minimalaus taðko koordinatë auksinio pjûvio ir kvadratinës interpoliacijos metodu
  yfminbnd                                          %funkcijos minimumo reikðmë auksinio pjûvio ir kvadratinës interpoliacijos metodu
  
end

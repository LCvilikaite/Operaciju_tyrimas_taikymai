
   %funkcija, minimumo taðko bei minimumo radimui simplekso metodu ir
   %pasinaudojant fminsearch
function [x0, alfa, x_minsearch, f_minsearch, x_min_simpleks, f_min_simpleks, iteration_simpleks] = f_minimumui(x_minsearch)
   %apsibrëþiame kintamuosius ið sàlygos
   %studentës numeris
   stud_nr = 20182746;
   %pasirenkame baziná taðkà x0, ðiuo atveju x0=(4, 4)
   x0 = [mod(stud_nr, 10)/2 + 1,  mod(stud_nr, 10)/2 + 1]; 
   %pradinis variantas, kuomet simplekso dydá reguliuojanèio parametro
   %reikðmë alfa lygi 0.5
   alfa = 0.5;
   %funkcija dviejø kintamøjø, todël n=2
   n = 2; 
   %apsibrëþiame parametrus fminsearch funkcijai
   options = optimset('Display', 'iter' , 'TolX', alfa, 'PlotFcns',@optimplotfval); 
   %brëþiame x1, x2 grafikà
   [X1, X2] = meshgrid(-4:0.1:4, -4:0.1:4);
   %randame y reikðmes 
   y = 100.*(X2-X1.^2).^2 + (1-X1).^2;
    surf(X1,X2,y);
    xlabel('x1');
    ylabel('x2');
    zlabel('F(x1,x2)');
    title('F(x1,x2)=100*(x2-x1^2)^2 + (1-x1)^2');
    %kvieèiame fminsearch minimø radimui
  [x_minsearch, f_minsearch] = fminsearch(@f_tikslo, x0, options)
    %kvieèiame simpleks metodà minimumø radimui
  [x_min_simpleks, f_min_simpleks, iteration_simpleks] = f_simpleks(x0, n, alfa)
end
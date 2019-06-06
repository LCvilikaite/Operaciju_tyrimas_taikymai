
%apsibr��iame kintamuosius i� s�lygos
darbo_laikas  = [5+mod(20182746,2) 4+mod(20182746,3) 1+mod(20182746,4) 5+mod(20182746,5)];
%i�vedame rezultatus su disp funkcija
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
%apsibr��iame apribojimus
%apribojimas gamybos terminui
gamyb_apr = 780;
%apribojimas pirmosioms s�naudoms, gauname 492
san_apr1 = 400 + 2* mod(20182746,100);
disp("san_apr1");
disp(san_apr1);
%apribojimas antrosioms s�naudoms, gauname 946
san_apr2 = 700 + mod(20182746,300);
disp("san_apr2");
disp(san_apr2);
%apribojimas gaminiams, gauname 346
gamin_sk_apr = 250 + mod(20182746,150);
disp("gamin_sk_apr");
disp(gamin_sk_apr);
%ciklo ilgis
n = length(pard_kaina); 
%pridedame gamin� matriciniu pavidalu
gam = [1 1 1 1];
%jungiame masyvus vertikaliai su vertcat funkcija
koef = vertcat(darbo_laikas, sanaudos_1, sanaudos_2, -gam);
apribojimai = [gamyb_apr san_apr1 san_apr2 -gamin_sk_apr];
%vir�utin� riba
virs = []; 
%apatin� riba
apat = zeros(n,1); 
%kuriame optimizavimo strukt�r�
options = optimset; 
%i�vedame kiekvien� iteracij� � ekran�
options.Display = 'iter';
%pasirenkame algoritm�
options.Algorithm = 'interior-point-legacy';
%pritaikome linprog algoritm�
[x,fval,exitflag,output,lambda] = linprog(-pard_kaina,koef,apribojimai,[],[],apat,virs,[],options);
%Lagran�o daugikliai nelygybei
Lagranzo = lambda.ineqlin;
%ciklas iteracij� i�vedimui � ekran�
for i=1:n 
    fprintf('\n x%1.0f = %8.4f',i,x(i));
end
fprintf('\n %8.4f\n',-fval);



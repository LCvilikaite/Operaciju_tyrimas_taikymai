
%apsibr��iame kintamuosius i� s�lygos, pridedame prek� "E"
darbo_laikas_E  = [5+mod(20182746,2) 4+mod(20182746,3) 1+mod(20182746,4) 5+mod(20182746,5) 8+mod(20182746,5)];
%i�vedame rezultatus su disp funkcija
disp("darbo_laikas_E");
disp(darbo_laikas_E);
sanaudos_1_E  = [3+mod(20182746,7) 4+mod(20182746,5) 2+mod(20182746,9) 5+mod(20182746,3) 2+mod(20182746,7)];
disp("sanaudos_1_E");
disp(sanaudos_1_E);
sanaudos_2_E  = [2+mod(20182746,13) 7+mod(20182746,4) 4+mod(20182746,9) 3+mod(20182746,3) 6+mod(20182746,1)];
disp("sanaudos_2_E");
disp(sanaudos_2_E);
sanaudos_3_E  = [2+mod(20182746,6) 4+mod(20182746,7) 5+mod(20182746,6) 1+mod(20182746,3) 9+mod(20182746,5)];
disp("sanaudos_3_E");
disp(sanaudos_3_E);
pard_kaina_E  = [60+mod(20182746,11) 50+mod(20182746,6) 20+mod(20182746,21) 70+mod(20182746,36) 39+mod(20182746,3)];
disp("pard_kaina_E");
disp(pard_kaina_E);
%apsibr��iame apribojimus
%apribojimas gamybos terminui
gamyb_apr_E = 780;
%apribojimas pirmosioms s�naudoms, gauname 492
san_apr1_E=400 + 2* mod(20182746,100);
disp("san_apr1_E");
disp(san_apr1_E);
%apribojimas antrosioms s�naudoms, gauname 946
san_apr2_E=700 + mod(20182746,300);
disp("san_apr2_E");
disp(san_apr2_E);
%apribojimas gaminiams, gauname 346
gamin_sk_apr_E = 250 + mod(20182746,150);
disp("gamin_sk_apr_E");
disp(gamin_sk_apr_E);
%ciklo ilgis
n=length(pard_kaina_E); 
%pridedame gamin� matriciniu pavidalu
gam_E = [1 1 1 1 1];
%jungiame masyvus vertikaliai su vertcat funkcija
koef_E = vertcat(darbo_laikas_E, sanaudos_1_E, sanaudos_2_E, -gam_E);
apribojimai_E = [gamyb_apr_E san_apr1_E san_apr2_E -gamin_sk_apr_E];
%vir�utin� riba
virs_E = []; 
%apatin� riba
apat_E = zeros(n,1); 
%kuriame optimizavimo strukt�r�
options = optimset; 
%i�vedame kiekvien� iteracij� � ekran�
options.Display = 'iter';
%pasirenkame algoritm�
options.Algorithm = 'interior-point-legacy';
%pritaikome linprog algoritm�
[x,fval,exitflag,output,lambda] = linprog(-pard_kaina_E,koef_E,apribojimai_E,[],[],apat_E,virs_E,[],options);
%Lagran�o daugikliai nelygybei
Lagranzo_E = lambda.ineqlin;
%ciklas iteracij� i�vedimui � ekran�
for i=1:n 
    fprintf('\n x%1.0f = %8.4f',i,x(i));
end
fprintf('\n %8.4f\n',-fval);



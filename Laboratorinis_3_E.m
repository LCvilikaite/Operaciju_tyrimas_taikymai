
%apsibrëþiame kintamuosius ið sàlygos, pridedame prekæ "E"
darbo_laikas_E  = [5+mod(20182746,2) 4+mod(20182746,3) 1+mod(20182746,4) 5+mod(20182746,5) 8+mod(20182746,5)];
%iðvedame rezultatus su disp funkcija
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
%apsibrëþiame apribojimus
%apribojimas gamybos terminui
gamyb_apr_E = 780;
%apribojimas pirmosioms sànaudoms, gauname 492
san_apr1_E=400 + 2* mod(20182746,100);
disp("san_apr1_E");
disp(san_apr1_E);
%apribojimas antrosioms sànaudoms, gauname 946
san_apr2_E=700 + mod(20182746,300);
disp("san_apr2_E");
disp(san_apr2_E);
%apribojimas gaminiams, gauname 346
gamin_sk_apr_E = 250 + mod(20182746,150);
disp("gamin_sk_apr_E");
disp(gamin_sk_apr_E);
%ciklo ilgis
n=length(pard_kaina_E); 
%pridedame gaminá matriciniu pavidalu
gam_E = [1 1 1 1 1];
%jungiame masyvus vertikaliai su vertcat funkcija
koef_E = vertcat(darbo_laikas_E, sanaudos_1_E, sanaudos_2_E, -gam_E);
apribojimai_E = [gamyb_apr_E san_apr1_E san_apr2_E -gamin_sk_apr_E];
%virðutinë riba
virs_E = []; 
%apatinë riba
apat_E = zeros(n,1); 
%kuriame optimizavimo struktûrà
options = optimset; 
%iðvedame kiekvienà iteracijà á ekranà
options.Display = 'iter';
%pasirenkame algoritmà
options.Algorithm = 'interior-point-legacy';
%pritaikome linprog algoritmà
[x,fval,exitflag,output,lambda] = linprog(-pard_kaina_E,koef_E,apribojimai_E,[],[],apat_E,virs_E,[],options);
%Lagranþo daugikliai nelygybei
Lagranzo_E = lambda.ineqlin;
%ciklas iteracijø iðvedimui á ekranà
for i=1:n 
    fprintf('\n x%1.0f = %8.4f',i,x(i));
end
fprintf('\n %8.4f\n',-fval);



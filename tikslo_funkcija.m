
function [ct] =  tikslo_funkcija(t)         %tikslo funkcija, priklausanti nuo laiko t
    b = mod(20182746, 7)/2 + 2.5;           %parametras b duotas s�lygoje, �sistatome savo stud_nr
    c2 = mod(20182746, 30) + 150;           %parametras c2 duotas s�lygoje, �sistatome savo stud_nr
    c = mod(20182746, 5) + 3;               %parametras c duotas s�lygoje, �sistatome savo stud_nr
    ct = b*c*t + c2./t;                     %tikslo funkcijos i�rai�ka
end
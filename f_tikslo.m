
%apsibrëþiame tikslo funkcijà, formulë buvo duota sàlygoje
function [y] = f_tikslo(x)
 y = 100* (x(2)-(x(1))^2)^2 + (1-x(1))^2;
end
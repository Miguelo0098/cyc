function factores = factorescomunes(w, s)
%factorescomunes - Description
%
% Syntax: factores = factorescomunes(w, s)
%
% Funcion para comprobar si un numero w tiene factores primos
% comunes con los elementos de la mochila s.
%
% Entradas: w: un numero entero
%           s: una mochila (no tiene por que ser supercreciente)
%
% Salida: 0 si no hay factores, 1 si hay factores comunes junto con
%         un mensaje que indeique los elementos con los que los tiene

factores = 0;
valores = [];
% Comprobamos para cada elemento
for index = 1:length(s)
    if s(index) == 1 % si es 1, lo ignoramos
        continue;
    end
    if gcd(s(index), w) ~= 1 % si no es primo relativo, ya tiene factores comunes
        factores = 1; 
        valores = [valores s(index)]; % Se actualiza la lista de valores
    end
end

if factores == 1
    disp('los numeros de la mochila con factores comunes a w son:'); % se muestra la lista de valores
    disp(valores);
end

end
function objetivo = obj_mochila(s, v)
%obj_mochila - Description
%
% Syntax: objetivo = obj_mochila(s, v)
%
% Funcion auxiliar que devuelve el valor objetivo de un vector de binarios
% 
% Entradas: s: mochila
%           v: vector de binarios que forman un objetivo
% 
% Salida: objetivo: objetivo del vector de binarios con respecto a la mochila

objetivo = 0;
for index = 1:length(s)
    objetivo = objetivo + s(index)*v(index);
end

end
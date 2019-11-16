function v = sol_mochila(s, obj)
%sol_mochila - Description
%
% Syntax: v = sol_mochila(s, obj)
%
% Funcion para comprobar si una mochila dada cumple 
% un determinado objetivo con el algoritmo estudiado
% para mochilas supercrecientes. Es una segunda función
% de control para poder implementar el cifrado de tipo mochila.
% 
% Entradas: s: mochila
%           obj: objetivo a alcanzar
% 
% Salida: En caso de que el objetivo se cumpla, un vector v
%         indicando los valores de la mochila que permiten obtenerlo.
%         En caso contrario v=0 y un mensaje

v = 0;
if any([mod(s,1) ~= 0 s <= 0])
    disp('Error: algun valor de la mochila no es entero positivo');
    return;
end

vec = [];
x = 0;

index = length(s);

% Creamos un bucle para recorrer de fin a inicio la mochila
while index ~= 0
    if obj >= s(index)
        x = 1; % si el objetivo es mayor o igual que el elemento
    else
        x = 0; % si no
    end
    vec = [x vec]; % se actualiza el vector de valores
    obj = obj - s(index)*x; % Se actualiza el objetivo
    index = index-1;
end

if obj ~= 0
    disp('No se ha podido encontrar el objetivo');
    return;
end
v = vec; % Se asigna el vector de valores a la salida
    
end
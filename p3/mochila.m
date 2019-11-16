function valida = mochila(s)
%mochila - Description
%
% Syntax: valida = mochila(s)
%
% Función para analizar si un vector fila 
% es una mochila simple o supercreciente. 
% Se trata de una función de control, 
% previa al cifrado de tipo mochila.
% 
% Entrada: vector fila, que representa la mochila. 
%
% Salida: valida=0 si la mochila no es supercreciente
%         valida=1 si la mochila es supercreciente

valida = 0;

if any([s <= 0 mod(s,1) ~= 0])
    disp('algun valor de la mochila no es entero positivo');
    return;
end

if ~issorted(s)
    disp('la mochila no es supercreciente, sus elementos no estan ordenados en orden creciente');
    return;
end

acc = 0;

% Compara los valores siguientes con el acumulado de los valores anteriores
for index = 1:length(s)
    % Si el valor es menor o igual al sumatorio de los anteriores no es supercreciente
    if s(index) <= acc
        disp('la mochila no es supercreciente')
        return;
    end
    % Se actualiza el acumulador
    acc = acc + s(index);
end

% Llegados a este punto, la mochila es supercreciente
valida = 1;
    
end
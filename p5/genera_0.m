function generador = genera_0(g, p)
%genera_0 - Description
%
% Syntax: generador = genera_0(g, p)
%
% Funcion que indica si el numero natural g es generador 
% del grupo multiplicativo determinado por el primo p. 
%
% Entradas: g: numero natural de Zp, a decidir si es generador
%           p: numero primo que determina el grupo multiplicativo
%
% Salida: generador = 0: no es generador o las entradas no son correctas
%         generador = g: en caso de que sea generador

generador = 0;
tic;

%Comprobamos las entradas
if any([g > p mod([g p], 1) ~= 0])
    disp('ERROR: las entradas no son correctas');
    toc;
    return;
end


generated = zeros(1, p-1);

for index = 1:p-1
    %Generamos todas las potencias de g modulo p hasta p-1 (desde 1 hasta p-1)
    generated(index) = potencia(g, index, p);
    
end

% Creamos un subconjunto con los valores unicos de las potencias generadas
conjunto = unique(generated);

% Si las longitudes no coinciden, todos los valores no son unicos y no corresponden con todos los numeros desde 1 hasta p-1
if length(conjunto) ~= length(generated)
    toc;
    return;
end

generador = g;
toc;


end
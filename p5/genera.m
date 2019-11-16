function generador = genera(g, p)
%genera - Description
%
% Syntax: generador = genera(g, p)
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
% Comprobamos que las entradas son correctas
if any([g > p factor(p) ~= p mod([g p], 1) ~= 0])
    disp('ERROR: las entradas no son correctas');
    toc;
    return;
end

% Obtenemos los factores de p-1
factors = factor(p-1);


for index = 1:length(factors)
    % Se comprueba que para cada uno, se cumple la condicion
    if potencia(g, (p-1)/factors(index), p) == 1
        toc;
        return
    end
    
end

% Llegados a este punto, lo cumple para todos los factores
generador = g;
toc;


end
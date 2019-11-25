function n = pote(A, m)
%pote - Description
%
% Syntax: n = pote(A, m)
%
% Funcion que debe calcular el minimo valor del exponente de 
% la potencia de A que módulo m es igual a la matriz identidad
% 
% Entradas: A: matriz cuadrada de orden 2 y con inversa modulo m
%           m: modulo de trabajo
%
% Salida: El valor del exponente que hace que la correspondiente potencia de A sea la identidad

Asize = size(A);

if any(Asize ~= 2)
    disp('ERROR: no es cuadrada');
    return;
end

if inv_modulo(A, m) == 0
    disp('ERROR: no tiene inverso modulo m');
    return;
end

n = 1;

I = [1 0; 0 1];

mat = A;

while ~all(mat == I)
    n = n + 1;
    mat = mod(mat*A, m)
end

end
function pote = potencia(c, d, n)
%potencia - Description
%
% Syntax: pote = potencia(c, d, n)
%
% Función que usa el algoritmo de 
% potenciación rápida para calcular 
% las potencias modulares
% 
% Entradas: c: base de la potencia. Un número natural
%           d: exponente de la potencia. Un número natural
%           n: módulo. Un número natural
%
% Salidas: pote es la potencia c^d modulo n.


% Comprobacion de las entradas
if any([mod([c d n], 1) ~= 0 [c d n] < 0])
    disp('Error: alguno de los valores introducidos no es un número natural');
    return;
end

pote = 1; % para poder hacer el producto sin error
%Transformamos pote en unsigned integer 64 bits
pote = uint64(pote);

%Pasamos d a un vector de binarios
bins = dec2bin(d);
binaries = str2double(regexp(num2str(bins),'\d','match'));

values = [];

%para generar todas las potencias
for index = 1:length(binaries)
    if index == 1
        %el primer elemento es c^1
        values = [values uint64(mod(c^(2^0), n))];
    else
        %el resto son el anterior elevado al cuadrado
        previous = values(index - 1);
        values = [values uint64(mod(previous^2, n))];
    end
     
end

%Damos la vuelta al vector de valores para que coincida con el exponente en binario
values = fliplr(values);

%Calculamos el producto de los valores calculados 
for index2 = 1:length(binaries)
    %Si en la posicion en los binarios hay un 1, ese valor es factor del producto final
    if binaries(index2) == 1
        pote = pote * values(index2);
        pote = mod(pote, n);
    end
end
    
end
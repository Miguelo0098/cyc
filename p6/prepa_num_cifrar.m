function blo = prepa_num_cifrar(tama, bloque)
%prepa_num_cifrar - Description
%
% Syntax: blo = prepa_num_cifrar(tama, bloque)
%
% Función que convierte una cadena numerica en bloques 
% de un tamaño dado, despues convierte dichos bloques en 
% numeros y los almacena en un vector. Si es necesario para 
% completar el ultimo bloque debemos completarlo con varios 
% 30 y/o un 0.
%
% Entradas: tama: tamaño de los bloques.
%           bloque: cadena numerica.
%
% Salida: blo: vector formado por los numeros que se corresponden 
%              con cada uno de los bloques.

if mod(tama,1) ~= 0
    return;
end

len = length(bloque);
fill = mod(len, tama);

if fill ~= 0
    fill = tama - fill;
    for index = 1:round(fill/2)
        if index == round(fill/2) && mod(fill, 2) == 1
            bloque = [bloque '0'];
        else
            bloque = [bloque '30'];
        end
    end
end

len = length(bloque);

bloque = reshape(bloque, [tama, len/tama]);
bloque = transpose(bloque);

blo = zeros(1, len/tama);

for index2 = 1:len/tama
    blo(index2) = str2num(bloque(index2,:));
end
    
end
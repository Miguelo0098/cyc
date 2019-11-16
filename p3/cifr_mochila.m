function cifrado = cifr_mochila(s, texto)
%cifr_mochila - Description
%
% Syntax: cifrado = cifr_mochila(s, texto)
%
% Funcion para cifrar un mensaje con una mochila 
% (no tiene por qué ser supercreciente)
% 
% Entradas: s: mochila
%           texto: texto a cifrar
%
% Salida: vector numérico que se corresponda con el mensaje cifrado
    
cifrado = 0;
if any([mod(s,1) ~= 0 s <= 0])
    disp('Error: algun valor de la mochila no es entero positivo');
    return;
end

numeros = double(texto);
binarios = [];

% Creamos un vector con los valores en binario de los caracteres ASCII
for index = 1:length(numeros)
    binarios = [binarios fliplr(sol_mochila([1,2,4,8,16,32,64,128], numeros(index)))];
    
end

%Comprobamos si es necesario añadir bits
addable = mod(length(binarios),length(s));
if addable ~= 0
    addable = length(s) - addable;
    for i = 1:addable
        binarios = [binarios 1];
    end
end

% Rehacemos el vector en una matriz de manera que cada fila sea del tamaño de la mochila
binarios = reshape(binarios,[length(s),length(binarios)/length(s)]);
binarios = transpose(binarios); % El reshape retorna la matriz por columnas, por lo que se debe trasponer
len = size(binarios);

cifrado = [];

for index2 = 1:len(1)
    cifrado = [cifrado obj_mochila(s,binarios(index2,:))]; % Se añaden los objetivos correspondientes a cada fila de bits
end

end
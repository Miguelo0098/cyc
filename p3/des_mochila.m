function texto = des_mochila(s, cifrado)
%des_mochila - Description
%
% Syntax: texto = des_mochila(s, cifrado)
%
% Funcion para descifrar un texto cifrado conociendo 
% la mochila supercreciente que se ha utilizado como clave
%
% Entradas: s: mochila que debe ser supercreciente
%           cifrado: vector de cifrado
%
% Salida: El texto claro

texto = '';
if mochila(s) == 0
    disp('Error, la mochila no es supercreciente');
    return;
end

% Creamos el vector de binarios
binarios = [];
for index = 1:length(cifrado)
    binarios = [binarios sol_mochila(s, cifrado(index))];
end

% Eliminamos los posibles bits de relleno
deletable = mod(length(binarios),8);
if deletable ~= 0
    for index = 1:deletable
        binarios(length(binarios)) = [];
    end
    
end

% Rehacemos el vector en una matriz de 8 columnas
binarios = reshape(binarios, [8,length(binarios)/8]);
binarios = transpose(binarios); %Necesario para que cada fila tenga el caracter ASCII
len = size(binarios);

%Obtenemos el vector de caracteres ASCII en decimal
charset = [];
for index2 = 1:len(1)
    charset = [charset obj_mochila([1 2 4 8 16 32 64 128],fliplr(binarios(index2,:)))];
end

% Traducimos los decimales a caracteres
texto = char(charset);

end
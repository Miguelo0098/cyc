function desci = num_descifra(n, bloque_numero)
%num_descifra - Description
%
% Syntax: desci = num_descifra(n, bloque_numero)
%
% Funcion que transforma un vector numerico en letras 
% (dos digitos por letra)
% 
% Entradas: n: numero que va a determinar el tamaño de los bloques, digitos(n) - 1
%           bloque_numero: vector numerico
%
% Salida: desci: cadena alfabetica con el texto asociado a los bloques de numeros

if any(mod([n bloque_numero],1) ~= 0)
    disp('ERROR: no se puede cifrar con esa clave');
    return;
end

alfabeto = 'abcdefghijklmnnopqrstuvwxyz';
alfabeto(15) = char(241);

% obtenemos el tamaño de los bloques
digitos = 0;
number = n;

while number >= 1
    number = number/10;
    digitos = digitos + 1;
end

tama = digitos - 1;

bloque_string = '';

disp(bloque_numero);

% Añadimos ceros para que tengan la longitud correspondiente
for index = 1:length(bloque_numero)
    string = int2str(bloque_numero(index));
    while length(string) < tama
        string = ['0' string];
    end
    bloque_string = [bloque_string string];
end

len = length(bloque_string);

% Quitamos el posible residuo para agrupar de dos en dos
if mod(len, 2) == 1
    bloque_string = extractBefore(bloque_string, len);
end

% agrupamos de dos en dos
bloque_string = reshape(bloque_string, 2,[]);
bloque_string = transpose(bloque_string);

bloque_char = [];

len = size(bloque_string);


% Eliminamos los posibles 30 
for index = 1:len(1)
    if ~strcmp(bloque_string(index,:), '30')
        bloque_char = [bloque_char str2double(bloque_string(index,:))];
    end
end

desci = '';

% Pasamos los digitos a caracteres
for i = 1:length(bloque_char)
    desci = [desci, alfabeto(bloque_char(i)+1)]; % pasamos los numeros a cadena de caracteres
end

end
function descifraafin = desafin(clave, d, texto)

if any([isinteger(clave) isinteger(d) clave < 0 d < 0])
    disp('Error: la clave o d no son enteros positivos');
    return;
end

if gcd(clave, 27) ~= 1
    return; % si la clave no es válida, no hace nada
end

alfabeto = 'abcdefghijklmnnopqrstuvwxyz';
alfabeto(15) = char(241);

numeros = letranumero(texto);

[G, claveinversa, V] = gcd(clave, 27); % obtenemos la clave inversa

claveinversa = mod(claveinversa,27);    % la pasamos a mod27

descifraafin = '';
numeros = mod(claveinversa * (numeros - d), 27); % desciframos los numeros
len = size(numeros);
for i = 1:len(2)
    descifraafin = [descifraafin, alfabeto(numeros(i)+1)]; % pasamos los numeros a cadena de caracteres
end
function texto = des_mmh(s, cifrado, mu, invw)
%des_mmh - Description
%
% Syntax: texto = des_mmh(s, cifrado, mu, invw)
%
% Funcion que permite al usuario descifrar un 
% mensaje cifrado con su clave publica asociada
%
% Entradas: s: la mochila supercreciente
%           cifrado: el texto numerico recibido cifrado
%           mu, invw: los elementos de la clave privada
%
% Salida: el texto claro

if mochila(s) == 0
    disp('ERROR: la mochila no es supercreciente');
    return;
    
end

% Control de enteros
if any(mod([cifrado mu invw],1) ~= 0)
    disp('ERROR: algun valor no es un entero');
    return;
end

% Pasamos el vector cifrado a un vector descifrable con la mochila simple
cifrado = mod(cifrado * invw, mu);
texto = des_mochila(s, cifrado);

end
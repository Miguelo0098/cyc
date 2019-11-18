function descifro_num = descifro_rsa_num(d, n, cifrado_numero)
%descifro_rsa_num - Description
%
% Syntax: descifro_num = descifro_rsa_num(d, n, cifrado_numero)
%
% Funcion que aplica la funcion de descifrado del metodo rsa 
% a un vector numerico (supuestamente cifrado previamente 
% con la clave publica)
%
% Entradas: d y n: clave privada
%           cifrado_numero: vector numerico, supuestamente cifrado
%
% Salida: descifro_num: vector numerico obtenido tras descifrado

if any(mod([d, n, cifrado_numero],1) ~= 0)
    disp('ERROR: no se puede cifrar con esa clave');
    return;
end

descifro_num = zeros(1, length(cifrado_numero));

for index = 1:length(cifrado_numero)
    descifro_num(index) = potencia(cifrado_numero(index), d, n);
end
    
end
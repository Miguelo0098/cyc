function descifrado = descifro_rsa(d,n,cifrado_numero)
%descifro_rsa - Description
%
% Syntax: descifrado = descifro_rsa(d,n,cifrado_numero)
%
% Funcion de descifrado segun el metodo RSA
%
% Entradas: d y n: clave privada
%
%           cifrado_numero: vector numerico, se supone que cifrado
%
% Salida: descifrado: texto claro

desci = descifro_rsa_num(d,n,cifrado_numero);
descifrado = num_descifra(n, desci);

end
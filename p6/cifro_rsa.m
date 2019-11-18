function cifrado = cifro_rsa(e, n, texto)
%cifro_rsa - Description
%
% Syntax: cifrado = cifro_rsa(e, n, texto)
%
% Funcion que hace lo siguiente: pasar texto 
% a una cadena numerica usando 2 digitos por letra, 
% calcular el tamaño de los bloques a partir de n, 
% aplicar la funcion anterior para obtener los bloques 
% de numeros, y cifrarlo segun RSA usando la clave publica
%
% Entradas: e y n: clave publica de cifrado RSA
%           texto: texto que queremos cifrar
%
% Salida: cifrado: vector formado por los bloques ya cifrados

if any(mod([e,n],1) ~= 0)
    disp('ERROR: no se puede cifrar con esa clave');
    return;
end

cifras = letra2numeros(texto);

digitos = 0;
number = n;

while number >= 1
    number = number/10;
    digitos = digitos + 1;
end

tama = digitos - 1;

bloques = prepa_num_cifrar(tama, cifras);

cifrado = cifro_rsa_num(e,n,bloques);

end
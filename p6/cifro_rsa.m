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

tama = round(n/10) - 1;

if tama >= length(cifras)
    tama = round(length(cifras)/5);
end

bloques = prepa_num_cifrar(tama, cifras);

cifrado = zeros(1, length(bloques));

for index = 1:length(bloques)
    cifrado(index) = potencia(bloques(index), e, n);
end

end
function cifrado = cifro_rsa_num(e, n, blo)
%cifro_rsa_num - Description
%
% Syntax: cifrado = cifro_rsa_num(e, n, blo)
%
% Funcion igual a la anterior, salvo que recibe vector 
% de numeros en vez de texto
%
% Entradas: e y n: clave publica de cifrado RSA
%           blo: vector de numeros
%
% Salida: cifrado: vector formado por los bloques ya cifrados

if any(mod([e n blo],1) ~= 0)
    disp('ERROR: no se puede cifrar con esa clave');
    return;
end

cifrado = zeros(1, length(blo));

% aplicamos la formula para cifrar con potenciacion rapida
for index = 1:length(blo)
    cifrado(index) = potencia(blo(index), e, n);
end
    
end
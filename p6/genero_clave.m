function [cpublica, cprivada] = genero_clave()
%genero_clave - Description
%
% Syntax: [cpublica, cprivada] = genero_clave()
%
% Programa que genera las claves públicas y privadas que 
% se necesitan para el cifrado con RSA

p = input('Introduzca el valor del primo p: ');
q = input('Introduzca el valor del primo q: ');
disp(' ');

if any(mod([p g],1) ~= 0)
    disp('ERROR: No se puede realizar el intercambio, fin del programa');
    return;
end

n = p * q;

disp(['n, que formará parte de las claves es: n = ' int2str(n)]);
disp(' ');

fiden = (p - 1) * (q - 1);
disp(['Estamos buscando e, que formara parte de la clave privada y que debe cumplir gcd(e,fiden) = gcd(e,p∙q) = gcd(e,' int2str(fiden) ') = 1,']);
disp(' ');

e = 65537;

if e < fiden && gcd(e, fiden) == 1
    


end
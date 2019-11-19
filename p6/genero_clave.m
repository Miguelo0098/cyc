function [cpublica, cprivada] = genero_clave()
%genero_clave - Description
%
% Syntax: [cpublica, cprivada] = genero_clave()
%
% Programa que genera las claves públicas y privadas que 
% se necesitan para el cifrado con RSA

cpublica = [0 0];
cprivada = [0 0];

p = input('Introduzca el valor del primo p: ');
q = input('Introduzca el valor del primo q: ');
disp(' ');

if any(mod([p q],1) ~= 0)
    disp('ERROR: No se puede generar claves, fin del programa');
    return;
end

n = p * q;

disp(['n, que formara parte de las claves es: n = ' int2str(n)]);
disp(' ');

fiden = (p - 1) * (q - 1);
disp(['Estamos buscando e, que formara parte de la clave privada y que debe cumplir gcd(e,fiden) = gcd(e,p*q) = gcd(e,' int2str(fiden) ') = 1,']);
disp(' ');

e = 65537;

if any([e >= fiden gcd(e, fiden) ~= 1])
    found = 0;
    while found == 0
        e = randi(fiden - 2) + 1;
        if gcd(e, fiden) == 1
            found = 1;
        end
    end
end

disp(['Hemos seleccionado ' int2str(e)]);
disp(' ');

disp(['Buscamos el inverso de e = ' int2str(e) 'modulo fiden = ' int2str(fiden)]);
disp(' ');

d = inv_modulo(e, fiden);

disp(['Hemos seleccionado ' int2str(d)]);
disp(' ');

cpublica = [n e];
cprivada = [n d];

disp(['La clave privada es (n,d) = (' int2str(n) ',' int2str(d) ')']);
disp(['La clave privada es (n,e) = (' int2str(n) ',' int2str(e) ')']);

end
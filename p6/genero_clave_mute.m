function [cpublica, cprivada] = genero_clave_mute(p,q)
%genero_clave_mute - Description
%
% Syntax: [cpublica, cprivada] = genero_clave()
%
% Programa que genera las claves públicas y privadas que 
% se necesitan para el cifrado con RSA (igual que el primer 
% ejercicio pero sin imprimir informacion por consola)
%
% Entradas: p y q: dos numeros primos para generar las claves

cpublica = [0 0];
cprivada = [0 0];

if any(mod([p q],1) ~= 0)
    disp('ERROR: No se puede generar claves, fin del programa');
    return;
end

n = p * q;

fiden = (p - 1) * (q - 1);

e = 65537;

if e >= fiden || gcd(e, fiden) ~= 1
    while gcd(e, fiden) ~= 1
        e = randi(fiden - 1);
    end
end

d = inv_modulo(e, fiden);

cpublica = [n e];
cprivada = [n d];

end
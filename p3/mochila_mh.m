function [cpubl, cpriv] = mochila_mh(s)
%mochila_mh - Description
%
% Syntax: [cpubl, cpriv] = mochila_mh(s)
%
% Funcion que permita al usuario generar una clave privada 
% y una clave publica adecuada a partir de una mochila supercreciente
%
% Entradas: s: mochila supercreciente
%
% Salidas: cpubl: mochila trampa creada a partir de s y de los valores mu y w
%          cpriv: un vector fila con los elementos mu y el inverso de w modulo mu


cpubl = [];
cpriv = [];

if mochila(s) == 0
    disp('ERROR: la mochila no es supercreciente');
    return;
    
end

highest = s(end)*2;
disp(['Necesitamos un entero MAYOR QUE ' int2str(highest)]);
disp('Escribe un entero que cumpla dicha condicion');
mu = input('');

if any([mu <= highest mod(mu, 1) ~= 0])
    disp('ERROR: el número introducido no sirve')
    return;
end

found = 0;
w = 0;
% buscamos un valor de w apto
while found == 0
    w = randi(highest);
    if factorescomunes(w, s) == 0 && inv_modulo(w,mu) ~= 0 % Si cumple las condiciones, lo hemos encontrado
        found = 1;
    end

end

cpubl = mod(s*w, mu); % Obtenemos la clave publica
cpriv = [mu inv_modulo(w,mu)]; % creamos la clave privada

end
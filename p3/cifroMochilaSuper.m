function cifrado = cifroMochilaSuper(s, texto)
%cifroMochilaSuper - Description
%
% Syntax: cifrado = cifroMochilaSuper(s, texto)
%
% Funcion para cifrar un mensaje con una mochila 
% (tiene que ser supercreciente)
% 
% Entradas: s: mochila supercreciente
%           texto: texto a cifrar
%
% Salida: vector numérico que se corresponda con el mensaje cifrado
    
cifrado = [];
if mochila(s) == 0
    disp('Error, la mochila no es supercreciente');
    return;
end

cifrado = cifr_mochila(s, texto);

end
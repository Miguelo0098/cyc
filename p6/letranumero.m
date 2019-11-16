function v=letranumero(texto)
alfabeto='abcdefghijklmnnopqrstuvwxyz'; % Definimos el alfabeto
ALFABETO='ABCDEFGHIJKLMNNOPQRSTUVWXYZ'; % Definimos el alfabeto en mayúsculas
alfabeto(15) = char(241); % evitamos problemas con la ñ
ALFABETO(15) = char(209); % evitamos problemas con la Ñ
v = []; % Creamos el vector vacio a devolver
len = size(texto); % Obtenemos la longitud del texto
for i = 1:len(2) % para cada caracter de la cadena
    index = find(alfabeto == texto(i)); %buscamos el caracter en el alfabeto
    INDEX = find(ALFABETO == texto(i)); %buscamos el caracter en mayusculas 
    if index ~= 0                       %si existe en minúsculas
        v = [v,index-1];                %insertamos en el vector
    elseif INDEX ~= 0                   %si existe en mayúscula
        v = [v,INDEX-1];                %insertamos en el vector
    end
end

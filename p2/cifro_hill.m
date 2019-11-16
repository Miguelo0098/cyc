% PARA DESCIFRAR SE DEBE LLAMAR A LA FUNCIÓN CON LA MATRIZ INVERSA MODULAR
% A LA EMPLEADA PARA CIFRAR EL TEXTO.

function cifrado = cifro_hill(A,m,texto)
if inv_modulo(A, m) == 0    %Si la matriz no es inversible, no se hace nada
    disp('ERROR: La matriz no es inversible');
    return;
end

cifrado = '';
alfabeto = 'abcdefghijklmnnopqrstuvwxyz'; %Creamos elementos para pasar de numeros a texto
alfabeto(15) = char(241);

numeros = letranumero(texto); %Pasamos el texto a numeros

len = size(numeros);
tam_matrix = size(A); %Obtenemos la longitud de la cadena y el tamaño de la matriz

toadd = mod(len(2), tam_matrix(1)); %Comprobamos con cuantos elementos debemos rellenar
fill = '';
if toadd ~= 0
    for i = 1:(tam_matrix-toadd)
        fill = [fill, 'w'];
    end
    fill = letranumero(fill)
    numeros = [numeros fill];       %Concatenamos la cadena con el relleno
end

len = size(numeros);
numeros = reshape(numeros, [tam_matrix(1),len(2)/tam_matrix(1)]);
tam_num = size(numeros);        %Reestructuramos la matriz de cara a la aplicacion del cifrado

for j = 1:tam_num(2)
    numeros(:,j) = mod(A*numeros(:,j), m); %Aplicamos el cifrado
end

numeros = reshape(numeros, 1,[]); %Volvemos a pasar la matriz a vector
len = size(numeros);

for k = 1:len(2)
    cifrado = [cifrado, alfabeto(numeros(k)+1)]; %pasamos el vector a texto
end
function [frecuencias, freordenada] = cripto_ana_orden(v)
numeros = letranumero(v);

frecuencias = zeros(27,2); 

for i = 1:27
    frecuencias (i,2) = i-1; % asignamos las letras 
end

len = size(numeros);
for i = 1:len(2)
    frecuencias(numeros(i)+1,1) = frecuencias(numeros(i)+1,1)+1; % con esto asignamos el numero de veces que aparece cada letra
end
frecuencias(:,1) = frecuencias(:,1)/len(2); % lo pasamos a porcentajes decimales
freordenada = sortrows(frecuencias, 1); 
freordenada = flipud(freordenada);          % formamos las frecuencias ordenadas
function doble = letra2numeros(texto)
%letra2numeros - Description
%
% Syntax: doble = letra2numeros(texto)
%
% Función que asocia su correspondiente valor 
% de Z27 con dos digitos: a:00, b:01, ..., z:26.
%
% Entradas: texto: el texto llano
%
% Salida: doble: cadena numérica formada por los números 
%                asociados a cada letra del texto.

doble = '';
% Pasamos los caracteres a numeros
values = letranumero(texto);


for index = 1:length(values)
    % Si solo tiene un digito, añadimos un cero delante
    if values(index) < 10
        doble = [doble '0' int2str(values(index))];
    else
        doble = [doble int2str(values(index))];
    end
end

end
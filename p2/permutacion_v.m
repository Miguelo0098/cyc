function permuta = permutacion_v(p)
permuta = 1;
len = length(p); %obtenemos la longitud del vector

if any([p > len p < 0]) % En caso de que algun elemento sea mayor que su longitud 
    permuta = 0;        % o menor que 0, no es permutable
    return;
end

uniqueValues = unique(p);

if len ~= length(uniqueValues) % En caso de que el numero de elementos unicos
    permuta = 0;               % en el vector sea menor que la cantidad de elementos
    return;                    % totales, no es permutable
end
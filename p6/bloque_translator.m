function newbloque = bloque_translator(oldtama,newtama, oldbloque, modo)

% pasamos los bloques a cadena
bloque_string = bloque_to_string(oldtama, oldbloque);

if modo == 1
    % si vamos a descifrar, debemos cortar el posible relleno, pues puede añadirse relleno extra y quedar un bloque lleno de 30s
    len = length(bloque_string);
    cut = mod(len, newtama);
    bloque_string = extractBefore(bloque_string, (len - cut) + 1);
end

newbloque = prepa_num_cifrar(newtama, bloque_string);

end
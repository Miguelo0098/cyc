function cifrado = cifro_permutacion(p,texto)
matrix = matper(p);

%Si el vector no es permutable, no se puede
if matrix == 0
    disp("No se pudo realizar el cifrado de permutación");
    return;
end

%El cifrado de permutacion es un caso particular del hill
cifrado = cifro_hill(matrix, 27, texto);
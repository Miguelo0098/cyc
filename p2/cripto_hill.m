function matrizclave = cripto_hill(claro, cripto, d)

lent = strlength(claro);
lenc = strlength(cripto);

%Si las longitudes de las cadenas no son de tamaño d² como mínimo, no se
%hace nada
if lent < d^2 || lenc < d^2
    return;
end

%recortamos las cadenas para que su longitud sea 0 modulo d
claro = claro(1:lent-mod(lent,d));
cripto = cripto(1:lenc-mod(lenc,d));

lent = strlength(claro);
lenc = strlength(cripto);

%Se evalua qué cadena es la mas corta y se recorta la larga a la longitud
%de la corta
if lent > lenc
    claro = claro(1:lenc);
    lent = lenc;
elseif lent < lenc
    cripto = cripto(1:lent);
    lenc = lent;
end

%Se adapta el vector de cara al ataque por Gauss Jordan
numclaro = reshape(letranumero(claro), [d, lent/d])
numcripto = reshape(letranumero(cripto), [d, lenc/d])
numclaro = transpose(numclaro);
numcripto = transpose(numcripto);

matriznum = [numclaro numcripto];

%Se aplica el algoritmo de Gauss Jordan 
for i=1:d
    inverso = inv_modulo(matriznum(i,i),27);
    %Si no tiene inverso
    if inverso == 0 || matriznum(i,i) == 0
        for j = i:lenc/d
            %Se busca la primera con inverso y se intercambian
            inverso = inv_modulo(matriznum(j,i),27);
            if inverso ~= 0
                matriznum([i j], :) = matriznum([j i], :);
                break;
            end
        end
    end
    %Se establece el primer elemento como multiplicando por el inverso
    matriznum(i,:) = matriznum(i,:)*inverso;
    matriznum = mod(matriznum, 27);
    
    %Se crean ceros en la columna correspondiente
    for k = 1:lenc/d
        if k == i
            continue
        end
        matriznum(k, :) = matriznum(k, :) - matriznum(i,:)*matriznum(k, i);
    end
    matriznum = mod(matriznum, 27);
end

%Se extrae la matriz cuadrada y se transpone
matrizclave = matriznum(1:d,d+1:end);
matrizclave = transpose(matrizclave);

    

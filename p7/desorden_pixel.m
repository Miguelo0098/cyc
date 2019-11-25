function desorden_pixel(foto, A)
%desorden_pixel - Description
%
% Syntax: desorden_pixel(foto, A)
%
% funcion que desordena los pixeles de las matrices 
% asociadas a una imagen, foto, de acuerdo a la 
% transformacion asociada a la matriz A
%
% Entradas: foto: la foto de la que queremos desordenar sus pixeles. Debe ser cuadrada.
%           A: matriz que nos determina la transformacion. Debe ser 2x2 y tener inversa modulo el numero de filas de foto
%
% Salidas: ninguna      

imdata = imread(foto);

imsize = size(imdata);
n = imsize(1);

if imsize(1) ~= imsize(2)
    n = min([imsize(1) imsize(2)]);
    imdata = imresize(imdata,n);
end

Asize = size(A);

if any(Asize ~= 2)
    return;
end

if inv_modulo(A, n) == 0
    return;
end

setappdata(gcf, 'imdata', imdata);

newImData = zeros(size(imdata));

for j = 1:n
    for k = 1:n
        nc = A*[j;k];
        nc = mod(nc, n);

        if nc(1) == 0
            nc(1) = n;
        end

        if nc(2) == 0
            nc(2) = n;
        end

        newImData(nc(1), nc(2),:) = imdata(j,k,:); 
    end
end

setappdata(gcf, 'newImData', uint8(newImData));

end
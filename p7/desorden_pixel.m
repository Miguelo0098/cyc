function desorden_pixel(foto, A)
%desorden_pixel - Description
%
% Syntax: desorden_pixel(foto, A)
%
% funewcorion que desordena los pixeles de las matrices 
% asociadas a una imagen, foto, de acuerdo a la 
% transformacion asociada a la matriz A
%
% Entradas: foto: la foto de la que queremos desordenar sus pixeles. Debe ser cuadrada.
%           A: matriz que nos determina la transformacion. Debe ser 2x2 y tener inversa modulo el numero de filas de foto
%
% Salidas: ninguna      

%obtenemos la matriz de la foto
imdata = imread(foto);

%leemos el tamaño de la imagen y guardamos el tamaño en n
imsize = size(imdata);
n = imsize(1);

%comprobamos que la imagen sea cuadrada y si no la recortamos
if imsize(1) ~= imsize(2)
    n = min([imsize(1) imsize(2)]);
    imdata = imresize(imdata,n);
end

Asize = size(A);
% comprobamos que A es 2x2
if any(Asize ~= 2)
    return;
end

% comprobamos que A tenga inverso
if inv_modulo(A, n) == 0
    return;
end

%Guardamos la info de la imagen inicial
setappdata(gcf, 'imdata', imdata);

newImData = zeros(size(imdata));

% aplicamos el desorden de pixeles
for j = 1:n
    for k = 1:n
        newcor = A*[j;k];
        newcor = mod(newcor, n);

        if newcor(1) == 0
            newcor(1) = n;
        end

        if newcor(2) == 0
            newcor(2) = n;
        end

        newImData(newcor(1), newcor(2),:) = imdata(j,k,:); 
    end
end
% Guardamos la imagen desordenada
setappdata(gcf, 'newImData', uint8(newImData));

end
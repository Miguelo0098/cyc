function arnold(foto, A)
%arnold - Description
%
% Syntax: arnold(foto,A)
%
% Funcion que va a ordenar o a desordenar una foto.
%
% Entradas: foto: fotografía que debe ser cuadrada a la que queremos aplicarle una transformacion de Arnold
%           A: matriz que se va a usar para desordenar en el caso 1 o que se ha usado para desordenar
%
% Salida: En el caso 1, la imagen desordenada; en el caso 2, la matriz ordenada.

option = input('Introduce un 1 si quieres desordenar, o un 2 si quieres ordenar: ');

if option == 1
    desorden_pixel(foto, A);
    
elseif option == 2
    imdata = imread(foto);

    imsize = size(imdata);
    n = min([imsize(1) imsize(2)]);

    Asize = size(A);

    if any(Asize ~= 2)
        disp('Error: A no es 2x2');
        return;
    end

    if inv_modulo(A, n) == 0
        disp('Error: A no tiene inverso')
        return;
    end

    invA = inv_modulo(A, n);

    desorden_pixel(foto, invA);

else
    disp('Opción no valida. Finalizando programa');
end

imdata = getappdata(gcf, 'imdata');
newimdata = getappdata(gcf, 'newImData');

figure(1);
subplot(2,1,1)
imshow(imdata, []);
subplot(2,1,2)
imshow(newimdata, []);

imwrite(newimdata, 'nueva.bmp');    

end
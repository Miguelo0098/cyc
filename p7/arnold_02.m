function potencia = arnold_02(foto, A)
%arnold_02 - Description
%
% Syntax: potencia = (foto, A)
%
% funcion que debe desordenar los pixeles de la imagen foto segun 
% la matriz A, de manera sucesiva.
% Entradas: foto: imagen a desordenar
%           A matriz que determina la transformacion
%
% Salida: potencia: el numero de veces que hemos realizado la transformacion de forma sucesiva

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

option = input('Introduce un 1 si quieres desordenar la imagen hasta volver a la original, o un 2 si quieres desordenarla hasta una determinada potencia: ');

if option == 1
    potencia = pote (A,n);

elseif option == 2
    potencia = -1;
    while ~all([mod(potencia,1) == 0, potencia > 0])
        potencia = input('¿cuantas transformaciones quieres hacer? ');
    end

else
    disp('Opción no valida. Finalizando programa');
    return;
end

mat = A;

for index = 1:potencia
    desorden_pixel(foto, mat);
    mat = mod(mat*A, n);
    imdata = getappdata(gcf, 'imdata');
    newimdata = getappdata(gcf, 'newImData');

    figure(1);
    subplot(2,1,1)
    imshow(imdata, []);
    subplot(2,1,2)
    imshow(newimdata, []);
    pause(0.5);
end

end
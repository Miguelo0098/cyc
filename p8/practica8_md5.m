%  md5
%  Halla el resumen MD5 del mensaje, como una cadena hexadecimal.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% PASO 1.- INTRODUCIMOS VARIABLES Y CONSTANTES NECESARIAS
clc
%PASO 1.1.- ESCRIBIMOS EL MENSAJE




% PASO 1.2.- VAMOS A TRABAJAR MODULO M=2^32
m=2^32;

% PASO 1.3.-  CREAMOS UNA MATRIZ S PARA HACER LA ROTACION,
% LOS NUMEROS SON NEGATIVOS POR SER UNA ROTACION A IZQUIERDA
s = [-7, -12, -17, -22;-5,  -9, -14, -20;-4, -11, -16, -23;-6, -10, -15, -21]

% PASO 1.4.- t ES LA TABLA QUE USAREMOS MAS ADELANTE, para construir la funcion
% Hash  del emnsaje
t = fix(abs(sin(1:64)) .* m)

% PASO 1.5.- INICIALIZAMOS LA HASH
% MD5 utiliza las cuatro palabras siguientes:
% A=01 23 45 67 pero en Little endian:67 45 23 01
% B=89 ab cd ef --> ef cd ab 89 
% C=fe dc ba 98 --> 98 ba dc fe
% D=76 54 32 10 --> 10 32 54 76




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% PASO 2.- PREPARAMOS EL MENSAJE PARA APLICARLE LA HASH

mensaje = abs(mensaje)
bytelen = numel(mensaje) %numero de elementos del vector 

% PASO 2.1.- COMPLETAMOS EL MENSAJE CON UN 1 Y  LOS CEROS NECESARIOS PARA QUE EL 
% NUMERO DE BITS SEA CONGRUENTE CON 448 MODULO 512. COMO TENEMOS BYTES, COMPLETAMOS 
% CON 128 (10000000) Y LOS CEROS NECESARIOS PARA QUE EL NUMERO DE BYTES SEA 
% CONGRUENTE CON 56 MODULO 64




% PASO 2.2.- COMO CADA PALABRA VIENE FORMADA POR 4 BYTES, HACEMOS UNA MATRIZ DE 
% 4 FILAS CON LOS BYTES DEL MENSAJE, ASI CADA COLUMNA SERA UNA PALABRA 




% PASO 2.3.- CONVERTIMOS CADA COLUMNA A ENTEROS DE 32 BITS, little endian.




% PASO 2.4.- COMPLETAMOS CON LA LONGITUD DEL MENSAJE ORIGINAL COMO UN ENTERO 
% DE 64 BITS __>8 bytes__>dos palabras : little endian.
bitlen = 



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% PASO 3.- REALIZAMOS LA FUNCION HASH
% TRABAJAMOS CON CADA BLOQUE DE  512 bit
% TENEMOS ENTEROS DE 32 BITS (UNA PALABRA). CADA BLOQUE TIENE 16 ELEMENTOS
% (PALABRAS)

for k = 1:16:numel(mensaje)
    a = fhash(1); b = fhash(2); c = fhash(3); d = fhash(4);
    for i =1:64
        % Convertimos b, c y d a vectores fila  de bits.
        bv = dec2bin(b, 32) - '0';
        cv = dec2bin(c, 32) - '0';
        dv = dec2bin(d, 32) - '0';
        % obtenemos  f  = mix de b, c, d.
        %      ki = indice  0:15, del mensaje (k + ki).
        %      sr = filas 1:4, de  s(sr, :).
        if i <= 16          % ronda 1
            f = (bv & cv) | (~bv & dv);
            ki = i - 1;
            sr = 1;
        elseif i <= 32      % ronda 2
            f = (bv & dv) | (cv & ~dv);
            ki = mod(5 * i - 4, 16);    %de 5 en 5 empezando en 1
            sr = 2;
        elseif i <= 48      % ronda 3
            f = xor(bv, xor(cv, dv));
            ki = mod(3 * i + 2, 16);    %de 3 en 3 empezando en 5
            sr = 3;
        else                % ronda 4
            f = xor(cv, bv | ~dv);
            ki = mod(7 * i - 7, 16);    %de 7 en 7 empezando en 0
            sr = 4;
        end
        % Convertimos f, DE VECTOR FILA DE BITS A ENTEROS DE 32-bit .
       
       
       
       
       
        % HACEMOS LA ROTACIONES
        sc = mod(i - 1, 4) + 1;
        sum = mod(a + f + mensaje(k + ki) + t(i), m);
        sum = dec2bin(sum, 32);
        sum = circshift(sum, [0, s(sr, sc)]);
        sum = bin2dec(sum);
        % ACTUALIZAMOS  a, b, c, d.
        
        
        
        
        
        
    end
    
    % MODIFICAMOS EL HASH.
    

    
    
    
end

% CONVERTIMOS HASH DE ENTEROS DE 32 BITS  , LITTLE ENDIAN, A BYTES .




% CONVERTIMOS HASH A HEXADECIMAL.





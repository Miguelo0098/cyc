function cifradoafin=afin(clave, d, texto)

if any([isinteger(clave) isinteger(d) clave < 0 d < 0])
    disp('Error: la clave o d no son enteros positivos');
    return;
end

if gcd(clave, 27) ~= 1
    disp('Error: clave no valida')
    return;     % Si la clave es invalida, no hace nada
end

alfabeto = 'abcdefghijklmnnopqrstuvwxyz';
alfabeto(15) = char(241);

numeros = letranumero(texto);
cifradoafin = '';
numeros = mod(numeros*clave + d, 27);   %se cifran los numeros
len = size(numeros);
for i = 1:len(2)
    cifradoafin = [cifradoafin, alfabeto(numeros(i)+1)];    % se pasa a texto
end
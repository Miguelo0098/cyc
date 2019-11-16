function mat_per = matper(p)
if permutacion_v(p) == 0
    mat_per = 0;            %Si el vector no es permutable, no hay matriz
    return;
end

len = length(p);
mat_per = zeros(len, len);  %Se crea la matriz
for i = 1:len
    mat_per(i,p(i)) = 1;    %Se asigna los 1 correspondientes
end


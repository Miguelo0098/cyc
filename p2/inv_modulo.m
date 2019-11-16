function inver = inv_modulo(A, m)
inver = 0;
if floor(A) ~= A
    disp('esa matriz no tiene todos los elementos enteros');
    return;
end
disp('la matriz tiene todos sus elementos enteros');
if det(A)== 0 || gcd(mod(round(det(A)),m),m) ~= 1
    disp('la matriz no es inversible');
    return;
end
    determinant = round(mod(det(A),m));
    [d r s] = gcd(determinant,m);
    inver =  mod(round(inv(A)*det(A)*r),m);
end
function inver = inv_modulo(A, m)
inver = 0;
if floor(A) ~= A
    disp('esa matriz no tiene todos los elementos enteros');
    return;
end

if det(A)== 0 || gcd(mod(round(det(A)),m),m) ~= 1

    return;
end
    determinant = round(mod(det(A),m));
    [d r s] = gcd(determinant,m);
    inver =  mod(round(inv(A)*det(A)*r),m);
end
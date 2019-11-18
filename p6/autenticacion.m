function success = autenticacion()
%auntetication - Description
%
% Syntax: success = autenticacion()
%
% Funcion que demuestra el funcionamiento de 
% autenticacion de firma mediante RSA

pa = input('A: Introduzca el valor del primo p: ');
qa = input('A: Introduzca el valor del primo q: ');
disp(' ');

[cpubla, cpriva] = genero_clave_mute(pa,qa);

pb = input('B: Introduzca el valor del primo p: ');
qb = input('B: Introduzca el valor del primo q: ');
disp(' ');

[cpublb, cprivb] = genero_clave_mute(pb,qb);

disp(['Clave pública de A: (na,ea) = (' int2str(cpubla(1)) ',' int2str(cpubla(2)) ')']);
disp(['Clave privada de A: (na,da) = (' int2str(cpriva(1)) ',' int2str(cpriva(2)) ')']);

disp(['Clave pública de B: (na,eb) = (' int2str(cpublb(1)) ',' int2str(cpublb(2)) ')']);
disp(['Clave privada de B: (na,db) = (' int2str(cprivb(1)) ',' int2str(cprivb(2)) ')']);

end
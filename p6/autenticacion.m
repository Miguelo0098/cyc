function success = autenticacion()
%auntetication - Description
%
% Syntax: success = autenticacion()
%
% Funcion que demuestra el funcionamiento de 
% autenticacion de firma mediante RSA

% Generamos claves A
pa = input('A: Introduzca el valor del primo p: ');
qa = input('A: Introduzca el valor del primo q: ');
disp(' ');

[cpubla, cpriva] = genero_clave_mute(pa,qa);

% Generamos claves B
pb = input('B: Introduzca el valor del primo p: ');
qb = input('B: Introduzca el valor del primo q: ');
disp(' ');

[cpublb, cprivb] = genero_clave_mute(pb,qb);

disp(['Clave publica de A: (na,ea) = (' int2str(cpubla(1)) ',' int2str(cpubla(2)) ')']);
disp(['Clave privada de A: (na,da) = (' int2str(cpriva(1)) ',' int2str(cpriva(2)) ')']);

disp(['Clave publica de B: (nb,eb) = (' int2str(cpublb(1)) ',' int2str(cpublb(2)) ')']);
disp(['Clave privada de B: (nb,db) = (' int2str(cprivb(1)) ',' int2str(cprivb(2)) ')']);

na = cpubla(1);
% na = 27371551;
ea = cpubla(2);
% ea = 13;
da = cpriva(2);
% da = 18941533;

nb = cpublb(1);
% nb = 492859;
eb = cpublb(2);
% eb = 179;
db = cprivb(2);
% db = 422459;

disp(' ');

disp('A quiere enviar, junto con su firma, lo siquiente:')

mensaje = 'el programa funciona byalma';
mensajefirma = 'byalma';

disp(['mensaje = ' mensaje]);
disp(' ');

cif_mens = cifro_rsa(eb, nb, mensaje);

cif_firma_da = cifro_rsa(da, na, mensajefirma);

% Obtenemos tamaños de na y nb - 1
digitos = 0;
number = na;

while number >= 1
    number = number/10;
    digitos = digitos + 1;
end

tamaa = digitos;

digitos = 0;
number = nb;

while number >= 1
    number = number/10;
    digitos = digitos + 1;
end

tamab = digitos - 1;

% funcion auxiliar para transformar los bloques
cif_firma_da_trans = bloque_translator(tamaa,tamab,cif_firma_da, 0);

cif_firma_da_eb = cifro_rsa_num(eb,nb,cif_firma_da_trans);

disp('Los dos criptogramas que envia A a B son:');
disp(['cif_mens = ' int2str(cif_mens)]);
disp(['cif_firma_da_eb = ' int2str(cif_firma_da_eb)]);

disp(' ');

disp('B comienza el descifrado');
disp(' ');

mensaje = descifro_rsa(db,nb, cif_mens);

cif_firma_da = descifro_rsa_num(db,nb, cif_firma_da_eb);

% Funcion auxiliar para destransformar los bloques
cif_firma_da_trans = bloque_translator(tamab,tamaa,cif_firma_da, 1);

firma = descifro_rsa(ea,na,cif_firma_da_trans);

disp('El mensaje con la firma que recibe es: ');
disp(['mensaje = ' mensaje]);
disp(' ');
disp('B obtiene la firma y comprueba su autentificacion');
disp(['firma = ' firma]);


end
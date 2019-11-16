function success = ejercicio5()
%ejercicio5 - Description
%
% Syntax: success = ejercicio5()
%
% Programa que muestra la vulnerabilidad del 
% intercambio de claves considerando un intermediario.

disp('SIMULADOR DE INTERCAMBIO DE CLAVES DIFFIE Y HELLMAN (Intruso a la vista!)');
p = input('Inserta un número primo (p): ');
g = input('Introduce un generador de p (g): ');
disp(' ');

if any([mod([p g],1) ~= 0 genera(g, p) == 0])
    disp('ERROR: No se puede realizar el intercambio, fin del programa');
    success = 0;
    return;
end

disp('A genera un número aleatorio');
aa = 1 + randi(p-3);
% aa = 1599;
disp(['aa = ' int2str(aa)]);
disp(' ');

disp(['A envía a B ' int2str(g) '^' int2str(aa) ' mod' int2str(p)]);
pote_a = potencia(g, aa, p);
disp(['pote_a = ' int2str(pote_a)]);
disp(' ');

disp('INTRUSO C captura pote_a y lo guarda')
disp('INTRUSO C genera un número aleatorio');
cc = 1 + randi(p-3);
% cc = 284;
disp(['cc = ' int2str(cc)]);
disp(' ');

disp(['INTRUSO C envía a B ' int2str(g) '^' int2str(cc) ' mod' int2str(p)]);
pote_c = potencia(g, cc, p);
disp(['pote_c = ' int2str(pote_c)]);
disp('(B piensa que pote_c es pote_a)');
disp(' ');

disp('B genera un número aleatorio');
bb = 1 + randi(p-3);
% bb = 843;
disp(['bb = ' int2str(bb)]);
disp(' ');

disp(['B envía a A ' int2str(g) '^' int2str(bb) ' mod' int2str(p)]);
pote_b = potencia(g, bb, p);
disp(['pote_b = ' int2str(pote_b)]);
disp(' ');

disp('INTRUSO C captura pote_b y lo guarda')

disp(['INTRUSO C envía a A ' int2str(g) '^' int2str(cc) ' mod' int2str(p)]);
disp(['pote_c = ' int2str(pote_c)]);
disp('(A piensa que pote_c es pote_b)');
disp(' ');

disp('A continuación, A y B calculan sus claves');
clave_a = potencia(pote_c,aa,p);
disp(['clave_a = ' int2str(clave_a)]);
clave_b = potencia(pote_c,bb,p);
disp(['clave_b = ' int2str(clave_b)]);
disp('(Son claves distintas, pero ellos no lo saben)');
disp(' ');

disp('INTRUSO C calcula sus claves para comunicarse con A y B');
clave_ca = potencia(pote_a,cc,p);
disp(['clave_ca = ' int2str(clave_ca)]);
clave_cb = potencia(pote_b,cc,p);
disp(['clave_cb = ' int2str(clave_cb)]);
disp(' ');

success = 1;

end
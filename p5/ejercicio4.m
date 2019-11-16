function success = ejercicio4()
%ejercicio4 - Description
%
% Syntax: success = ejercicio4(g,p)
%
% Función que simula un intercambio 
% de claves de Diffie y Hellman
%
% Entradas: ninguna
% 
% Salida: success = true si no hay problema
%         success = false si g o p no sirven para realizar el intercambio

disp('SIMULADOR DE INTERCAMBIO DE CLAVES DIFFIE Y HELLMAN');
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
% aa = 557;
disp(['aa = ' int2str(aa)]);
disp(' ');

disp(['A envía a B ' int2str(g) '^' int2str(aa) ' mod' int2str(p)]);
pote_a = potencia(g, aa, p);
disp(['pote_a = ' int2str(pote_a)]);
disp(' ');

disp('B genera un número aleatorio');
bb = 1 + randi(p-3);
% bb = 1093;
disp(['bb = ' int2str(bb)]);
disp(' ');

disp(['B envía a A ' int2str(g) '^' int2str(bb) ' mod' int2str(p)]);
pote_b = potencia(g, bb, p);
disp(['pote_b = ' int2str(pote_b)]);
disp(' ');

disp('A continuación, A y B calculan sus claves');
clave_a = potencia(pote_b,aa,p);
disp(['clave_a = ' int2str(clave_a)]);
clave_b = potencia(pote_a,bb,p);
disp(['clave_b = ' int2str(clave_b)]);

success = 1;

end
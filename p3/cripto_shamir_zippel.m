function s = cripto_shamir_zippel(cpubl, mu)
%cripto_shamir_zippel - Description
%
% Syntax: s = cripto_shamir_zippel(cpubl, mu)
%
% Funcion que permite criptoanalizar una mochila trampa conocido
% el modulo de trabajo
% 
% Entradas: cpubl: mochila trampa
%           mu: modulo de trabajo
%
% Salida: la mochila supercreciente asociada

if any(mod([cpubl mu],1) ~= 0)
    disp('ERROR: algun elemento de la entrada no es entero positivo');
    return;
end

% Empieza a contar el tiempo

indice = 0;
% Recorremos la clave publica en busqueda de valores aptos para obtener q
for ind = 1:length(cpubl)
    invb = inv_modulo(cpubl(ind+1), mu);

    q = mod(cpubl(ind)* invb, mu);

    multiplos = [];
    hasinverse = [];
    nmult = 2^(length(cpubl)+1);

    % Se obtienen los multiplos de q y se comprueban que tengan inverso modulo mu
    for index = 1:nmult
        multiplos = [multiplos q*index];
        hasinverse = [hasinverse inv_modulo(q*index, mu)];
    end

    multiplos = mod(multiplos, mu);
    multiplos = sort(multiplos);

    % si alguno de ellos tiene inverso en mu, tenemos candidatos factibles
    if any(hasinverse ~= 0)
        indice = ind;
        break;
    end
end
% NOTA: si se multiplican b1 y b2, en caso de ser alguno de ellos par, no tendrá inverso en un mu par, por lo que ninguno puede ser candidato de cara a obtener su inverso

super = [];
repeat = 1;
nmultiplos = round(length(multiplos)/8);

while nmultiplos <= length(multiplos)
    disp(['Vamos a buscar en el rango [1, ' int2str(nmultiplos) ']'] );
    tic;
    for j = 1:nmultiplos
        % Obtenemos w
        w = mod(cpubl(indice) * inv_modulo(multiplos(j), mu), mu);
        % Sacamos su inverso
        invw = inv_modulo(w,mu);
        if invw == 0 % Si su inverso es 0, se pasa al siguiente
            continue;
        end
        % Se obtiene la nueva mochila
        super = mod(invw * cpubl, mu);
        % Si la mochila es supercreciente, hemos encontrado la clave privada
        if mochila(super) == 1
            repeat = 0;
            break;
        end
    end
    if repeat  == 0
        disp('Encontrada la mochila simple');
        toc;
        s = super;
        break;
    else
        nmultiplos = nmultiplos * 2;
        toc;
        repeat = input('No hemos encontrado la mochila simple, si quieres ampliar el rango, responde 1: ');
    end    
end

% En caso de que pase todo y s siga vacia, indica no haber encontrado la clave
if length(s) == 0
    disp('No hemos encontrado la mochila simple y no se puede ampliar el rango');
end

end
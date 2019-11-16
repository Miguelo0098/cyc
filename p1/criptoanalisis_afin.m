function criptoanalisis_afin(v,m)
comp = barras(v)    % Obtenemos las frecuencias
len = size(comp);   % Cogemos el tamaño de las frecuencias
found = 1;          % Para controlar el encuentro de la clave
for i = 1:len(1)    % Estos 4 bucles for sirven para recorrer todas las combinaciones posibles de la más posible a la menos posible
    for j = 1:len(1)
        for k = 1:len(1)
            for l = 1:len(1)
                if i~=j
                    realpair = [comp(i,2); comp(j,2)]; % Asignamos los supuestos valores reales
                    if k~=l
                        criptpair = [comp(k,4); comp(l,4)]; %asignamos los valores encriptados
                        dpair = [1;1]; % Siempre se suma d y su valor equivalente en el sistema es 1

                        inversa = inv_modulo([realpair dpair], m);   % Calculamos la inversa de la matriz para calcular k y d                

                        result = inversa*criptpair;             % Calculamos el resultado          

                        result = mod(result, m)                 % Le hacemos módulo m
                        
                        if gcd(result(1), m) ~= 1 % Si la k es múltiplo de 3, la saltamos
                            continue;
                        end

                        desafin(result(1), result(2), v) % Se desencripta con la clave obtenida
                        prompt = 'si quieres probar otra clave introduce 1, en caso contrario introduce 0: ';
                        found = input(prompt); % Se introduce para confirmar si se ha encontrado la clave
                        if found == 0
                            break;
                        end               
                    end
                end
            end
        if found == 0
            break;
        end    
        end
    if found == 0
        break;
    end     
    end
if found == 0
    break;
end    
end

        

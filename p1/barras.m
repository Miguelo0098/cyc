function comparo = barras(v)
table = ["caste" "Nª/letra" "cifrado" "Nª/letra"]
[frecu, freorden] = cripto_ana_orden(v); 
comparo = [0.1368 4; 0.1253 0; 0.0868 15; 0.0798 19; 0.0687 18; 0.0671 13;
                0.0625 8; 0.0586 3; 0.0497 11; 0.0468 2; 0.0463 20;
                 0.0393 21; 0.0315 12; 0.0251 16; 0.0142 1; 0.0101 6;
                0.009 22; 0.009 25; 0.0088 17; 0.007 7; 0.0069 5; 0.0052 26;
                0.0044 9; 0.0031 14; 0.0022 24; 0.0002 10; 0.0001 23];
    % Las de arriba son las frecuencias más comunes en castellano

comparorden = sortrows(comparo, 2); % ordenamos las frecuencias por orden alfabetico

figure(1);
subplot(2,1,1)
bar(comparorden(:,1));
legend('Frecuencias en castellano');        % Mostramos las gráficas de barras

subplot(2,1,2)
bar(frecu(:,1));
legend('Frecuencias del criptograma');

           
comparo = [comparo freorden];



         
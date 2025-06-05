clc;
% Opción 1: resolver por numerador y denominador
num = [1 3];
den = [1 5 20 16 0];

% Polos y ceros
zs = roots(num);
ps = roots(den);

sigma0 = -2/3;

% Líneas de las asíntotas
x = sigma0:0.1:6;
y1 = sqrt(3) * (x - sigma0);
y2 = -y1;
xa = -6:0.1:sigma0;
ya = zeros(1, length(xa));

% Graficar
figure
v = [-6 6 -6 6];  
axis(v); 
axis('square')
hold on; grid on;

% Graficar las asíntotas
h1 = plot(x, y1, 'k-.');          % Asíntota +60°
h2 = plot(x, y2, 'k-.');          % Asíntota -60°
h3 = plot(xa, ya, 'k-.');         % Parte izquierda horizontal

% Graficar ceros, polos, centroide y cruces
h4 = plot(real(zs), imag(zs), 'bo', 'LineWidth', 2);  % Ceros
h5 = plot(real(ps), imag(ps), 'rx', 'LineWidth', 2);  % Polos
h6 = plot(sigma0, 0, 'ko', 'MarkerSize', 6, 'LineWidth', 1.5); % Centroide
h7 = plot(0, 1.1547, 'bs', 'MarkerSize', 6, 'LineWidth', 1);   % Cruce +j
h8 = plot(0, -1.1547, 'bs', 'MarkerSize', 6, 'LineWidth', 1);  % Cruce -j
h9 = plot(0, -3.1409, 'gs', 'MarkerSize', 6, 'LineWidth', 1);  % Cruce imag
h10 = plot(0, 3.1409, 'gs', 'MarkerSize', 6, 'LineWidth', 1);  % Cruce imag
h11 = plot(-4.2376,0, 'ko', 'MarkerSize', 6, 'LineWidth', 1);  % corte donde se desprende del eje real
h12 = plot(-0.524,0, 'ko', 'MarkerSize', 6, 'LineWidth', 1);  %corte donde se desprende del eje real
% Etiquetas
xlabel('Parte real')
ylabel('Parte imaginaria')
title('Ubicación de polos y ceros en el plano complejo')

% Leyenda
legend([h4, h5, h6, h1, h7,h8,h9,h10], ...
       {'Ceros', 'Polos', 'Centroide', 'Asíntotas ±60°', 'Cruces eje jω','Puntos de corte jw', }, ...
       'Location', 'bestoutside');

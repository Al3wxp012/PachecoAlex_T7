clc;
% Opción 1: resolver por numerador y denominador
num = [1 3];
den = [1 5 20 16 0];

% Polos y ceros
zs = roots(num);
ps = roots(den);

sigma0 = -2/3;

% Definir sistema
sys = tf(num, den);  
gs = feedback(sys,1);

% Dibujar rlocus
figure;
rlocus(gs);
hold on;
grid on;

% Superponer tus puntos personalizados
% Asíntotas (aproximadas solo hacia la derecha del centroide)
x = sigma0:0.1:6;
y1 = sqrt(3) * (x - sigma0);
y2 = -y1;
plot(x, y1, 'k-.');  % +60°
plot(x, y2, 'k-.');  % -60°
plot(sigma0, 0, 'ko', 'MarkerSize', 6, 'LineWidth', 1.5);  % Centroide

% Cruces con eje imaginario
plot(0, 1.1547, 'bs', 'MarkerSize', 6, 'LineWidth', 1);  
plot(0, -1.1547, 'bs', 'MarkerSize', 6, 'LineWidth', 1); 
plot(0, 3.1409, 'gs', 'MarkerSize', 6, 'LineWidth', 1);  
plot(0, -3.1409, 'gs', 'MarkerSize', 6, 'LineWidth', 1);

% Puntos donde se separa del eje real
plot(-4.2376, 0, 'ko', 'MarkerSize', 6, 'LineWidth', 1);  
plot(-0.524, 0, 'ko', 'MarkerSize', 6, 'LineWidth', 1);  

% Título y ejes
title('Lugar Geométrico de las Raíces con puntos clave');
xlabel('Parte real');
ylabel('Parte imaginaria');

% Leyenda
legend('LGR (rlocus)', 'Asíntota +60°', 'Asíntota -60°', 'Centroide', ...
       'Cruce ±j1.15', 'Cruce ±j3.14', 'Desprendimiento eje real', ...
       'Location', 'bestoutside');

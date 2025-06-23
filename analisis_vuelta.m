% ------------------------------
% Script: análisis_vuelta.m
% Autor: Stefano 
% Objetivo: Analizar velocidad y aceleración de un stint de F1
% -----------------------------------

% Cargar archivo CSV
file_path = 'vuelta1.csv';  % O usá la ruta completa si es necesario
fid = fopen(file_path);
if fid == -1

end


% Leer datos: 2 columnas numéricas con cabecera
raw = textscan(fid, '%f %f', 'Delimiter', ',', 'HeaderLines', 1);
fclose(fid);

% Extraer columnas
time = raw{1};   % Tiempo en segundos
speed = raw{2};  % Velocidad en km/h

% Calcular aceleración (diferencia finita)
accel = diff(speed) ./ diff(time);
disp('Primeros 5 valores de time:');
disp(time(1:min(5, end)));

disp('Primeros 5 valores de speed:');
disp(speed(1:min(5, end)));

% Graficar velocidad
figure(1)
plot(time, speed, 'b')
xlabel('Time (s)')
ylabel('Speed (km/h)')
title('Speed vs Time')
grid on

% Graficar aceleración
figure(2)
plot(time(2:end), accel, 'r')
xlabel('Time (s)')
ylabel('Acceleration (km/h²)')
title('Acceleration vs Time')
grid on
print(1, 'Speed_vs_Time.png', '-dpng');
print(2, 'Acceleration_vs_Time.png', '-dpng');



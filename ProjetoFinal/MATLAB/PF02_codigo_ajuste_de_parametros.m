clc; clear;

% Carregamento dos dados de medição
angulo = load('angulo.mat').Angulo;
tempo = load('tempo.mat').Tempo;

% Ajustando os dados de posição angular
angulo = [angulo(1:657); angulo(658:929) + 360; angulo(930:1114) + 2*360];
tempo = tempo(1:1114);

% Função de transferência da planta (CubeSat)
s = tf('s');
%J = 1;    % Momento de inércia inicial
J = 1000/14585;   % Momento de inércia CubeSat
G = 1/( J * (s^2) );

tempo_auxiliar = 0:10^(-3):tempo(end);
modelo = step(G, tempo_auxiliar);

% Plotando gráficos
figure(1);
plot(tempo, angulo, 'LineWidth', 1.5, 'Color', 'Blue'); 
hold on; grid on;
plot(tempo_auxiliar, modelo, 'LineWidth', 1.5, 'Color', '#C00000');
title('Saída Experimental x Modelo')
xlabel('Tempo [s]');
ylabel('Ângulo [°]');
legend('Experimental', 'Modelo');
xlim([0 tempo(end)]);
hold off;

clear; clc;

% Apenas para o plot dos dados
angulo = load('angulo.mat').Angulo;
tempo = load('tempo.mat').Tempo;
figure(1);
plot(tempo, angulo, 'LineWidth', 1.5, 'Color', '#C00000');
grid on;
title('Dados Experimentais')
xlabel('Tempo [s]');
ylabel('Ângulo [°]');

% Ajuste do ângulo
figure(2);
tempo = tempo(1:1114);
angulo = [angulo(1:657); angulo(658:929) + 360; angulo(930:1114) + 2*360];
plot(tempo, angulo, 'LineWidth', 1.5, 'Color', '#C00000');
grid on;
title('Dados Experimentais com Ajuste de Posição Ângular (3 Primeiras Voltas)')
xlabel('Tempo [s]');
ylabel('Ângulo [°]');
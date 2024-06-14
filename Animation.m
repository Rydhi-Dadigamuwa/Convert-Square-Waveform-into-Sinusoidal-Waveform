% Parameters
T = 2*pi;                   % Period of the square wave
t = linspace(0, T, 1000);   % Time vector

% Desired Square wave parameters
A = 1;                              % Amplitude
offset = 0.5;                       % To adjust the range from [0,1]

%Fourier series parameters
n_max = 10;                         % Number of harmonics
square_wave = zeros(size(t));       % Initialize square wave

% Create figure
figure;
hold on;

% Plot the square wave
target_square_wave = A * (square(t / T * 2 * pi) + 1) / 2;  
plot(t, target_square_wave, 'k', 'LineWidth', 2);
title('Square Wave Reconstruction with Fourier Series Harmonics');
xlabel('Time');
ylabel('Amplitude');
grid on;
ylim([-0.5, 1.5]);


% Pause at the beginning for 2 seconds
pause(2);


% Animate the sum of sinusoidal waves
for n = 1:2:n_max
    
    % nth harmonic
    harmonic = (4/pi) * (1/n) * sin(n * t);
    square_wave = square_wave + harmonic;
    
    % Adjusting to range [0, 1]
    adjusted_square_wave = (square_wave + 1) / 2;
    
    % Plot current sum of harmonics
    plot(t, adjusted_square_wave, 'LineWidth', 1.5);
    legend(['Sum of first ' num2str((n+1)/2) ' harmonics']);
    
    % Pause for 1 second time to create animation effect
    pause(1);
end

hold off;

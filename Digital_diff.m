%% Digital differentiator
clear all;
close all;

%% Inputs
M = input('Enter the length of filter : ');
window_name = input('Enter the window name : ');
w_s = pi/100;                                                               % Sampling ferquency for 'w'
w = [-pi:w_s:pi];                                                           % Range of omega
w_min = min(w);

%% Filter design using window method
H1_d = i*w;
alpha = 4;
H2_d = i*w.*exp(-i*alpha*w);
h1_d = ifft(H1_d);
h2_d = ifft(H2_d);
if mod(length(h1_d),2) == 0
    temp_1 = h1_d(1:length(h1_d)/2);
    temp_2 = h1_d(1+(length(h1_d)/2):length(h1_d));
    h1_d(1:length(h1_d)/2) = temp_2;
    h1_d(1+(length(h1_d)/2):length(h1_d)) = temp_1;
    temp_3 = h2_d(1:length(h2_d)/2);
    temp_4 = h2_d(1+(length(h2_d)/2):length(h2_d));
    h2_d(1:length(h2_d)/2) = temp_4;
    h2_d(1+(length(h2_d)/2):length(h2_d)) = temp_3;
else
    temp_1 = h1_d(1:(length(h1_d)+1)/2);
    temp_2 = h1_d((1+length(h1_d))/2:length(h1_d));
    h1_d(1:(length(h1_d)+1)/2) = temp_2;
    h1_d((1+length(h1_d))/2:length(h1_d)) = temp_1;
    temp_3 = h2_d(1:(length(h2_d)+1)/2);
    temp_4 = h2_d((1+length(h2_d))/2:length(h2_d));
    h2_d(1:(length(h2_d)+1)/2) = temp_3;
    h2_d((1+length(h2_d))/2:length(h2_d)) = temp_3;
end
w1_n = windows_func(M, window_name, length(h1_d), w_min);
w2_n = windows_func(M, window_name, length(h2_d), w_min);
h1_n = h1_d.*w1_n;
h2_n = h2_d.*w2_n;
H1 = fft(h1_n);
H2 = fft(h2_n);

%% Plots
% Magnitude plot
figure(1);
subplot(2,2,1);
plot(w, abs(H1_d));
title('Ideal FIR digital differentiator');
xlabel('\omega');
ylabel('|H(\omega)|');

subplot(2,2,2);
plot(w, abs(H1));
title('Practical FIR digital differentiator');
xlabel('\omega');
ylabel('|H(\omega)|');

subplot(2,2,3);
plot(w, abs(H2_d));
title('Shifted ideal FIR digital differentiator');
xlabel('\omega');
ylabel('|H(\omega)|');

subplot(2,2,4);
plot(w, abs(H2));
title('Practical FIR digital differentiator');
xlabel('\omega');
ylabel('|H(\omega)|');

% Phase plot
figure(2);
subplot(2,2,1);
plot(w, angle(H1_d));
title('Ideal FIR digital differentiator');
xlabel('\omega');
ylabel('\phi(\omega)');

subplot(2,2,2);
plot(w, angle(H1));
title('Practical FIR digital differentiator');
xlabel('\omega');
ylabel('|H(\omega)|');

subplot(2,2,3);
plot(w, angle(H2_d));
title('Shifted ideal FIR digital differentiator');
xlabel('\omega');
ylabel('\phi(\omega)');

subplot(2,2,4);
plot(w, angle(H2));
title('Practical FIR digital differentiator');
xlabel('\omega');
ylabel('\phi(\omega)');
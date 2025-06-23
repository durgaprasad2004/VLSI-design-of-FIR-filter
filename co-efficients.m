clc;
clear;

N = 16;                   % Number of taps (filter order + 1)
Fc = 0.2;                 % Normalized cutoff frequency (0 < Fc < 0.5)
window = hamming(N)';     % Window function (transpose for row vector)

% Generate ideal low-pass filter using sinc function
n = 0:N-1;
hd = sinc(2 * Fc * (n - (N-1)/2));

% Apply window to the ideal impulse response
h = hd .* window;

% Normalize coefficients to sum to 1 (optional for unity gain)
h = h / sum(h);

% Convert to fixed-point Q1.15 format
q15 = round(h * 2^15);
q15 = max(min(q15, 32767), -32768);  % Clamp to int16 range

% Display coefficients
disp('FIR Coefficients (Q1.15 format):');
disp(q15);

% Save to a text file (optional)
fileID = fopen('fir_coefficients.txt','w');
fprintf(fileID, '%d\n', q15);
fclose(fileID);

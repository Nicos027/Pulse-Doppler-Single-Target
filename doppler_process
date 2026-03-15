function [RD, fd_axis, vel_axis] = doppler_process(rc, prf, fc)
% Doppler processing across pulses

% rc = range compressed matrix (Nr x Np)
% prf = pulse repetiton frequency
% fc = carrier frequency
% RD = range Doppler map
% fd_axis = Doppler frequency axis
% vel_axis = radial velocity axis

c = 3e8;
lambda = c / fc;

[Nr, Np] = size(rc);

% Hamming window across pulses
w = hamming(Np).';
rc_window = rc .* w;

% Doppler FFT across pulses
RD = fftshift(fft(rc_window, [], 2), 2);

% Doppler frequency axis 
fd_axis = (-Np/2 : Np/2-1) * (prf / Np);

% convert Doppler frequency to radial velocity
vel_axis = fd_axis * lambda / 2; 

end 

clear,clc,close all

load('asen3300mod.mat')

% signal = signalnoisy;
figure
plot(signal(23000:23250))
ylim([-5 5])

NFFT= 2^(nextpow2(length(signal))); 
% Take fft, padding with zeros so that length(FFTX) is equal to NFFT 
FFTX = fft(signal,NFFT); 
% Calculate the numberof unique points 
NumUniquePts = ceil((NFFT+1)/2); 
% FFT is symmetric, throw away second half 
FFTX = FFTX(1:NumUniquePts); 
% Take the magnitude of fft of x 
MX = abs(FFTX); 
% Scale the fft so that it is not a function of the length of x 
MX = MX/length(signal); 
% Take the square of the magnitude of fft of x. 
MX = MX.^2; 
% Multiply by 2 because you threw out second half of FFTX above 
MX = MX*2; 
% DC Component should be unique. 
MX(1) = MX(1)/2; 
% Nyquist component should also be unique.
if ~rem(NFFT,2) 
   % Here NFFT is even; therefore,Nyquist point is included. 
   MX(end) = MX(end)/2; 
end 
% This is an evenly spaced frequency vector with NumUniquePts points. 
f = (0:NumUniquePts-1)*fs/NFFT; 
% Generate the plot, title and labels.

figure
plot(f,MX);grid;
title('Linear Power Spectrum of Product'); xlabel('Frequency (Hz)'); 
ylabel('Power');

opt = (8000/fs)*2*pi/(max(max(signal)))
out = demod(signal,fc,fs,'fm',opt);

figure
plot(out(29000:29250))

NFFT= 2^(nextpow2(length(out)));
% Take fft, padding with zeros so that length(FFTX) is equal to NFFT 
FFTX = fft(out,NFFT);
% Calculate the numberof unique points 
NumUniquePts = ceil((NFFT+1)/2);
% FFT is symmetric, throw away second half 
FFTX = FFTX(1:NumUniquePts);
% Take the magnitude of fft of x 
MX = abs(FFTX);
% Scale the fft so that it is not a function of the length of x 
MX = MX/length(out);
% Take the square of the magnitude of fft of x. 
MX = MX.^2;
% Multiply by 2 because you threw out second half of FFTX above 
MX = MX*2;
% DC Component should be unique. 
MX(1) = MX(1)/2;
% Nyquist component should also be unique.
if ~rem(NFFT,2)
   % Here NFFT is even; therefore,Nyquist point is included. 
   MX(end) = MX(end)/2; 
end 
% This is an evenly spaced frequency vector with NumUniquePts points. 
f = (0:NumUniquePts-1)*fs/NFFT; 
% Generate the plot, title and labels.

figure
plot(f,MX);grid;
title('Linear Power Spectrum of Product'); xlabel('Frequency (Hz)'); 
ylabel('Power');

sound(out,fs)
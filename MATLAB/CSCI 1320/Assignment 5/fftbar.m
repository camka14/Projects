function fftbar(soundVec,Fs)
% This function prints out a bar graph of the frequencies

Y = fft(soundVec(1:1000));
Y = abs(Y);
new = Y(1:length(Y)/2);
f = Fs*(0:(length(Y)-1)/2)/length(Y);
bar(f,new)
xlim([0 5000])
ylim([0 150])
xlabel('Frequency Spectrum (Hz)')
ylabel('Amplitude')
title('FFT of an Audio Signal')
end
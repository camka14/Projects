clear,clc,close all

load('signal1.mat')

xdft = fft(x);
xdft = xdft(1:floor(length(x)/2+1));
xdft = xdft/length(x);
xdft(2:end-1) = 2*xdft(2:end-1);
freq = 0:Fs/length(x):Fs/2;

figure
plot(t,x)
title('Time Domain Signal 1')
xlabel('Time (s)')
ylabel('Signal')
figure
plot(freq,abs(xdft))
title('Frequency Domain Signal 1')
xlabel('Hz')
ylabel('Amplitude')

load('signal2.mat')

lpad = length(x);
xdft = fft(x,lpad);
xdft = xdft(1:floor(lpad/2+1));
xdft = xdft/length(x);
xdft(2:end-1) = 2*xdft(2:end-1);
freq = 0:Fs/lpad:Fs/2;

figure
plot(t,x)
title('Time Domain Signal 2')
xlabel('Time (s)')
ylabel('Signal')
figure
plot(freq,abs(xdft))
title('Frequency Domain Signal 2')
xlabel('Hz')
ylabel('Amplitude')

load('signal3.mat')

lpad = 20*length(x);
xdft = fft(x,lpad);
xdft = xdft(1:floor(lpad/2+1));
xdft = xdft/length(x);
xdft(2:end-1) = 2*xdft(2:end-1);
freq = 0:Fs/lpad:Fs/2;

figure
plot(t,x)
title('Time Domain Signal 3')
xlabel('Time (s)')
ylabel('Signal')
figure
plot(freq,abs(xdft))
title('Frequency Domain Signal 3')
xlabel('Hz')
ylabel('Amplitude')


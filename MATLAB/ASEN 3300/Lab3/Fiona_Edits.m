%% ASEN 3112 Structures - Dataplotting Script

% Author { Daniel Cole Gray }
% SID { 108250504 }
% Date {4/19/2020}

close all;clc;clear

%% Read Data
data = load('5mincenter_renamed.txt');

[r,~,~] = size(data);

time = data(:,1);

acc = data(:,2:5);
disp = data(:,6:9);
laser_vibrometer = data(:,end);

%generate frquencies
%not sure this is right using as a place holder
freq = linspace(2,50,r)'; %excitation frequency Hz

Names = {'Shaker','Tail','Nose','WingTip'};
%% Displacment Data
fDisp = figure('Name','Freq Displacement Data');
fAcc = figure('Name','Acceleration Displacement Data');

for i = 1:4
    
    %center displacement around zero and plot
    coeff{i} = polyfit(freq,disp(:,i),1); 
    figure(fDisp);
    
    subplot(4,1,i); hold on
    plot(freq,disp(:,i)-polyval(coeff{i},freq),'b');
    xlabel('Excitation Frequency [Hz]');
    ylabel('Displacement [mm]');
    title(Names{i});
    
    %plot accelerations
    figure(fAcc);
    subplot(4,1,i);
    plot(freq,acc(:,i),'b');
    xlabel('Excitation Frequency [Hz]');
    ylabel('Acceleration [mm/s^2]');
    title(Names{i});
    
end

%% FFT Analysis
Fs = 1/(time(2)-time(1));%sample frequencies

%WINDOWS 3-5
window(1,1) = 0; 
window(1,2) = 0;

window(2,1) = 0; 
window(2,2) = 0;

window(3,1) = 15; 
window(3,2) = 18;

window(4,1) = 20; 
window(4,2) = 23;

window(5,1) = 37; 
window(5,2) = 40;

% change to 1:5 with Cole's Code
for i = 3:5
    [A,F] = getFFT(disp(freq<window(i,2)),Fs,[window(i,1),window(i,2)]);
    figure(2+i);
    plot(F,A);
    grid on
    xlabel('Frequency [Hz]')
    ylabel('Amplitude')
    
    %frequency
    Resonant(i,1) = (window(i,1)+window(i,2))/2;
    
    %Put resonance on figure 1
    figure (1)
    hold on 
    grid on 
    
    for j = 1:4
        subplot(4,1,j)
        xline(Resonant(i,1),'r')
    end
    
end





%% FFT Anlaysis Function

function[Amp,f] = getFFT(data,Fs,Fpass)
%highpass filter
data = bandpass(data,Fpass,Fs);

%fft
L = length(data);

Y = fft(data)/(L/2);

Amp = abs(Y);

f = (0:Fs/L:(L-1)*Fs/L);


Amp = Amp(f<Fpass(end));
f = f(f<Fpass(end));

end



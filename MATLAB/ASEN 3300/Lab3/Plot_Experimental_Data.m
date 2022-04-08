%% ASEN 3112 Structures - Dataplotting Script

% Authors {Fiona McGann, Daniel Cole Gray }
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
Fs = 1/(time(2)-time(1));%sample frequencies
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

% %% FFT
% %Window/Mode 1
% window{1} = [0,10];
% 
% index_1 = find(window_1(1)<=freq<=window_1(2));
% 
% fMode1 = figure('Name','Mode1 FreqDomain');
% hold on;
% 
% for i = 2:4
%     [amp{1,i-1},f_domain{1,i-1}] = getFFT(disp(index_1,i),Fs,[5,8]);
%     plot(f_domain{1,i-1},amp{1,i-1});
% end
% bounds = [4.78,6.86];
% 
% plot(bounds(1)*[1,1],[0,1],'k--','Linewidth',2);
% plot(bounds(2)*[1,1],[0,1],'k--','Linewidth',2);
% 
% mean_resonance(1) = mean(bounds);
% legend(Names{2:4},'Lower Resonance Bound','Upper Resonance Bounds','Location','Best');
% xlabel('Frequency [Hz]')
% ylabel('Amplitude');

%% FFT (FIONA)
% truth table for if a mode is excited
excited(1,:) = [1,1,0,0,0];
excited(2,:) = [1,0,0,1,1];
excited(3,:) = [1,0,1,1,0];

%WINDOWS 1-5
window(1,1) = 2;
window(1,2) = 10;

window(2,1) = 10;
window(2,2) = 15;

window(3,1) = 15;
window(3,2) = 18;

window(4,1) = 20;
window(4,2) = 23;

window(5,1) = 35;
window(5,2) = 40;

%Bounds 1:5 (hardcoded)
bounds(1,:) = [4.78,6.86];
bounds(2,:) = [11.41,11.41];
bounds(3,:) = [16.49,16.49];
bounds(4,:) = [21.1726,21.1726];
bounds(5,:) = [37.8573,37.8573];

%Band Pass Windows
pass(1,:) = [5,8];
pass(2:5,:) = window(2:5,:);

%Put Mode Window on Plots
colors = {'r','m','g','y','k'};
for i = 2:4
    for j  = 1:5
        figure(1); 
        subplot(4,1,i); hold on ; grid on;
        xline(window(j,1),colors{j});
        xline(window(j,2),colors{j});
            
        figure(2); 
        subplot(4,1,i); hold on; grid on;
        xline(window(j,1),colors{j});
        xline(window(j,2),colors{j});
            
    end
end
    


for i = 1:5
    
    index = find(window(i,1)<=freq<=window(i,2));
    
    figure('Name',['Mode',num2str(i),' ','Frequency Domain']);
    hold on;
    
    for j = 2:4
        
        if excited(j-1,i) == 1
        [amp,f_domain] = getFFT(disp(index,j),Fs,pass(i,:));
        plot(f_domain,amp);
        end
        
    end
    resonance(i) = mean(bounds(i,:));
    
    %Hardcoded bounds by inspection
    if i == 1
    plot(bounds(i,1)*[1,1],[0,1],'k--','Linewidth',2);
    plot(bounds(i,2)*[1,1],[0,1],'k--','Linewidth',2);
  
    
    legend(Names{logical([0,excited(:,i)'])},'Lower Resonance Bound','Upper Resonance Bounds','Location','north west');
    else     
    
    legend(Names{logical([0,excited(:,i)'])},'Location','north west');
    end
    
    xlabel('Frequency [Hz]')
    ylabel('Amplitude');

    fprintf('Mode %0.0f Resonance Frequency: %0.3f Hz \n',i,resonance(i));
    
end


%% FFT Anlaysis Function

function[Amp,f] = getFFT(data,Fs,Fpass)
%bandpass filter
data = bandpass(data,Fpass,Fs);

%fft
L = length(data);

Y = fft(data)/(L/2);

Amp = abs(Y);

f = (0:Fs/L:(L-1)*Fs/L);


Amp = Amp(f<Fpass(end));
f = f(f<Fpass(end));

Amp = Amp/max(Amp);
end



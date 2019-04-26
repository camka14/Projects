%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Group Names:
% 1. Harrison Metthratta
% 2. Samuel Razumovskiy
% 3. Ian Thomas
% 
% Group 12-01
% Author(s):
% Date written:
% Date modified:
% 
% Purpose:
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear; clc; close all;

set(groot, 'defaulttextinterpreter', 'latex');  
set(groot, 'defaultAxesTickLabelInterpreter', 'latex');  
set(groot, 'defaultLegendInterpreter', 'latex');


%% Declaration of Variables
index = 1;
frequency = 1652; % Hz

numSamples = 39;
data = zeros(numSamples, 3);

%% Reading Input and Plotting Data
figure(1);
xlabel('$t$ [s]');
ylabel('$F$ [N]');
title('Thrust v. Time');
grid on;
hold on;
for i = 1:12
    
    filename = sprintf('Group%02d_1PM_statictest1.txt', i);
    [Isp, FMax, FAvg] = read(filename, frequency);
    data(index, 1) = Isp;
    data(index, 2) = FMax;
    data(index, 3) = FAvg;
    index = index + 1;
    
    filename = sprintf('Group%02d_08AM_statictest1.txt', i);
    [Isp, FMax, FAvg] = read(filename, frequency);
    data(index, 1) = Isp;
    data(index, 2) = FMax;
    data(index, 3) = FAvg;
    index = index + 1;
    
    if (i ~= 1)
        filename = sprintf('Group%02d_10AM_statictest1.txt', i);
        [Isp, FMax, FAvg] = read(filename, frequency);
        data(index, 1) = Isp;
        data(index, 2) = FMax;
        data(index, 3) = FAvg;
        index = index + 1;
    end
    
end
 
for i = 14:17

    filename = sprintf('Group%02d_10AM_statictest1.txt', i);
    [Isp, FMax, FAvg] = read(filename, frequency);
    data(index, 1) = Isp;
    data(index, 2) = FMax;
    data(index, 3) = FAvg;
    index = index + 1;

end

IspArr = data(:, 1);
FMaxArr = data(:, 2);
FAvgArr = data(:, 3);

%% Statistics
xIsp = mean(IspArr);
xFMax = mean(FMaxArr);
xFAvg = mean(FAvgArr);

sigIsp = std(IspArr);
sigFMax = std(FMaxArr);
sigFAvg = std(FAvgArr);

semIsp = sigIsp / sqrt(numSamples);
semFMax = sigFMax / sqrt(numSamples);
semFAvg = sigFAvg / sqrt(numSamples);

%% Histogram Plots
figure(2);
histogram(IspArr);
title('Distribution of $I_{sp}$ Achieved over 39 Static Tests');
xlabel('$I_{sp}$ [s]')
ylabel('Number of Tests')

figure(3);
histogram(FMaxArr);
title('Distribution of Maximum Thrust Achieved over 39 Static Tests');
xlabel('$F_{max}$ [N]')
ylabel('Number of Tests')

figure(4);
histogram(FAvgArr);
title('Distribution of Average Thrust over 39 Static Tests');
xlabel('$F_{avg}$ [N]')
ylabel('Number of Tests')



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CODE CHALLENGE 3 - Calculate mean and standard deviation and plot error
%                    bars from two data sets
%
% The purpose of this program is to assess whether two data sets are the
% same.
%
% To complete the challenge, finish the code below to:
% 1) load csv file
% 2) calculate mean and standard deviation of data set
% 3) plot mean with standard deviation error bars
% 4) set axes to set data points in center of plot
% 5) correctly label axes, title, and legend
%
% Please ZIP and upload the 'func.txt', your team's script(s), and the
% results file to Canvas to complete the challenge.
% 
% STUDENT TEAMMATES
% 1.Samuel Razumovskiy
% 2.Evan Welch
% 3.Mia Abouhamad
% 4.
%
% CHALLENGE AUTHOR
% Melinda Zavala
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Housekeeping: Clear the variables and close all open plots
   % Clears all the variables
   clear;
   % Closes all the plots
   close all;
   % Clears the command line
   clc;
%% Initialization: Define the Functions, Load Data, and Set Known Values

% load data using csvread (data file format). Start at row 2 and read all
% columns.
data = csvread('subject_data.csv',1);
x1 = data(:,1);
x2 = data(:,2);
%% Calculate mean and standard deviations for each subject
%
% calculate mean
x1_mean = mean(x1);
x2_mean = mean(x2);
% calculate standard deviation
x1std = std(x1);
x2std = std(x2);
%% Plotting: Plot subject data with error bars
%
% plot mean as a point, and standard deviation error bars
% use 'errobar' function to create bars
hold on
err1 = x1std*ones(size(x1));
err2 = x2std*ones(size(x2));
plot(length(x1)/2,x1_mean,'Marker','.','MarkerSize',10)
plot(length(x2)/2,x2_mean,'Marker','.','MarkerSize',10)
errorbar(x1,err1)
errorbar(x2,err2)
% set x-axes limits so that points show up in center of plot
xlim([0 length(x1)+1])

% label axes, title, and legend
xlabel('Trial')
ylabel('Result')
title('Subject Data')
legend('S1 Mean','S2 Mean','Subject1','Subject2')

% save file as '.png' type. Use 'saveas' function
saveas(gcf,'image.png')

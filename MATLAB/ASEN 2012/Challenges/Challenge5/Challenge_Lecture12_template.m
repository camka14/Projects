%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CODE CHALLENGE for Lecture 12 - Linear Least-Squares Fit
%
% The purpose of this program is to calculate the equation of the best fit
% line for a data set using linear least-squares fitting.
%
% To complete the challenge, finish the code below to:
% 1) load data from .mat file
% 2) find linear best fit coefficients
% 3) plot the original data along with the best fit line for time t=0 to
%    time t=150s
% 4) add errorbars for fit uncertainty to this plot
%
% Please upload the finished script to Canvas to finish this coding
% challenge.
% 
% STUDENT TEAMMATES
% 1.
% 2.
% 3.
% 4.
%
% CHALLENGE AUTHOR
% Justin Fay
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Housekeeping: Clear the variables and close all open plots
clearvars   % Clears all the variables
close all   % Closes all the plots
clc         % Clears the command line

%% Load data

% Load 'data' structure from .mat file
load('./data.mat')

% Seperate time and y into individual vectors
t = data.t; % [s]
y = data.y; % [deg C]

% Find number of data points
N = numel(t);

%% Find linear best fit coefficients m and b
% Only use polyfit to check other methods

A(:,1) = t;
A(:,2) = 1;

x = A\y;

m = x(1);
b = x(2);


%% Find uncertainty associated with this fit line

sy = sqrt(1/(N-2)*sum((y-m.*t-b).^2));

W=zeros(N);
for i=1:N
    W(i,i) = 1/sy^2;
end
Q = (transpose(A)*W*A)^-1;

sm = sqrt(Q(1,1));
sb = sqrt(Q(2,2));

%% Plot linear fit line between t=0 and t=150s


plot(t,y)


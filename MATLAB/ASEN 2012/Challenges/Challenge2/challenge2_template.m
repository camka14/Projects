%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CODE CHALLENGE 2 - Calculate and plot trajectory of elliptical orbits
%
% The purpose of this program is to calculate the trajectory of various
% objects orbiting Earth and plot them together.
%
% To complete this challenge you will need to complete both this script and
% the sub function ellipticalOrbit.m by doing the following:
% 1) add the elliptical orbit equation to ellipticalOrbit.m
% 2) use ellipticalOrbit.m to calculate the trajectory for multiple orbits
% 3) plot all trajectories in a single figure
% 4) properly label all axes and include a title
% 5) add a legend to label each orbit
%
% If you complete all of these tasks before the class is over, try
% importing the orbital parameters from orbits.csv instead of manually
% entering them.
%
% Please ZIP and upload the ellipticalOrbit function and your team's
% script(s) to Canvas to complete the challenge.
% 
% STUDENT TEAMMATES
% 1.Samuel Razumovskiy
% 2.Tom Mcimerney
% 3.Leo Foster Greer
% 4.
%
% CHALLENGE AUTHORS
% Justin Fay 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Housekeeping: Clear the variables and close all open plots
      % Clears all the variables
      % Closes all the plots
      % Clears the command line
clear,clc
%
%% Initialization: Define the Functions, Load Data, and Set Known Values
% 
% The orbital parameters are specified for you below as seperate vectors

% e = [0; 0.5; 0.5; 0.75]; Commented out in order to load orbital data from
% csv file

% a = [1000; 1000; 1500; 1000];

theta=[0:2*pi/200:2*pi]; % Creates a list of thetas from 0 to 2pi

% EXTRA: load orbital data from csv file
e = csvread('orbits.csv',1,0,[1, 0, 4, 1]);
a = csvread('orbits.csv',1,1);
%% Calculate trajectories for each orbit
%
% Use ellipticalOrbit to calculate a trajectory for each set of paramters.
% These trajectories should include a single full orbit around Earth. If
% you choose to use a discrete set of angles, you should use at least 200.

r=zeros(length(a),201);

for i = 1:length(a) % Calcates r for sets of a and e
    r(i,:) = ellipticalOrbit(e(i),a(i),theta);
end


%% Plot results
%
% You should plot all trajectories on the same plot, so they are easy to
% compare. The plots should be in cartesian coordinates with properly
% labeled axes (for this challenge the axes can just be X and Y). A legend
% should be included that clearly shows what orbital parameters (e and a)
% were used for each trajectory. You should also plot a single mark at the
% origin to clearly show the position of Earth.
fig = figure; hold on
for i = 1:length(a)
    [x,y] = pol2cart(theta,r(i,:)); % Converts to cartesian coordinates
    plot(x,y); % Plots the x and y
end

plot(0,0,'.b','MarkerSize',20) % Plots Earth
xlabel('X')
ylabel('Y')
xlim([-1100 5200]) % Redefines X bounds
ylim([-2000 3000]) % Redefines Y bounds
Legend = cell(length(a)+1,1); % Defines Legend

for i=1:length(a)
    str = sprintf('a:%4.0f, e:%.2f',a(i),e(i)); % Over complicated legend maker that can take more
    Legend{i}=str;                              % variables if needed
end

Legend{i+1} = 'Earth'; % Final addition to Legend
legend(Legend)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CODING CHALLENGE 10 - Integrating Systems of Equations: van der Pol
% 
% The purpose of this challenge is to give you experience formulating
% higher order differential equations using ODE45 with van der Pol's
% equation. van der Pol's equation describes a self-sustaning oscillator,
% essentially a linear spring with a non-linear damper.
%
% Please ZIP and upload your team's script(s) and figures in PNG format to
% Canvas to complete the challenge.
% 
% STUDENT TEAMMATES
% 1. Ryan Joseph
% 2. Brian Jackman
% 3. Samuel Razumovskiy
% 4.
%
% CHALLENGE AUTHORS
% Allison Anderson, Melinda Zavala
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Housekeeping
clear all
close all
clc

%% Please write your group number and section here:
group = 14;
section = 2;

%% Setting the parameters (given variables)


%% Part A

% 1) Plot position vs. velocity, using mu = 1 for 20 seconds. Use the
% initial conditions y(0) = 5 and y_dot(0) = 0.
y0 = [5,0];
mu = 1;
t = [0 20];
[~,y] = ode45(@(t,y) fun(t,y,mu),t,y0);
pos = y(:,1);
accel = y(:,2);

partA = figure(1);
hold on
plot(pos,accel)
title('Occilator Motion')
xlabel('Position')
ylabel('Acceleration')
hgsave(partA,'PartA');

% 2) On the same figure, plot position vs. velocity with the initial
% conditions y(0) = 2, and y_dot(0) = 0. Use mu = 1 and plot for 20 seconds.
y0 = [2 0];
[~,y] = ode45(@(t,y) fun(t,y,mu),t,y0);
pos = y(:,1);
accel = y(:,2);

plot(pos,accel)

% 3) On the same figure, plot position vs. velocity with the initial
% conditions y(0) = 5, and y_dot(0) = 1. Use mu = 1 and plot for 20 seconds.
y0 = [5 1];
[~,y] = ode45(@(t,y) fun(t,y,mu),t,y0);
pos = y(:,1);
accel = y(:,2);

plot(pos,accel)
legend('y0 = 5, dy0 = 0','y0 = 2, dy0 = 0','y0 = 5, dy0 = 1')

% Plot and save figure in PNG format with group number and section in file
% name

saveas(gcf,['mu1_group',num2str(group),'_sec',num2str(section)],'png')

%% Part B
% 2) Plot position and velocity from Part A #1, and on the same figure,
% plot position vs. velocity using mu = 2 over *60 seconds*. Use the
% initial conditions y(0) = 5, and y_dot = 0.
y0 = [5 0];
mu = 2;
t = [0 60];
[~,y] = ode45(@(t,y) fun(t,y,mu),t,y0);
pos = y(:,1);
accel = y(:,2);

openfig('PartA');
plot(pos,accel)
legend('mu = 1','mu = 2')

% Plot and save figure in PNG format with group number and section in file
% name

saveas(gcf,['mu2_group',num2str(group),'_sec',num2str(section)],'png')

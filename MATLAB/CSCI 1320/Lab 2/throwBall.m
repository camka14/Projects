% Name: Samuel Razumovskiy
% ID: 109343605
% Course: CSCI 1320-100
% Recitation: 108
% Lab: 2
clear,clc,close all
h = 1.5;
g = 9.8;
v = input('Please input the velocity in m/s '); % User input for velocity
ang = input('Please input the angle in degrees '); % User input for angle
t = linspace(0,20,10000); % Makes time into a list
x = v*cosd(ang).*t; % Calculates the x distance
y = h+v*sind(ang).*t-1/2*g.*t.^2; % Calculates the y distance
x_hit = x(find(y<0,1)); %Finds the value of x when y is negative
fprintf('The ball hits the ground at a distance of %.2f meters\n',x_hit)
figure
plot(x,y)
xlim([0 x_hit*(1+.05)]) %Sets the limit to 5 percent of the impact distance
xlabel('distance (m)')
ylabel('height (m)')
title('projectile path')
hold on
z = zeros(1,length(x)); %Creates a vector of zeros as long as x
plot(x,z,'k--')
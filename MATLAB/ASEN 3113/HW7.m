%% ASEN 3113 - Assignment 07 - Main
%
%   Author: Samuel Razumovskiy
%   Collaborators: None
%   Date: 11/1/2019 (last revised: 11/1/2019)

clear,clc,close all

h = 150; %W/m^2k
rho = 8000; %kg/m^3
L = 0.02; %m
Cp = 570; %J/kgK
b = h/(rho*L*Cp);
Ti = 18;
Tinf = 950;

v = 0.005:.001:.06; %m/s
t = 3./v; %s
Te = exp(-b.*t).*(Ti-Tinf)+Tinf;

plot(v,Te)
title('Temperature at Exit vs. Velocity')
xlabel('Velocity (m/s)')
ylabel(['Exit Temperature (',char(176),'C)'])
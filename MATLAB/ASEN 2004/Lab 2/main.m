%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Group Names:
% 1. Joey Derks
% 2. Michael Martinson
% 3. Harrison Methratta
% 4. Samuel Razumovskiy
% 5. Ian Thomas
% 6. Ruben Hinojosa Torres

%main.m
% Group 12-01
% Author(s): Mike Martinson, Ian Thomas
% Date written: 1/18/2019
% Date modified:
% 
% Purpose:
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc ; clear; close all; 

set(groot, 'defaulttextinterpreter', 'latex');  
set(groot, 'defaultAxesTickLabelInterpreter', 'latex');  
set(groot, 'defaultLegendInterpreter', 'latex');

%% Main Calculation
%Define constants: 
e = 0.9; % span efficiency factor
b = 0.45/2; % m
h = 0.45/4; % m
chordA = 0.14; % m
chordB = 0.0762; % m

Sref = 2*(b.*chordA+(chordA+chordB)./(2)*h); % m^2
AR = .9^2./Sref; % aspect ratio
e0 = 1.78 * (1 - 0.045 * AR .^ 0.68) - 0.64; % Oswald whole plane efficiency
k = 1 ./ (pi * e0 .* AR);
Cfe = 0.005;
altitude = 1800; % m
GTOW = .15; % kg
Sfuse = 58359.86;
Swing = (104408+25+373)*2;
Swet = (Sfuse+Swing)*10^-6;
filename = 'Table1.csv';

[~, ~, ~, LDmax, vMaxRange, alphaMaxRange] = driverFuncNoPlots(Swet,Sref,Cfe,e,e0,AR,k,GTOW,altitude,filename);

figure(1)
plot(chordA, LDmax)

figure(2)
plot(chordA, vMaxRange)

figure(3)
plot(chordA, alphaMaxRange)



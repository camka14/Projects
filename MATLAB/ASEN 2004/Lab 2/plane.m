

% Ian Thomas
% Plane Design Analysis Tool

clc ; clear; close all; 

set(groot, 'defaulttextinterpreter', 'latex');  
set(groot, 'defaultAxesTickLabelInterpreter', 'latex');  
set(groot, 'defaultLegendInterpreter', 'latex');

[num,~,~] = xlsread('Table1.csv');

figure(1);
alphas = num(:, 1);
Cl = num(:, 2);
Cd = num(:, 3);
plot(alphas, Cl, 'LineWidth', 1.5);
grid on;
hold on;
xlabel('$\alpha$ [$^\circ$]');
ylabel('$C_l$');


indices = alphas >= 2 & alphas <= 7.75;
p = polyfit(alphas(indices), Cl(indices), 1);

%% Definition of Variables

a0 = p(1);
e = 0.7;

b = 0.45/2; % m
h = 0.45/2; % m
chordA = 0.14; % m
chordB = 0.0762; % m
S_ref = 2*(b.*chordA+(chordA+chordB)./(2)*h); % m^2
Sfuse = 58359.86;
Swing = (104408+25+373)*2;
S_wet = (Sfuse+Swing)*10^-6;
AR = .9^2 / S_ref;
a = (a0)./(1 + (57.3*a0)/(pi*e*AR));
e0 = 1.78 * (1 - 0.045 * AR ^ 0.68) - 0.64;
k = 1./(pi * e0 * AR);
Cfe = 0.004;
CDmin = Cfe * S_wet / S_ref;
altitude = 1500; % m
[~, ~, ~, rho] = atmoscoesa(altitude);
GTOW = 0.068; % kg

%% Calculation of Lift-Curve Slope
alphaL0 = interp1(Cl, alphas, 0);
CL = a.*(alphas - alphaL0); % asume CL of whole aircraft
CDwing = Cd + (1 / (pi * e * AR)) * CL .^ 2;
[~, minIndex] = min(CDwing);
alphaWingMinD = alphas(minIndex);
CLminD = a * (alphaWingMinD - alphaL0);

CD = CDmin + k * (CL - CLminD).^2;
figure(2);
plot(CL, CD, 'LineWidth', 1.5);
title('Theoretical Drag polar for Glider');
xlabel('$C_L$');
ylabel('$C_D$');
grid on;


%% Calculation of Range, Max Range Flight Conditions
[LDmax, index] = max(CL./CD);
LDmax
alphaLDmax = alphas(index)
CL_LDmax = CL(index)
vFlightCond = sqrt((2 * GTOW * 9.81) ./ (CL_LDmax * rho * S_ref))






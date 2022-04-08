%% ASEN 3200 HW3 problem 4 Calculations
clear all; close all; clc;

R=[-3429.7,-47.5,1172]; %  km
V=[-0.425,-3.333,-0.892999]; % km/s

mu=42828;
deg=pi/180;


% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
[coe,Q, phi]=Orbital_elements(R,V,mu);

disp(' ')
fprintf('\n Angular momentum (km^2/s) = %g', coe(1))
fprintf('\n Eccentricity = %g', coe(2))
fprintf('\n Right ascension (deg) = %g', coe(3)/deg)
fprintf('\n Inclination (deg) = %g', coe(4)/deg)
fprintf('\n Argument of perigee (deg) = %g', coe(5)/deg)
fprintf('\n True anomaly (deg) = %g', coe(6)/deg)
fprintf('\n Semimajor axis (km): = %g', coe(7))
fprintf('\n Flight path angle (deg) = %g', phi/deg)
fprintf('\n Period (s) = %.1f', coe(8));
fprintf('\n Eccentric Anomaly (deg) = %.1f\n', coe(9)/deg);

t = (coe(5)-coe(2)*sin(coe(5))-(coe(9)-coe(2)*sin(coe(9))))/(2*pi/coe(8));
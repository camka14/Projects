%% ASEN 3113 - Assignment 08 - Main
%
%   Author: Samuel Razumovskiy
%   Collaborators: None
%   Date: 11/5/2019 (last revised: 11/5/2019)

clear,clc,close all
T = 5780;
lam = 0.01:1:1000;
C1 = 3.74177e8;
C2 = 1.34878e4;

Ebl = C1./(lam.^5.*(exp(C2./(lam.*T))-1));

plot(lam,Ebl)
xlabel('\lambda ({\mu}m)')
ylabel('Radiation (W/m^2)')
title('Radiation vs. Wavelength')
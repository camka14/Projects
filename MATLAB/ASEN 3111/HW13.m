%% Header
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Samuel Razumovskiy
% Date written: 12/10/19
% Date modified: 12/10/19
%
% Assignment 13
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear,clc
MeV = linspace(1,10);
At = 0.140222553; % m^2
Ae = 11.2688759; % m^2
g = 1.22;

% Left side of area relation equation
Ae_At = (Ae/At)^2;

% Right side of area relation equation
mach = 1./MeV.^2.*(2./(g+1).*(1+(g-1)./2.*MeV.^2)).^((g+1)/(g-1));

% Finding minimum difference
[~,ind] = min(abs(Ae_At-mach));

% Pressure critical 2/3 mach number
Me = MeV(ind);
fprintf('The mach number of the supersonic case is %1.2f',Me)
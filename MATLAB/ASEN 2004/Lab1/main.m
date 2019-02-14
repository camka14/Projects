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
AR = 16.5; % aspect ratio
e0 = 1.78 * (1 - 0.045 * AR ^ 0.68) - 0.64; % Oswald whole plane efficiency
k = 1 / (pi * e0 * AR);
Sref = 0.63; % reference area (planform area) (m^2)
Cfe = 0.00475;
altitude = 1800; % m
GTOW = .05; % kg
Swet = 2.67746;
SwetFuselage = 0.89;
filename = 'Table1.csv';

%Read in CFD data: 
[Table2mat, txt, Table2cells] = xlsread('Table2.xlsx'); 
alphaCFD = Table2mat(:,1);
CLCFD = Table2mat(:,2); 
CDCFD = Table2mat(:,3); 


driverFunc(Swet,Sref,Cfe,e,e0,AR,alphaCFD,CLCFD, CDCFD, k, ...
    GTOW, altitude, filename);
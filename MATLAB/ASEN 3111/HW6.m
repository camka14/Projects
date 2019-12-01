%% ASEN 3111 - Homework 6 - Main
%   Calculating the coefficient of moment and center of pressure for a
%   given airfoil
%
%   Author: Samuel Razumovskiy
%   Collaborators: None
%   Date:10/15/2019 (last revised: 10/16/2019)

%% Problem 4.7
clear,clc,close all

dz_dx1 =@(t) (0.2-0.25.*(1-cos(t))).*cos(2.*t);
dz_dx2 =@(t) (0.0888-0.111.*(1-cos(t))).*cos(2.*t);
dz_dx3 =@(t) (0.2-0.25.*(1-cos(t))).*cos(t);
dz_dx4 =@(t) (0.0888-0.111.*(1-cos(t))).*cos(t);

Cm = 1/2*(integral(dz_dx1,0,1.369)+integral(dz_dx2,1.369,pi)-...
    integral(dz_dx3,0,1.369)-integral(dz_dx4,1.369,pi));

Xcp = 1/4*(1+2*(integral(dz_dx3,0,1.369)+integral(dz_dx4,1.369,pi)-...
    integral(dz_dx1,0,1.369)-integral(dz_dx2,1.369,pi)));

fprintf('Coefficient of moment = %1.4f\n', Cm)
fprintf('Center of pressure location = %1.4f*c\n', Xcp)
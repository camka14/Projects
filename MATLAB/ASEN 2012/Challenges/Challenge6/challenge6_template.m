%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CODE CHALLENGE 6 - Numerical Integration Basics
% 
% This script includes defintions for the trapezoidal method and Simpson's
% 1/3 method. Please read the instructions carefully, and complete the
% three steps outlined below. Bonus questions are included at the end.
%
% Please ZIP and upload your team's script(s) and figures to Canvas to 
% complete the challenge.
% 
% STUDENT TEAMMATES
% 1. Samuel Razumovskiy
% 2. Philip Miceli
% 3. Joseph Beuscher
% 4.
%
% CHALLENGE AUTHORS
% Jelliffe Jackson, Allison Anderson, Torin Clark, John Jackson 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Housekeeping
clear
close all
clc

%% Flow Velocity Measurements in a Pipe

% You have measurements of the laminar flow velocity at different pipe radii:
r = [0.0 0.25 0.5 0.75 1 1.25 1.5 1.75 2.0 2.25]';
v = [38.0 37.6 36.2 33.6 29.7 24.5 17.8 9.6 4.3 0]';

% You want to determine the volumetric flow rate through the pipe.
% The volumetric flow rate through a pipe is analytically found by the
% equation Q = integral(2pi * v(r) * r dr) from 0 to r. However, you've
% taken data on the flow velocity, so you want to perform a numerical
% integration.

figure(1)
plot(v, r, 'k*', 'LineWidth',2);
title('Velocity of Flow in Pipe')
ylabel('r (in)')
xlabel('v (in/s)')
hold on; grid on;

%% (1) Calculate the values of f(r) and make a plot showing f(r) vs r
figure(2)
f_r = 2*pi .* v .* r;
plot(r,f_r,'k*','LineWidth',2)
title('F(r)')
xlabel('r (in)')
ylabel('A/s (in^2/s)')

%% (2) Finish defining the function trapezoidal and calculate Q (below)
trap = trapezoidal(r,f_r);
trap2 = trapz(r,f_r);
% Use the MATLAB function trapz to check your code.

%% (3) Finish defining the function simpson_onethird and calculate Q (below)

simp = simpson_onethird(r,f_r);
% How can you reality check the result for Simpson's 1/3 method?


%% NOTE: Functions in a script need to be at the bottom. Don't put any code
% below these functions.
function res = trapezoidal(X, FX)
res = 0;    % Hint: you know x and f(x)    
for i = 1:length(X)-1
    res = res + (X(i+1)-X(i))*(FX(i+1)+FX(i));  
end
res = res/2;
end

function integrationSim = simpson_onethird(X, FX)
    integrationSim = (.25/3)*(FX(1)+FX(length(X))+FX(length(X)-1));
    for i = 2:2:length(X) - 1
        integrationSim = integrationSim+ ((X(i+1)-X(i))/3)*(4*FX(i)+ 2*FX(i+1));
    end
end

%% Bonus Questions
% In this case, which integration method is better for estimating the
% volumetric flow through the pipe?
%
% It depends on the accuracy you are looking for, but it may be more
% accurate to use the simpsons rule since it is likely more accurate but
% more difficult to estimate.

% How might you propogate uncertainties in the velocity measurements in the
% numerical integration?
% 
% The uncertainty would have to be propogated using the equation provided.
% And can be solved using the general method, since the partial derivative
% with respect to r would result in the equation of f_r.
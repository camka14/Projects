%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CODE CHALLENGE 9 - Integrating Forward in Time with ODE45
% 
% The purpose of this challenge is to solve for a car's velocity with
% respect to time. We will use the built-n ODE 45 function to solve
% over 30 seconds with varying accelerations. Three parts will include
% accelerating with gas, N2O, and braking until the car comes to a stop.
%
% This code should also incorporate your previous integration methods from
% the previous coding challenges, so you can compare side-by-side the
% accuracies of the methods.
%
% Please ZIP and upload your team's script(s) and figures to Canvas to 
% complete the challenge.
% 
% STUDENT TEAMMATES
% 1.
% 2.
% 3.
% 4.
%
% CHALLENGE AUTHORS
% Torin Clark, Melinda Zavala, Justin Fay, John Jackson
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Housekeeping
clearvars
close all
clc

%% Given Variables

Cd   = 0.5;   % coefficient of drag
rho  = 1.225; % density of air at sea level, at 15C (kg/m^3)
aGas = 3;     % acceleration with gas (m/s^2)
aN2O = 5;     % acceleration with NO2 (m/s^2)
aB   = -1;    % braking acceleration (m/s^2)
Ar   = 4;     % frontal area of vehicle (m^2)
m    = 800;   % kg

%% Part 1: Acceleration
% Solve for the acceleration with gas for the first 15 seconds
% Function: dv/dt = a(t) - (1/2)*(1/m)*Cd*rho*A*v(t)^2 (second component is
% equation for drag)

% Initialize acceleration function for only gas
a_gas = @(t,v) aGas - (1/2)*(1./m).*Cd.*rho.*Ar.*v.^2;


[x, y] = ode45(a_gas,[0 15],0);



%% Part 2: N20
% If press N20 pedal from t = 15-18 seconds. Plot until t = 18.

% Initialize acceleration function for N2O
a_N2O = @(t,v) aN2O - (1/2)*(1./m).*Cd.*rho.*Ar.*v.^2;






%% Part 3: deceleration
% Use accelertion value of -1 m/s^2, plot until v = 0 (could be > 30sec)

% Initialize acceleration function for braking
a_brake = @(t,v) (aB - (1/2)*(1./m).*Cd.*rho.*Ar.*v.^2).*(v>0);





%% Part 4: Comparison
% Plot and compare the methods. 

%% Bonus: New Geo Metro
% You are an engineering intern working on a new low-drag profile for
% the next generation Geo Metro. You took a scale model of the car, put it
% in a wind tunnel, and collected data to determine the drag acting on the
% car at different speeds.

% This Geo Metro has a dynamic profile to reduce drag at high speeds.

% (1) Compute a fit for the drag vs. velocity data. You may use whichever
% formulation (linear, quadratic, etc.) that you think is appropriate.

% (2) Create an anonymous function to calculate the acceleration of the
% vehicle at a given velocity V.

% (3) Use ODE 45 to determine how long it takes the new Geo Metro to go
% from 0 to 60 miles per hour (mph)

% (4) Using the best estimate for the braking acceleration, how long would
% it take the Geo Metro to stop from 120 mph?

% (5) How long would it take the Geo Metro to come to a complete stop using
% air resistance alone? Does the car ever stop only due to air resistance
% with your model of drag?

ac_geo = 2; % m/s^2
ac_brake = [-0.75 -0.8 -0.79 -0.5 -0.71]; % Results from different trials

load('aeromats')

plot(v_test, drag_noisy, '*');
xlabel('Air Velocity (s)')
ylabel('Measured Drag (m/s$^2$)')
grid on;
title('Air Drag vs. Air Velocity')
hold on;






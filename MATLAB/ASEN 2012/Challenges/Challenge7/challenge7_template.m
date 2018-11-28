%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CODE CHALLENGE 7 - Integrating Forward in Time with Euler (RK1)
% 
% The purpose of this challenge is to solve for a car's velocity with
% respect to time. We will use Euler's Method solving forward in time (RK1)
% over 30 seconds with varying accelerations. Three parts will include
% accelerating with gas, N2O, and braking until the car comes to a stop.
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
% Torin Clark, Melinda Zavala 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Housekeeping
clear all
close all
clc

%% Given Variables

Cd   = 0.5;   % coefficient of drag
rho  = 1.225; % density of air at sea level, at 15C (kg/m^3)
aGas = 3;     % acceleration with gas (m/s^2)
aN20 = 5;     % acceleration with NO2 (m/s^2)
aB   = -1;    % braking acceleration (m/s^2)
Ar   = 4;     % frontal area of vehicle (m^2)
m    = 800;   % kg

%% Part 1: Acceleration
% Solve for the acceleration with gas for the full time period and plot the
% results.
% Function: dv/dt = a(t) - (1/2)*(1/m)*Cd*rho*Ar*v(t)^2 (second component is
% equation for drag)
f1=@(v) aGas - (1/2)*(1/m)*Cd*rho*Ar*v^2;
dt = .1;
count = 1;
time = 0:dt:30;
gasvel = zeros(1,length(time));
for t=time(1:end-1)
    count = count + 1;
    gasvel(count) = gasvel(count-1) + dt*(f1(gasvel(count-1)));
end
figure(1)
plot(time,gasvel)

%% Part 2: N20
% If press N20 pedal from t = 15-18 seconds. Plot until t = 18.
f2=@(v) aN20- (1/2)*(1/m)*Cd*rho*Ar*v^2;
count = 1;
time = 15:dt:18;
N20vel = zeros(1,length(time));
for t=time(1:end-1)
    count = count + 1;
    N20vel(count) = N20vel(count-1) + dt*(f2(N20vel(count-1)));
end
figure(2)
plot(time,N20vel)

%% Part 3: deceleration
% Use accelertion value of -1 m/s^2, plot until v = 0 (could be > 30sec)


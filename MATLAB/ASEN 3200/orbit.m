%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Numerical Integration of Orbit
% Ian Thomas
% 1/17/2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

close all; clear; clc;

set(groot,'defaulttextinterpreter','latex');  
set(groot, 'defaultAxesTickLabelInterpreter','latex');  
set(groot, 'defaultLegendInterpreter','latex');

%% Declaration of Parameters
mu = 398600.4418; % km^3 s^-2
e = 0.587;
a = 242200; % km
rp = a * (1 - e);

vmax = sqrt(mu*(2/rp - 1/a));

P = 2 * pi * sqrt(a^3 / mu);

% x y dx dy

%% Integration
IC = [rp; 0; 0; vmax];

options = odeset('RelTol', 1e-10);

[t, Y] = ode45(@(t, X) EOM(t, X, mu), [0 P], IC, options);
x = Y(:, 1);
y = Y(:, 2);

%% Plotting
figure(1);
plot(x, y, 'LineWidth', 1.5);
hold on;
grid on;
xlabel('$p$ [km]');
ylabel('$q$ [km]');
title('Orbital Path of Satellite');
axis equal;

Re = 6371;
pos = [-Re -Re 2*Re 2*Re];
rectangle('Position', pos, 'Curvature', [1 1], 'FaceColor', [0 0 1]);

%% Equation of Motion
function Y = EOM(~, X, mu)
    x = X(1);
    y = X(2);
    dx = X(3);
    dy = X(4);
    r2 = x^2 + y^2;
    r = sqrt(r2);
    ddxy = -mu / r2;
    ddx = ddxy * x / r;
    ddy = ddxy * y / r;
    Y = [dx; dy; ddx; ddy];
end
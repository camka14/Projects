%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Samuel Razumovskiy
% Date written: 9/20/19
% Date modified: 9/26/19
% 
% Purpose: Modeling quadcopter flight and comparing three different models
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

set(groot, 'defaulttextinterpreter', 'latex');  
set(groot, 'defaultAxesTickLabelInterpreter', 'latex');  
set(groot, 'defaultLegendInterpreter', 'latex');
%% Problem 2
clear,clc,close all
dpsi = 5*pi/180;
dtheta = 5*pi/180;
dphi = 5*pi/180;
dp = 0.1;
dq = 0.1;
dr = 0.1;
letter = ['a','b','c','d','e','f'];
changes = [dphi,0,0,0,0,0;0,dtheta,0,0,0,0;0,0,dpsi,0,0,0;0,0,0,dp,0,0;...
    0,0,0,0,dq,0;0,0,0,0,0,dr];
[row,~] = size(changes);
for i = 1:row
    change = changes(i,:);
    % Non changing values
    mass = 0.068; % kg
    g = 9.81; % m/s^2
    weight = mass*g; % N B frame 3x1
    radius = 0.060; % m
    del_f1 = -weight/4; % N B frame 3x1
    del_f2 = -weight/4; % N B frame 3x1
    del_f3 = -weight/4; % N B frame 3x1
    del_f4 = -weight/4; % N B frame 3x1
    I_B = [6.8e-5,0,0;0,9.2e-5,0;0,0,1.35e-4]; % kg/m^2 B frame 3x3
    tspan = [0 10];
    
    % Initial conditions for changing variables
    pos_N = 0; pos_E = 0; pos_D = -5; % m E frame
    velE_xB = 0; velE_yB = 0; velE_zB = 0; % m/s B frame
    y_trans = [pos_N; pos_E; pos_D; velE_xB; velE_yB; velE_zB];
    
    psi = change(3); theta = change(2); phi = change(1); % rad
    p = change(4); q = change(5); r = change(6); % rad/s B frame
    y_rot   = [psi; theta; phi; p; q; r];
    
    y = [y_trans;y_rot];
    
    opt = odeset('maxstep',0.001);
    [t,pos] = ode45(@(t,y)quadcopter_ODE(t,y,mass,I_B,g,radius,del_f1,del_f2,del_f3,del_f4),tspan,y,opt);
   
    figure(i)
    subplot(2,1,1)
    hold on
    plot(t,pos(:,1))
    plot(t,pos(:,2))
    plot(t,pos(:,3))
    xlabel('Time (s)')
    ylabel('Position (m)')
    title(sprintf("Problem 2%s Position",letter(i)))
    legend('N','E','D','location','southeast')
    subplot(2,1,2)
    hold on
    plot(t,pos(:,7).*180./pi)
    plot(t,pos(:,8).*180./pi)
    plot(t,pos(:,9).*180./pi)
    xlabel('Time (s)')
    ylabel('Orientation (deg)')
    title(sprintf("Problem 2%s Orientation",letter(i)))
    legend('psi','theta','phi','location','southeast')
    
end

%% Problem 3
clear,clc,close all
dpsi = 5*pi/180;
dtheta = 5*pi/180;
dphi = 5*pi/180;
dp = 0.1;
dq = 0.1;
dr = 0.1;
letter = ['a','b','c','d','e','f'];
changes = [dphi,0,0,0,0,0;0,dtheta,0,0,0,0;0,0,dpsi,0,0,0;0,0,0,dp,0,0;...
    0,0,0,0,dq,0;0,0,0,0,0,dr];
[row,~] = size(changes);
for i = 1:row
    change = changes(i,:);
    % Non changing values
    mass = 0.068; % kg
    g = 9.81; % m/s^2
    weight = mass*g; % N B frame 3x1
    radius = 0.060; % m
    del_f1 = 0; % N B frame 3x1
    del_f2 = 0; % N B frame 3x1
    del_f3 = 0; % N B frame 3x1
    del_f4 = 0; % N B frame 3x1
    I_B = [6.8e-5,0,0;0,9.2e-5,0;0,0,1.35e-4]; % kg/m^2 B frame 3x3
    tspan = [0 10];
    
    % Initial conditions for changing variables
    pos_N = 0; pos_E = 0; pos_D = -5; % m E frame
    velE_xB = 0; velE_yB = 0; velE_zB = 0; % m/s B frame
    y_trans = [pos_N; pos_E; pos_D; velE_xB; velE_yB; velE_zB];
    
    del_psi = change(3); del_theta = change(2); del_phi = change(1); % rad
    del_p = change(4); del_q = change(5); del_r = change(6); % rad/s B frame
    y_rot   = [del_psi; del_theta; del_phi; del_p; del_q; del_r];
    
    y = [y_trans;y_rot];
    
    opt = odeset('maxstep',0.001);
    [t,pos] = ode45(@(t,y)linearized_quadcopter_ODE(t,y,mass,I_B,g,radius,del_f1,del_f2,del_f3,del_f4),tspan,y,opt);
   
    figure(7+i)
    subplot(2,1,1)
    hold on
    plot(t,pos(:,1))
    plot(t,pos(:,2))
    plot(t,pos(:,3))
    xlabel('Time (s)')
    ylabel('Position (m)')
    title(sprintf("Problem 2%s Position",letter(i)))
    legend('N','E','D','location','southeast')
    subplot(2,1,2)
    hold on
    plot(t,pos(:,7).*180./pi)
    plot(t,pos(:,8).*180./pi)
    plot(t,pos(:,9).*180./pi)
    xlabel('Time (s)')
    ylabel('Orientation (deg)')
    title(sprintf("Problem 2%s Orientation",letter(i)))
    legend('psi','theta','phi','location','southeast')
end
%% Problem 4
clear,clc,close all

% Non changing values
mass = 0.068; % kg
g = 9.81; % m/s^2
I_B = [6.8e-5,0,0;0,9.2e-5,0;0,0,1.35e-4]; % kg/m^2 B frame 3x3
tspan = [0 10];
dpsi = 5*pi/180;
dtheta = 5*pi/180;
dphi = 5*pi/180;
dp = 0.1;
dq = 0.1;
dr = 0.1;
k1 = 0.004; % Nm/(rad/s)
letter = ['d','e','f'];
changes = [0,0,0,dp,0,0;0,0,0,0,dq,0;0,0,0,0,0,dr];
[row,~] = size(changes);
for i = 1:row
    change = changes(i,:);    
    % Initial conditions for changing variables
    pos_N = 0; pos_E = 0; pos_D = -5; % m E frame
    velE_xB = 0; velE_yB = 0; velE_zB = 0; % m/s B frame
    y_trans = [pos_N; pos_E; pos_D; velE_xB; velE_yB; velE_zB];
    
    psi = change(3); theta = change(2); phi = change(1); % rad
    p = change(4); q = change(5); r = change(6); % rad/s B frame
    y_rot   = [psi; theta; phi; p; q; r];
    
    y = [y_trans;y_rot];
    
    opt = odeset('maxstep',0.001);
    [t,pos] = ode45(@(t,y)FB_quadcopter_ODE(t,y,mass,I_B,g,k1),tspan,y,opt);
   
    figure(14+i)
    subplot(2,1,1)
    hold on
    plot(t,pos(:,1))
    plot(t,pos(:,2))
    plot(t,pos(:,3))
    xlabel('Time (s)')
    ylabel('Position (m)')
    title(sprintf("Problem 2%s Position",letter(i)))
    legend('N','E','D','location','southeast')
    subplot(2,1,2)
    hold on
    plot(t,pos(:,7).*180./pi)
    plot(t,pos(:,8).*180./pi)
    plot(t,pos(:,9).*180./pi)
    xlabel('Time (s)')
    ylabel('Orientation (deg)')
    title(sprintf("Problem 2%s Orientation",letter(i)))
    legend('psi','theta','phi','location','southeast')
end
%% Problem 5
clear,clc,close all

load RSdata_White_1516.mat
times = rt_estim.time(:);
xdata = rt_estim.signals.values(:,1);
ydata = rt_estim.signals.values(:,2);
zdata = rt_estim.signals.values(:,3);
psi = rt_estim.signals.values(:,4);
theta = rt_estim.signals.values(:,5);
phi = rt_estim.signals.values(:,6);

figure(18)
subplot(2,1,1)
hold on
plot(times,xdata)
plot(times,ydata)
plot(times,zdata)
xlabel('Time (s)')
ylabel('Position (m)')
title("Problem 4 Position")
legend('x','y','z','location','southwest')

subplot(2,1,2)
hold on
plot(times,psi.*180./pi)
plot(times,theta.*180./pi)
plot(times,phi.*180./pi)
xlabel('Time (s)')
ylabel('Orientation (deg)')
title("Problem 4 Orientation")
legend('psi','theta','phi','location','southwest')

%% Functions Called
% The following functions were built and called as part of this assignment.
%
% <include>quadcopter_ODE.m linearized_quadcopter_ODE.m FB_quadcopter_ode.m</include>


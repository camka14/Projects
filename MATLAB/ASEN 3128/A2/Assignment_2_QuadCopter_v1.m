%% Problem 7
clear,clc,close all
% Non changing values
mass = 0.068; % kg
g = 9.81; % m/s^2
weight = mass*g; % N B frame 3x1
radius = 0.060; % m
f1 = -weight/4; % N B frame 3x1
f2 = -weight/4; % N B frame 3x1
f3 = -weight/4; % N B frame 3x1
f4 = -weight/4; % N B frame 3x1
I_B = [6.8e-5,0,0;0,9.2e-5,0;0,0,1.35e-4]; % kg/m^2 B frame 3x3
tspan = [0 10];

% Initial conditions for changing variables
pos_N = 0; pos_E = 0; pos_D = -5; % m E frame
velE_xB = 0; velE_yB = 0; velE_zB = 0; % m/s B frame
y_trans = [pos_N; pos_E; pos_D; velE_xB; velE_yB; velE_zB];

psi = 0; theta = 0; phi = 0; % rad 
p = 0; q = 0; r = 0; % rad/s B frame
y_rot   = [psi; theta; phi; p; q; r];

y = [y_trans;y_rot];

opt = odeset('maxstep',0.001);
[t,pos] = ode45(@(t,y)quadcopter_ODE(t,y,mass,I_B,g,radius,f1,f2,f3,f4),tspan,y,opt);

figure(1)
hold on
plot(t,pos(:,1))
plot(t,pos(:,2))
plot(t,pos(:,3))
ylim([-6 1])
xlabel('Time (s)')
ylabel('Position (m)')
title('Problem 7 Position')
legend('N','E','D')
%% Problem 8 a
clear,clc
% Non changing values
mass = 0.068; % kg
g = 9.81; % m/s^2
radius = 0.060; % m
I_B = [6.8e-5,0,0;0,9.2e-5,0;0,0,1.35e-4]; % kg/m^2 B frame 3x3
tspan = [0 10]; % s

% Calculation of drag and resulting forces from rotors in the B frame
velE_NE = 0; velE_EE = 5; velE_DE = 0; % m/s E frame

VE_E = [velE_NE;velE_EE;velE_DE]; % m/s E frame 3x1
VEmag = norm(VE_E); % m/s E frame scalar
Aa = -1*10^-3.*VEmag.*VE_E; % N E frame 3x1

FE = -([0;0;mass*g]+Aa); % N E frame 3x1

psi = 0; theta = 0; phi = -atan(FE(2)/FE(3)); % rad
p = 0; q = 0; r = 0; % rad/s B frame
y_rot   = [psi; theta; phi; p; q; r];

L_EB = [cos(theta)*cos(psi),sin(phi)*sin(theta)*cos(psi)-cos(phi)*sin(psi),...
    cos(phi)*sin(theta)*cos(psi)+sin(phi)*sin(psi);cos(theta)*sin(psi),...
    sin(phi)*sin(theta)*sin(psi)+cos(phi)*cos(psi),...
    cos(phi)*sin(theta)*sin(psi)-sin(phi)*cos(psi);...
    -sin(theta),sin(phi)*cos(theta),cos(phi)*cos(theta)];

FB = L_EB\FE; % N B frame 3x1
f1 = FB(3)/4; % N B frame  3x1
f2 = FB(3)/4; % N B frame 3x1
f3 = FB(3)/4; % N B frame 3x1
f4 = FB(3)/4; % N B frame 3x1

% Initial conditions for changing variables
VE_B = L_EB\VE_E;

pos_N = 0; pos_E = 0; pos_D = -5; % m E frame
velE_xB = VE_B(1); velE_yB = VE_B(2); velE_zB = VE_B(3); % m/s B frame
y_trans = [pos_N; pos_E; pos_D; velE_xB; velE_yB; velE_zB];

y = [y_trans;y_rot];

opt = odeset('maxstep',0.001);
[t,pos] = ode45(@(t,y)quadcopter_ODE(t,y,mass,I_B,g,radius,f1,f2,f3,f4),tspan,y,opt);

figure(2)
hold on
plot(t,pos(:,1))
plot(t,pos(:,2))
plot(t,pos(:,3))
xlabel('Time (s)')
ylabel('Position (m)')
title('Problem 8a Position')
legend('N','E','D')

figure(3)
hold on
plot(t,pos(:,4))
plot(t,pos(:,5))
plot(t,pos(:,6))
xlabel('Time (s)')
title('Problem 8a Velocity')
ylabel('Velocity (m/s)')
legend('Vx','Vy','Vz')

%% Problem 8 b
clear,clc,close all
% Non changing values
mass = 0.068; % kg
g = 9.81; % m/s^2
radius = 0.060; % m
I_B = [6.8e-5,0,0;0,9.2e-5,0;0,0,1.35e-4]; % kg/m^2 B frame 3x3
tspan = [0 10]; % s

% Calculation of drag and resulting forces from rotors in the B frame
velE_NE = 0; velE_EE = 5; velE_DE = 0; % m/s E frame

VE_E = [velE_NE;velE_EE;velE_DE]; % m/s E frame 3x1
VEmag = norm(VE_E); % m/s E frame scalar
Aa = -1*10^-3.*VEmag.*VE_E; % N E frame 3x1

FE = -([0;0;mass*g]+Aa); % N E frame 3x1

psi = pi/2; theta = atan(FE(2)/FE(3)); phi = 0; % rad
p = 0; q = 0; r = 0; % rad/s B frame
y_rot   = [psi; theta; phi; p; q; r];

L_EB = [cos(theta)*cos(psi),sin(phi)*sin(theta)*cos(psi)-cos(phi)*sin(psi),...
    cos(phi)*sin(theta)*cos(psi)+sin(phi)*sin(psi);cos(theta)*sin(psi),...
    sin(phi)*sin(theta)*sin(psi)+cos(phi)*cos(psi),...
    cos(phi)*sin(theta)*sin(psi)-sin(phi)*cos(psi);...
    -sin(theta),sin(phi)*cos(theta),cos(phi)*cos(theta)];

FB = L_EB\FE; % N B frame 3x1
f1 = FB(3)/4; % N B frame  3x1
f2 = FB(3)/4; % N B frame 3x1
f3 = FB(3)/4; % N B frame 3x1
f4 = FB(3)/4; % N B frame 3x1

% Initial conditions for changing variables
VE_B = L_EB\VE_E;

pos_N = 0; pos_E = 0; pos_D = -5; % m E frame
velE_xB = VE_B(1); velE_yB = VE_B(2); velE_zB = VE_B(3); % m/s B frame
y_trans = [pos_N; pos_E; pos_D; velE_xB; velE_yB; velE_zB];

y = [y_trans;y_rot];

opt = odeset('maxstep',0.001);
[t,pos] = ode45(@(t,y)quadcopter_ODE(t,y,mass,I_B,g,radius,f1,f2,f3,f4),tspan,y,opt);

figure(4)
hold on
plot(t,pos(:,1))
plot(t,pos(:,2))
plot(t,pos(:,3))
xlabel('Time (s)')
ylabel('Position (m)')
title('Problem 8b Position')
legend('N','E','D')

figure(5)
hold on
plot(t,pos(:,4))
plot(t,pos(:,5))
plot(t,pos(:,6))
xlabel('Time (s)')
title('Problem 8b Velocity')
ylabel('Velocity (m/s)')
legend('Vx','Vy','Vz')
%% Problem 9
clear,clc
% Non changing values
mass = 0.068;                           % kg
g = 9.81;                               % m/s^2
radius = 0.060;                         % m
I_B = [6.8e-5,0,0;0,9.2e-5,0;0,0,1.35e-4]; % kg/m^2 B frame 3x3
tspan = [0 10];                         % s

velE_NE = 0; velE_EE = 0; velE_DE = 0;  % m/s E frame

VE_E = [velE_NE;velE_EE;velE_DE];       % m/s E frame 3x1
VEmag = norm(VE_E);                     % m/s E frame scalar
Aa = -1*10^-3.*VEmag.*VE_E;             % N E frame 3x1

FE = -([0;0;mass*g]+Aa);                % N E frame 3x1

% Adding a change in phi
psi = 0; theta = 0; phi = .1;            % rad
p = 0; q = 0; r = 0;                    % rad/s B frame
y_rot   = [psi; theta; phi; p; q; r];

L_EB = [cos(theta)*cos(psi),sin(phi)*sin(theta)*cos(psi)-cos(phi)*sin(psi),...
    cos(phi)*sin(theta)*cos(psi)+sin(phi)*sin(psi);cos(theta)*sin(psi),...
    sin(phi)*sin(theta)*sin(psi)+cos(phi)*cos(psi),...
    cos(phi)*sin(theta)*sin(psi)-sin(phi)*cos(psi);...
    -sin(theta),sin(phi)*cos(theta),cos(phi)*cos(theta)];

% Lift from rotors only counter acts gravity
FB = L_EB\FE; % N B frame 3x1
f1 = FB(3)/4; % N B frame  3x1
f2 = FB(3)/4; % N B frame 3x1
f3 = FB(3)/4; % N B frame 3x1
f4 = FB(3)/4; % N B frame 3x1

% Initial conditions for changing variables
VE_B = L_EB\VE_E;

pos_N = 0; pos_E = 0; pos_D = -5; % m E frame
velE_xB = VE_B(1); velE_yB = VE_B(2); velE_zB = VE_B(3); % m/s B frame
y_trans = [pos_N; pos_E; pos_D; velE_xB; velE_yB; velE_zB];

y = [y_trans;y_rot];

opt = odeset('maxstep',0.001);
[t,pos] = ode45(@(t,y)quadcopter_ODE(t,y,mass,I_B,g,radius,f1,f2,f3,f4),tspan,y,opt);

figure(6)
hold on
plot(t,pos(:,1))
plot(t,pos(:,2))
plot(t,pos(:,3))
xlabel('Time (s)')
ylabel('Position (m)')
title('Problem 9 Position')
legend('N','E','D')

figure(7)
hold on
plot(t,pos(:,4))
plot(t,pos(:,5))
plot(t,pos(:,6))
xlabel('Time (s)')
ylabel('Velocity (m/s)')
title('Problem 9 Velocity')
legend('Vx','Vy','Vz')
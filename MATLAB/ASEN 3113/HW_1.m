%% Header

% Name: Samuel Razumovskiy
% Class: ASEN 3128
% Assignment: 1
% Due: 9/12/2019

clear,clc,close all
%% A) Checking if Results Make Sense

% Initial conditions for velocity, wind, and position
VN = 0;
VE = 20;
VD = -20;

N = 0;
E = 0;
D = 0;

WN = 0;
WE = 0;
WD = 0;

% Constants
rho = 1.225;
mass = 0.03;
area = pi*(.015)^2;
Cd = 0.6;
g = 9.81;
t = [0 5];

% Inits for ODE45
inits = [VN,VE,VD,N,E,D];

% ODE45
opt = odeset('maxstep',0.001);
[t, pos] = ode45(@(t,X) Integrate(t,X,WN,WE,WD,rho,mass,area,Cd,g),t,...
    inits,opt);

% Index of D positions below 0
ind = find(pos(:,6)<=0);

fprintf("The trajectory makes sense and seems to behave accurately\n")

% Ploting with up as positive so D pos is negative
figure(1)
plot(pos(ind,5),-pos(ind,6))
xlabel("Distance (m)")
ylabel("Height (m)")
title("Golf Ball Trajectory")
ylim([0 60])

%% B) Checking Sensitivity to Wind
clear,clc,close all

% Initial conditions for velocity, wind, and position
VN = 0;
VE = 20;
VD = -20;

N = 0;
E = 0;
D = 0;

WN = linspace(0,20);
WE = 0;
WD = 0;

% Constants
rho = 1.225;
mass = 0.03;
area = pi*(.015)^2;
Cd = 0.6;
g = 9.81;
t = [0 5];
defN = zeros(1,100);
defE = zeros(1,100);

% Inits for ODE45
inits = [VN,VE,VD,N,E,D];

% Loop for a range of wind values
for i=1:length(WN)
    % ODE45
    opt = odeset('maxstep',0.001);
    [t, pos] = ode45(@(t,X) Integrate(t,X,WN(i),WE,WD,rho,mass,area,Cd,g),t,...
        inits,opt);
    % Storing deflection horizontally
    defN(i) = pos(end,4);
    defE(i) = pos(end,5);
end

% Normalizing deflection in the E
defE = defE-defE(1);

% Finding equation for wind vs. deflection
EquN = polyfit(WN,defN,1);
EquE = polyfit(WN,defE,1);

% Slope of the line
slopeN = EquN(1);
slopeE = EquE(1);

fprintf("The northward deflection in m per m/s of wind is %.3f m/(wind m/s)\n"...
    ,slopeN)
fprintf("While the eastward deflection was %.4f m/(wind m/s)",slopeE)

% Plot of the wind vs. deflection
figure(2)
hold on
plot(WN,defN)
plot(WN,defE)
xlabel("Wind (m/s)")
ylabel("Deflection (m)")
title("Deflection due to Wind")
legend("Northward deflection","Eastward deflection","location","northwest")
hold off
%% C) Finding How Mass Affects Distance
clear,clc,close all

% Range of Masses
m = linspace(0.01,.1);

% Initializing variable for max range
Dis = zeros(1,100);

% Looping for the range of masses
for i = 1:length(m)
    
    % Velocity dependent on the mass
    V = sqrt(12*2/m(i));

    % Initial conditions for velocity, wind, and position
    VN = 0;
    VE = V*cosd(45);
    VD = -V*cosd(45);

    N = 0;
    E = 0;
    D = 0;
    
    % Setting wind to 0 since only looking at distance
    WN = 0;
    WE = 0;
    WD = 0;

    % Constants
    rho = 1.225;
    mass = m(i);
    area = pi*(.015)^2;
    Cd = 0.6;
    g = 9.81;
    t = [0 5];

    % Inits for ODE45
    inits = [VN,VE,VD,N,E,D];

    % ODE45
    opt = odeset('maxstep',0.001);
    [t, pos] = ode45(@(t,X) Integrate(t,X,WN,WE,WD,rho,mass,area,Cd,g),t,...
        inits,opt);
    
    % Storing max range
    pos2 = pos(pos(:,6)<=0,5);
    Dis(i) = pos2(end);
end

% Maximum value of the different ranges and its index
[maxD, I] = max(Dis);

% Mass for the max distance
maxMass = m(I);

fprintf("A slightly lighter ball seems to get a better range\n")
fprintf("The maximum range found was %.3f m using a mass of %.3f kg\n",maxD,maxMass)
fprintf("Which is less than the starting mass of 0.03 kg")

% Plotting mass vs. max distance
figure(3)
plot(m,Dis)
xlabel("Mass (kg)")
ylabel("Distance (M)")
title("Effect of Mass on Distance")
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This program calculates the trajectory of a bottle rocket using MATLAB's
% ODE 45 function.

% Inputs: Time, initial conditions, coefficient of discharge, coefficient
% of drag, gamma, area of the throat, area of the bottle, initial volume of
% air, volume of bottle, density of water, density of ambient air, pressure
% of ambient air, initial pressure of air in bottle, pressure of air at the
% end of the phase 2, gravity, R, initial mass of air, launch angle. 

% Outputs: The volume of air, mass of air, mass of rocket, velocity in the
% x and z, and position in the x and z.

% Assumptions: Assuming the rail does not have a normal force on the
% rocket, there is no wind effect, the wateer does not mix with the air,
% incompressible ambient flow, steady flow, stable rocket, stable thrust,
% standard atmosphere.

% Created by: Samuel Razumovskiy, 109343605
%             Joseph Derks, 108319261
% Created: 11/15/2018
% Modified: 11/30/2018
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% House Keeping
clear,clc,close all

%% Initialising Constants and initial conditions
Cd     = 0.8;
CD     = 0.5;
Gamma  = 1.4;
Px0    = 0; % m
Pz0    = 0.25; % m
At     = pi * (0.021/2)^2; % m^2
Ab     = pi * (0.105/2)^2; % m^2
vA0    = 0.001; % m^3
vb     = 0.002; % m^3
rhoW   = 1000; % kg/m^3
rhoA   = 0.961; % kg/m^9
Pa     = 12.1 *6894.76; % Pa
P0     = Pa + 50*6894.76; % Pa
Pend   = P0*(vA0/vb)^Gamma; % Pa
Vx0    = 0; % m/s
Vz0    = 0; % m/s
g      = 9.81; % m/s^2
t      = [0 5]; % s
R      = 287; % J/kg*K
T      = 300; % K
Mb     = 0.15; % kg
MR0    = Mb + rhoW*(vb - vA0) + (rhoA/(R*T))*vA0; % kg
MA0    = (P0*vA0)/(R*T); % kg
theta0 = 45; % deg

inits = [vA0,MA0,MR0,Vx0,Vz0,Px0,Pz0]; % Initial conditions

%% Run ODE45
opt = odeset('maxstep',0.001); % Decreasing step size for accuracy
[t,VM] = ode45(@(t,X) VM_int(t,X,Cd,CD,Gamma,At,Ab,vA0,vb,rhoW,rhoA,Pa,P0,...
    Pend,g,R,MA0,theta0),t,inits,opt);

%% Preparing for Calculation of Thrust Curve
[r, c] = size(t);
Thrust = zeros(r,1);
phase2start = true;
phase3start = true;

% %% Calculating Thrust Curve
% for i = 1:r
%     %%%%%%%%%%% Phase 1 %%%%%%%%%%%
%     if VM(i,1) < vb
%         % Equations for Pressure, change in volume of air, change in mass of
%         % rocket, and thrust
%         P      = P0*(vA0/VM(i,1))^Gamma;
%         dvA_dt = Cd*At*sqrt(2/rhoW*(P-Pa));
%         dMA_dt = 0;
%         dMR_dt = -Cd*At*sqrt(2*rhoW*(P-Pa));
%         
%         Thrust(i) = 2*Cd*At*(P-Pa);
%         
%         %%%%%%%%%%% Phase 2 %%%%%%%%%%%
%     else
%         % initial check of the pressure to check the condition
%         P = Pend*(VM(i,2)/MA0)^Gamma;
%         if P > Pa % Checks if the pressure is greater than the ambient
%             % Equations for pressure critical, density of air, and temperature
%             Pc     = P*(2/(Gamma+1))^(Gamma/(Gamma-1));
%             rhoA   = VM(i,2)/vb;
%             Temp   = P/(rhoA*R);
%             
%             % Checks if the flow is choked or not then calculates exit pressure, exit
%             % temperature, and exit mach number
%             if Pc > Pa % Choked flow
%                 Pe = Pc;
%                 Tempe = (2/(Gamma+1))*Temp;
%                 Me = 1;
%             else       % Not choked flow
%                 Pe = Pa;
%                 Me = sqrt(((P/Pa)^((Gamma-1)/Gamma)-1)*2/(Gamma-1));
%                 Tempe = Temp/(1+(Gamma-1)/2*Me^2);
%             end
%             
%             % Equations for density at exit, exit velocity, change in air mass, change
%             % in rocket mass, and thrust for phase 2
%             rhoe   = Pe/(R*Tempe);
%             Ve     = Me*sqrt(Gamma*R*Tempe);
%             dvA_dt = 0;
%             dMA_dt = -Cd*rhoe*At*Ve;
%             dMR_dt = dMA_dt;
%             Thrust(i) = -dMA_dt*Ve+(Pe-Pa)*At;
%             if phase2start == true
%                 phase2 =[VM(i,6),VM(i,7),t(i),Thrust(i)];
%                 phase2start = false;
%             end
%             
%             %%%%%%%%%%% Phase 3 %%%%%%%%%%%
%         else
%             if phase3start == true
%                 phase3 =[VM(i,6),VM(i,7),t(i),Thrust(i)];
%                 phase3start = false;
%             end
%             % All derivatives set to 0 since there is no change
%             Thrust(i) = 0;
%         end
%         %%%%%%%%%%% End of Phases %%%%%%%%%%%
%     end
% end
% 
% %% Plotting Trajectory
% [Maxalt, imax] = max(VM(:,7));
% Maxdis = max(VM(:,6));
% 
% MaxXanot = [(VM(imax,6)-5)/70, VM(imax,6)/70];
% MaxYanot = [(Maxalt+3)/30, Maxalt/30];
% MaxXdist = [(Maxdis -10)/70, Maxdis/70];
% MaxYdist = [0.1,0];
% hold on
% grid on
% figure(1)
% plot(VM(:,6),VM(:,7))
% plot(phase2(1),phase2(2),'*')
% plot(phase3(1),phase3(2),'*')
% legend('Trajectory','Phase 2 Start','Phase 3 Start')
% annotation('textarrow',MaxXanot,MaxYanot,'String',strcat('Max altitude = ', num2str(Maxalt)))
% ylim([0 30])
% title('Trajectory')
% xlabel('Distance (m)')
% ylabel('Height (m)')
% 
% %% Plotting Thrust Curve
% figure(2)
% hold on
% grid on
% plot(t,Thrust)
% plot(phase2(3),phase2(4),'*')
% plot(phase3(3),phase3(4),'*')
% legend('Thrust Curve','Phase 2 Start','Phase 3 Start')
% title('Thrust Curve')
% xlabel('Time (s)')
% ylabel('Thrust (N)')
% xlim([0 .45])
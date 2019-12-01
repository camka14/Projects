%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Samuel Razumovskiy
% Date written: 10/24/19
% Date modified: 10/31/19
% 
% Purpose: Finding the effect of adding control to a 747
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear,clc,close all

% Defining all the variables
Xu = -712.6;
Xw = 22561;
Xq = 0;
Xwd = 0;
Xdel = 177653;
Zu = -19584;
Zw = -124932;
Zq = -561782;
Zwd = 4529.7;
Zdel = -1.48e6;
Mu = 36367;
Mw = -250289;
Mq = -1.89e7;
Mwd = -18406;
Mdel = -4.89e7;
exz = -6.8;
Ix = 2.468e7;
Iy = 4.488e7;
Iz = 6.738e7;
Izx = 1.315e6;
m = 6.366e5*4.448/9.81;
V = 157.9;
g = 9.81;
u0 = V*cosd(exz);
S = 510.9667;
c = 8.324;

% Defining equations using variables
Xup = Xu*cosd(exz)^2-(Xw+Zu)*sind(exz)*cosd(exz)+Zw*sind(exz)^2;
Xwp = Xw*cosd(exz)^2+(Xu-Zw)*sind(exz)*cosd(exz)-Zu*sind(exz)^2;
Xqp = Xq*cosd(exz)-Zq*sind(exz);
Xudp = Zwd*sin(exz)^2;
Xwdp = -Zwd*sind(exz)*cosd(exz);
Zup = Zu*cosd(exz)^2-(Zw-Xu)*sind(exz)*cosd(exz)-Xw*sind(exz)^2;
Zwp = Zw*cosd(exz)^2+(Zu+Xw)*sind(exz)*cosd(exz)+Xu*sind(exz)^2;
Zqp = Zq*cosd(exz)+Xq*sind(exz);
Zudp = -Zwd*sind(exz)*cosd(exz);
Zwdp = Zwd*cosd(exz)^2;
Mup = Mu*cosd(exz)-Mw*sind(exz);
Mwp = Mw*cosd(exz)+Mu*sind(exz);
Mqp = Mq;
Mudp = -Mwd*sind(exz);
Mwdp = Mwd*cosd(exz);

% Calculating the A matrix
A = [Xup/m,Xwp/m,0,-g;Zup/(m-Zwdp),Zwp/(m-Zwdp),(Zqp+m*u0)/(m-Zwdp),0;...
    1/Iy*(Mup+(Mwdp*Zup/(m-Zwdp))),1/Iy*(Mwp+(Mwdp*Zwp/(m-Zwdp))),1/Iy*(Mqp+(Mwdp*(Zup+m*u0)/(m-Zwdp))),0;
    0,0,1,0];

%% Problem 3a
% Using coefficients of stability derivatives provided
Cxde = -3.818e-6;
Czde = -0.3648;
Cmde = -1.444;
rho = .65283;

Xde = Cxde*1/2*rho*u0^2*S;
Zde = Czde*1/2*rho*u0^2*S;
Mde = Cmde*1/2*rho*u0^2*S*c;

zeta0 = -Mqp/(Iy*2*sqrt(-u0*Mwp/Iy));
ks = 1:0.01:3;
for i = 1:numel(ks)
    k2 = (u0*Mwp*(1-ks(i)))/Mde;
    k1 = Mqp/Mde+Iy/Mde*2*zeta0*sqrt(-ks(i)*u0*Mwp/Iy);
    Ashort = [(Mqp-k1*Mde)/Iy,(u0*Mwp-k2*Mde)/Iy;1,0];
    [V,D] = eig(Ashort);
    lam1(i) = D(1);
    lam2(i) = D(2,2);
end
figure
hold on
c = linspace(1,10,length(ks));
scatter(real(lam1),imag(lam1),5,c,'filled')
scatter(real(lam2),imag(lam2),5,c,'filled')
colorbar('Ticks',linspace(1,10,5),'TickLabels',{'k_s=1','k_s=1.5','k_s=2','k_s=2.5','k_s=3'});
xlabel('Re')
ylabel('Im')
title('Short Period Eigen Values')

%% Problem 3b
clear lam1 lam2
B = [Xde/m,0;Zde/(m-Zwdp),0;Mde/Iy+(Mwdp*Zde/(Iy*(m-Zwdp))),0;0,0];

for i = 1:numel(ks)
    k2 = (u0*Mwp*(1-ks(i)))/Mde;
    k1 = Mqp/Mde+Iy/Mde*2*zeta0*sqrt(-ks(i)*u0*Mwp/Iy);
    K = [0,0,-k1,-k2;0,0,0,0];
    FullLin = A+B*K;
    [V,D] = eig(FullLin);
    lam1(i) = D(1);
    lam2(i) = D(2,2);
    lam3(i) = D(3,3);
    lam4(i) = D(4,4);
end
figure
hold on
grid on
scatter(real(lam1),imag(lam1),5,c,'filled')
scatter(real(lam2),imag(lam2),5,c,'filled')
scatter(real(lam3),imag(lam3),5,c,'filled')
scatter(real(lam4),imag(lam4),5,c,'filled')
colorbar('Ticks',linspace(1,10,5),'TickLabels',{'k_s=1','k_s=1.5','k_s=2','k_s=2.5','k_s=3'});
xlabel('Re')
ylabel('Im')
title('Full Linearized Eigen Values')

%% Problem 3c
ks = [1,2];
for ks = ks
    k2 = (u0*Mwp*(1-ks))/Mde;
    k1 = Mqp/Mde+Iy/Mde*2*zeta0*sqrt(-ks*u0*Mwp/Iy);
    K = [0,0,-k1,-k2;0,0,0,0];
    
    tspan = [0 100];
    
    pos_N = 0; pos_E = 0; pos_D = 0; % m E frame
    u = 0; v = 0; w = 0; % m/s B frame
    y_trans = [pos_N; pos_E; pos_D; u; v; w];
    
    psi = 0; theta = 0.1; phi = 0; % rad
    p = 0; q = 0; r = 0; % rad/s B frame
    y_rot = [psi; theta; phi; p; q; r];
    
    y = [y_trans;y_rot];
    opt = odeset('maxstep',0.01);
    
    [t,pos] = ode45(@(t,y)linearized_Aircraft_ODE(t,y,u0,A,B,K),tspan,y,opt);
    
    figure
    value = sprintf("%1.f",ks);
    sgtitle(strcat('{\Delta}{\Theta}=0.1 k_s = ',value))
    subplot(3,2,1)
    plot(t,pos(:,1),'r')
    title('Position')
    ylabel('N (m)')
    grid on
    
    subplot(3,2,3)
    plot(t,pos(:,2),'b')
    ylabel('E (m)')
    grid on
    
    subplot(3,2,5)
    plot(t,pos(:,3),'g')
    ylabel('D (m)')
    xlabel('Time (s)')
    grid on
    
    subplot(3,2,2)
    plot(t,pos(:,8).*180./pi,'r')
    title("Orientation")
    ylabel("\theta (deg)")
    grid on
    
    subplot(3,2,4)
    plot(t,pos(:,9).*180./pi,'b')
    ylabel("\phi (deg)")
    grid on
    
    subplot(3,2,6)
    plot(t,pos(:,7).*180./pi,'g')
    ylabel("\psi (deg)")
    xlabel('Time (s)')
    grid on
end

%% Functions Called
% The following functions were built and called as part of this assignment.
%
% <include>linearized_Aircraft_ODE.m</include>

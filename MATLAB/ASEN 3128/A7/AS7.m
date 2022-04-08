%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Samuel Razumovskiy
% Date written: 10/17/19
% Date modified: 10/24/19
% 
% Purpose: Finding the eigenvalues of a 737 and observing its flight
% characteristics
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear,clc,close all

%% Question 2

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
Zedl = -1.48e6;
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
u0 = V;

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

%% Question 3
% Calculating the A matrix
A = [Xup/m,Xwp/m,0,-g;Zup/(m-Zwdp),Zwp/(m-Zwdp),(Zqp+m*u0)/(m-Zwdp),0;...
    1/Iy*(Mup+(Mwdp*Zup/(m-Zwdp))),1/Iy*(Mwp+(Mwdp*Zwp/(m-Zwdp))),1/Iy*(Mqp+(Mwdp*(Zup+m*u0)/(m-Zwdp))),0;
    0,0,1,0];

fprintf('A = \n')
disp(A)

%% Question 4

% Calculating Eigen Values
[V,D] = eig(A);

lam1 = D(1);
lam2 = D(2,2);
lam3 = D(3,3);
lam4 = D(4,4);
figure
hold on
grid on
plot(D(1),'*b')
plot(D(2,2),'*b')
plot(D(3,3),'*r')
plot(D(4,4),'*r')
title('Eigen values')
legend('Short Period','~','Short Period')

% Finding the Damping ratio and the natural frequency
eta_sp = real(lam1);
nu_sp = imag(lam1);
eta_ph = real(lam3);
nu_ph = imag(lam3);

z_sp = sqrt(1/(1+(nu_sp/eta_sp)^2));
wn_sp = -eta_sp/z_sp;

z_ph = sqrt(1/(1+(nu_ph/eta_ph)^2));
wn_ph = -eta_ph/z_ph;

%% Question 5

m = [Mqp/Iy,Mwp*u0/Iy;1,0];
[V2,D2] = eig(m);

%% Question 6

dvelU = 10;
dvelW = 10;
dq = .1;
dtheta = .1;

changes = [0,0,0,0;dvelU,0,0,0;0,dvelW,0,0;0,0,dq,0;0,0,0,dtheta];
names = ["Steady State","Perturbation \Delta u","Perturbation \Delta w","Perturbation \Delta q","Perturbation \Delta \theta"];


for i = 1:length(changes)
    CH = changes(i,:);
    tspan = [0 100];
    
    pos_N = 0; pos_E = 0; pos_D = 0; % m E frame
    u = CH(1); v = 0; w = CH(2); % m/s B frame
    y_trans = [pos_N; pos_E; pos_D; u; v; w];
    
    psi = 0; theta = CH(4); phi = 0; % rad
    p = 0; q = CH(3); r = 0; % rad/s B frame
    y_rot = [psi; theta; phi; p; q; r];
    
    y = [y_trans;y_rot];
    opt = odeset('maxstep',0.001);
    
    [t,pos] = ode45(@(t,y)linearized_Aircraft_ODE(t,y,u0,A),tspan,y,opt);
    
    figure
    sgtitle(names(i))
    subplot(3,2,1)
    plot(t,pos(:,1),'r')
    title("Problem 6 Positions Lon")
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
    title("Problem 6 Orientation Lon")
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
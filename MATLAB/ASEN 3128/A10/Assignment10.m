%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Samuel Razumovskiy
% Date written: 11/14/19
% Date modified: 11/21/19
% 
% Purpose: Finding the eigenvalues of a 737 and observing its lateral 
% flight characteristics
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear,clc,close all

%% Question 1
% Defining all the given parameters
exz = -6.8*pi/180;
Ix = 2.46767e7;
Iy = 4.488e7;
Iz = 6.7384e7;
Izx = 1.315e6;
m = 6.366e5*4.448/9.81;
u0 = 157.9;
S = 5500*0.3048^2;
b = 195.68*0.3048;
c = 27.31*0.3048;
g = 9.81;
rho = 0.66011;

Ixs = Ix*cos(exz)^2+Iz*sin(exz)^2+Izx*sin(2*exz);
Izs = Ix*sin(exz)^2+Iz*cos(exz)^2-Izx*sin(2*exz);
Izxs = -.5*(Ix-Iz)*sin(2*exz)-Izx*sin(sin(exz)^2-cos(exz)^2);

% Making a matrix of the coefficients
Coeff = [-0.8771, -0.2797,   0.1946;...
               0, -0.3295, -0.04073;...
               0,   0.304,  -0.2737];

% Making a matrix of the conversion factors
Conv = [1/2*rho*u0*S,1/2*rho*u0*b*S,1/2*rho*u0*b*S;...
    1/4*rho*u0*b*S,1/4*rho*u0*b^2*S,1/4*rho*u0*b^2*S;...
    1/4*rho*u0*b*S,1/4*rho*u0*b^2*S,1/4*rho*u0*b^2*S];

Dim= Conv.*Coeff;

% Dimensionalized stability derivatives
Yv = Dim(1,1); Lv = Dim(1,2); Nv = Dim(1,3);
Yp = Dim(2,1); Lp = Dim(2,2); Np = Dim(2,3);
Yr = Dim(3,1); Lr = Dim(3,2); Nr = Dim(3,3);

% Converting the Stability derivatives to Stability frame
Yvp = Yv;
Ypp = Yp*cos(exz)-Yr*sin(exz);
Yrp = Yr*cos(exz)+Yp*sin(exz);
Lvp = Lv*cos(exz)-Nv*sin(exz);
Lpp = Lp*cos(exz)^2-(Lr+Np)*sin(exz)*cos(exz)+Nr*sin(exz)^2;
Lrp = Lr*cos(exz)^2-(Nr-Lp)*sin(exz)*cos(exz)-Np*sin(exz)^2;
Nvp = Nv*cos(exz)+Lv*sin(exz);
Npp = Np*cos(exz)^2-(Nr-Lp)*sin(exz)*cos(exz)-Lr*sin(exz)^2;
Nrp = Nr*cos(exz)^2+(Lr+Np)*sin(exz)*cos(exz)+Lp*sin(exz)^2;

%% Question 2
Ixp = (Ixs*Izs-Izxs^2)/Izs;
Izp = (Ixs*Izs-Izxs^2)/Ixs;
Izxp = Izxs/(Ixs*Izs-Izxs^2);

% A matrix
A = [        Yvp/m,          Ypp/m,        Yr/m-u0, g;...
    Lvp/Ixp+Izxp*Nvp, Lpp/Ixp+Izxp*Npp, Lrp/Ixp+Izxp*Nrp, 0;...
    Izxp*Lvp+Nvp/Izp, Izxp*Lpp+Npp/Izp, Izxp*Lrp+Nrp/Izp, 0;...
                 0,              1,              0, 0];

%% Question 3
[V,D] = eig(A);

Re = real(D);
Im = imag(D);
figure
hold on
grid on
plot(Re,Im,'*')
title('Eigen values')
xlabel('Real')
ylabel('Imaginary')
line(xlim(), [0,0], 'LineWidth', 1, 'Color', 'k');
line([0,0], ylim(), 'LineWidth', 1, 'Color', 'k');

tau = -1./Re;

% Dutch roll Damping and Natural frequency
z = sqrt(1/(1+(Im(1)/Re(1))^2));
wn= -Re(1)/z;
% All Stable

%% Question 4
% Approximated eigenvalues for Dutch Roll
approx = roots([1,-(A(1)+A(3,3)), A(1)*A(3,3)+u0*A(3,1)]);
diffRe = abs((Re(1)-real(approx(1)))/Re(1))*100;
diffIm = abs((Im(1)-imag(approx(1)))/Im(1))*100;
fprintf('Relative error of the real parts = %.3f%%\n',diffRe)
fprintf('Relative error of the Imaginary parts = %.3f%%\n\n',diffIm)

%% Question 5
close all

dv =  [0,10,    0, -1.8563,  2.9477];
dp =  [0, 0, 0.15, -0.4185, -0.0063];
dr =  [0, 0,    0,  0.0311,  0.0758];
dphi= [0, 0,    0,  0.6148,  1.2431];

changes = [dv',dp',dr',dphi'];
names = ["Steady State","Case 1","Case 2","Case 3","Case 4"];


for i = 1:5
    CH = changes(i,:);
    tspan = [0 80];
    
    pos_N = 0; pos_E = 0; pos_D = 0; % m E frame
    u = 0; v = CH(1); w = 0; % m/s B frame
    y_trans = [pos_N; pos_E; pos_D; u; v; w];
    
    psi = 0; theta = 0; phi = CH(4); % rad
    p = CH(2); q = 0; r = CH(3); % rad/s B frame
    y_rot = [psi; theta; phi; p; q; r];
    
    y = [y_trans;y_rot];
    opt = odeset('maxstep',1);
    
    [t,pos] = ode45(@(t,y)linearized_Aircraft_ODE(t,y,A),tspan,y,opt);
    
    figure
    sgtitle(names(i))
    subplot(2,2,1)
    plot(t,pos(:,5),'r')
    title("Problem 4 Rotational Rates")
    ylabel('\Delta v (m/s)')
    grid on
    
    subplot(2,2,2)
    plot(t,pos(:,10),'b')
    ylabel('\Delta p (rad/s)')
    grid on
    
    subplot(2,2,3)
    plot(t,pos(:,12),'g')
    ylabel('\Delta r (rad/s)')
    xlabel('Time (s)')
    grid on
    
    subplot(2,2,4)
    plot(t,pos(:,9).*180./pi,'r')
    title("Problem 4 Orientation")
    ylabel("\Delta \phi (deg)")
    grid on
    
end

%% Functions Called
% The following functions were built and called as part of this assignment.
%
% <include>linearized_Aircraft_ODE.m</include>




%% ASEN 3111 - Computational Assignment 03 - Main
% Produces the lift coefficients and pressure distributions about four NACA
% airfoils and compares them to thin airfoils
%
%   Author: Samuel Razumovskiy
%   Collaborators: B.Smith
%   Date: 10/25/2019 (last revised: 11/7/2019)
%% (Knock knock) House keeping
clear,clc,close all
%% Problem 1

% Variations in N
Nset = [24,50,100,150];
% NACA airfoil parameters p, m, and t
m = 0;
p = 0;
t = 12;
c = 1;
alpha  = 0;
v_inf = 50;
tpl = false;
for i = 1:numel(Nset)
    N = Nset(i);
    M = N-2;
    
    [x,y] = NACA_Airfoils(m,p,t,c,N);
    cl(i) = Vortex_Panel(alpha,v_inf,c,x,y,M,tpl);
end

% N for accurate c_l
N = 500;
M = N-2;
[x,y] = NACA_Airfoils(m,p,t,c,N);
clIdeal = Vortex_Panel(alpha,v_inf,c,x,y,M,tpl);

error = abs(cl-clIdeal);
fprintf('The error for N panels of 25, 50, 100, and 150\n')
fprintf('with respect to an N panels 500 is\n')
format short g
disp(error')
fprintf('Since using N panels of 150 only comes to an error of about 1.32e4\n')
fprintf('I will continue to use an N of 150 for the rest of my calculations\n\n')

%% Problem 2
close all

% Variations in alpha
alphas = [-5,0,5,10];
N = 150;
M = N-2;
tpl = true;
figure
hold on
for i = 1:numel(alphas)
    alpha = alphas(i)*pi/180;
    [x,y] = NACA_Airfoils(m,p,t,c,N);
    cl(i) = Vortex_Panel(alpha,v_inf,c,x,y,M,tpl);
    
    title(sprintf('NACA %1.f%1.f%2.f Coefficient of Pressure Distribution',m,p,t))
    xlabel('x/c')
    ylabel('c_p')
    set(get(gca,'ylabel'),'rotation',0)
    leg{i} = sprintf('\\alpha=%1.f',alphas(i));
end
legend(leg)

%% Problem 3
close all

% Variations in m, p, and t for each NACA airfoil
ms = [0,2,4,2];
ps = [0,4,4,4];
ts = [12,12,12,24];

% Range of alphas
alphas = linspace(-4,10);
tpl = false;

figure
hold on
for i = 1:numel(ms)
    m = ms(i);
    p = ps(i);
    t = ts(i);
    [x,y,yc] = NACA_Airfoils(m,p,t,c,N);
    for j = 1:numel(alphas)
        alpha = alphas(j)*pi/180;
        [cl(j)] = Vortex_Panel(alpha,v_inf,c,x,y,M,tpl);
    end
    % Calculating the dz_dx
    dz_dx = (yc(2:end)-yc(1:end-1))./(x(2:N/2)-x(1:N/2-1));
    % Calculating theta 
    theta = acos(1-2*x(1:N/2)/c);
    % Finding the midpoints of theta
    thetamid = (theta(2:end)+theta(1:end-1))/2;
    % Calculating the thin airfoil alpha L=0
    thinalpha = 1/pi.*trapz(thetamid,dz_dx.*(cos(thetamid)-1));
    % Finding the slope and y intercept of the thick airfoil data
    fun = polyfit(alphas*pi/180,cl,1);
    % Finding the x intercept of the thick airfoil data
    alphal0 = (-fun(2)/fun(1));
    fprintf('NACA %1.f%1.f%2.f lift slope = %1.2f, alpha L=0 = %1.2f deg\n',m,p,t,fun(1),alphal0*180/pi)
    fprintf('Thin airfoil alpha L=0 = %1.2f\n',thinalpha*180/pi)
    plot(alphas,cl)
    leg{i} = sprintf('NACA %1.f%1.f%2.f',m,p,t);
end
title('Airfoil lift slopes')
xlabel('alpha (deg)')
ylabel('c_l')
set(get(gca,'ylabel'),'rotation',0)
legend(leg,'location','southeast')
fprintf('Thin airfoil lift slope is always 6.28\n\n')
fprintf(['The lift slope approximations are similar to the thick airfoils '...
    'but obviously smaller, since using a thick airfoil increases lift\n'])
fprintf(['While the alpha L=0 is almost exactly the same, which makes sense'...
    'since the alpha L=0 really only depends on the camber'])

%% Functions Called
% The following functions were built and called as part of this assignment.
%
% <include>NACA_Airfoils.m Vortex_Panel.m</include>








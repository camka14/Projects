%                                   ASEN 3112
%                            Airplane Shaker - Lab 3
%
%
%   Author: Brandon Torczynski
%  Created: 4/14/2020
% Modified: 4/16/2020

% Housekeeping
clc
clear variables;
clear workspace; 
close all
%%
% Freq: 2-50 hz Lin Sweep
% CH0 - Shaker center  (measure of forcing function)
% CH1 - tail     - 11"   from center
% CH2 - nose     - 10.5" from center
% CH3 - wingtip  - 8.5"  from center

% load data
data = load('5mincenter_renamed.txt'); 

%% Parse data
t = data(:,1);         % time [s]
Acc_0  = data(:,2);    % mm/s^2
Acc_1  = data(:,3);    % mm/s^2
Acc_2  = data(:,4);    % mm/s^2
Acc_3  = data(:,5);    % mm/s^2 
% Displacements
dx_0   = data(:,6);    % mm  (vertical disp.)
dx_1   = data(:,7);    % mm  (vertical)
dx_2   = data(:,8);    % mm  (vert)
dx_3   = data(:,9);    % mm  (vert)
dx_laser = data(:,10); % mm  (horizontal)

%% Given dimensions
% Span
S_fus  = 22; % Fuselage span  [in]
S_wing = 18; % Eing span      [in]
L   = 12;    % End-shaker to start-tail span [in]
L_E = 4.5;   % Elevator span  [in]
L_R = 5;     % Rudder span    [in]
% Beam cross section
w   = 1;     % Width (all members) [in]
h   = 1/8;   % Thickness of fuselage and wing [in]
h_E = 1/4;   % Elevator thickness  [in]
h_R = 0.040; % Rudder thickness   [in]
% Material 
E = 10175000;    % Elastic modulus [lb/in^2]
rho = 0.0002505; % Mass density    [lb s^2/in^4]

%% Plot Experimental Data
figure(1)
hold on
set(gcf, 'Units', 'Normalized', 'OuterPosition', [.3 .2 .7 .8]);

subplot(5,1,1)
hold on
plot(t,dx_0,'b-') % Control table (Forcing function)
title('Vertical displacement ', 'fontsize',14);
legend('Shaker Table')
xlabel('Time, s','fontsize',12);
ylabel('mm', 'interpreter','latex','fontsize',14); 

subplot(5,1,2)
hold on
plot(t,dx_1,'r-')
legend('Tail')
xlabel('Time, s','fontsize',12);
ylabel('mm', 'interpreter','latex','fontsize',14); 

subplot(5,1,3)
hold on
plot(t,dx_2,'r-')
legend('Nose')
xlabel('Time, s','fontsize',12);
ylabel('mm', 'interpreter','latex','fontsize',14);

subplot(5,1,4)
hold on
plot(t,dx_3,'r-')
legend('Wingtip')
xlabel('Time, s');
ylabel('mm', 'interpreter','latex','fontsize',14); 

subplot(5,1,5)
hold on
plot(t,dx_laser)
legend('Laser data')
xlabel('Time, s','fontsize',14);
ylabel('mm','fontsize',14); 
title('Horizontal Displacement')

sgtitle('Experimental Data')
hold off

%%
figure(2)
hold on
set(gcf, 'Units', 'Normalized', 'OuterPosition', [.3 .2 .7 .8]);

subplot(4,1,1)
hold on
plot(t,Acc_0,'b-') % Control table (Forcing function)
title(' Acceleration ', 'fontsize',14);
legend('Shaker Table')
xlabel('Time, s','fontsize',12);
ylabel('$\frac{mm}{s^2}$', 'interpreter','latex','fontsize',16); 

subplot(4,1,2)
hold on
plot(t,Acc_1,'r-')
legend('Tail')
xlabel('Time, s','fontsize',12);
ylabel('$\frac{mm}{s^2}$', 'interpreter','latex','fontsize',16); 

subplot(4,1,3)
hold on
plot(t,Acc_2,'r-')
legend('Nose')
xlabel('Time, s','fontsize',12);
ylabel('$\frac{mm}{s^2}$', 'interpreter','latex','fontsize',16); 

subplot(4,1,4)
hold on
plot(t,Acc_3,'r-')
legend('Wingtip')
xlabel('Time, s','fontsize',12);
ylabel('$\frac{mm}{s^2}$', 'interpreter','latex','fontsize',16); 

sgtitle('Experimental Data')
hold off


%% Master mass and stiffness matrices
Area = w*h;
I_zz = (w*h^3)/12;

CM_2 = rho*Area*L/100800; 
C_K2 = 4*E*I_zz/L^3;

% Lumped values 
M_T = 1.1310*rho; % in^3 rho
S_T = 0.5655*rho; % in^4 rho
I_T = 23.124*rho; % in^5 rho

M2 = CM_2* [19272   1458*L   5928    -642*L     0       0;
            1458*L  172*L^2  642*L   -73*L^2    0       0;
            5928    642*L    38544     0      5928    -642*L;
            -642*L  -73*L     0     344*L^2   642*L    -73*L^3;
            0       0       5928    642*L    19272    -1458*L;
            0       0      -642*L   -73*L^2   -1458*L  172*L^2] ...        
       + [0  0  0  0   0   0;
          0  0  0  0   0   0;
          0  0  0  0   0   0;
          0  0  0  0   0   0;
          0  0  0  0  M_T  S_T;
          0  0  0  0  S_T  I_T];
      
K2 = C_K2* [24  6*L   -24  6*L    0   0;
            6*L 2*L^2 -6*L L^2    0   0;
            -24 -6*L    48  0     -24  6*L;
            6*L L^2    0   4*L^2 -6*L L^2;
            0   0     -24 -6*L    24 -6*L;
            0   0      6*L L^2   -6*L 2*L^2];
         
% Code modified from FEMcodeLab3.m 
%% Two finite element model 
% Reduced matrices - remove fixed end
M2 = M2(3:end, 3:end); % 4x4
K2red = K2(3:end, 3:end); % 4x4

% Eigen vectors and values 
[V, D] = eig(M2^-(1) *K2red); % Eqn. 3
omega = D; 
omega = sqrt(sum(omega))'; % Freq. [8x1]
freq = length(omega);

fprintf('------------ Two Finite Element Model ----------------');
fprintf('\n');
% Report smallest frequency  (f_i = w_i/2pi )
for i = freq:-1:(length(omega)-2)
    f = omega(i)/(2*pi);
    fprintf('Frequency %d: %f Hz \n', (freq-i+1), f);
    fprintf('U:');
    disp(V(:, i));
    
end

omega=real(sqrt(diag(D)));

[frq,isx]=sort(1/2/pi*omega);

ev_red=V(:,isx);

ev=0*K2;
ev(3:end,3:end)=ev_red;

nsub=10;
scale=1.0;

ne = 2;
nv=ne*nsub+1;
Le=L/ne;
dx=Le/nsub;

figure
for t=3:5 %size(ev,2)
    
    k=0;
    x=zeros(nv,1);
    v=zeros(nv,1);
    
    for e=1:ne
        
        xxi=Le*(e-1);
        vi=ev(2*e-1,t);
        teti=ev(2*e,t);
        vj=ev(2*e+1,t);
        tetj=ev(2*e+2,t);
        
        if (e==1); ni=0;else; ni=1;end
        
        for n=ni:nsub
            
            xk=xxi+dx*n;
            xi=(2*n-nsub)/nsub;
            vk=scale*(0.125*(4*(vi+vj)+2*(vi-vj)*(xi^2-3)*xi+Le*(xi^2-1)*(tetj-teti+(teti+tetj)*xi)));
            
            k=k+1;
            x(k)=xk;
            v(k)=vk;
        end
    end
    if(t==3)
        s = 47;
    elseif(t==4)
        s = 37;
    else
        s = 80;
    end
    plot(x,v*s); hold on;
    legend('Mode 1 exp','Mode 2 exp','Mode 3 exp','Mode 1 any','Mode 2 any','Mode 3 any')
    title('Experimental/Snalytical 2-Element Model')
end
FEMcodeLab3(2)
%% Four-Element Model
C_M4 = (rho*Area*L)/806400;
C_K4 = (8*E*I_zz)/L^(3);
Area = w*h; 
I_zz = (w*h^3)/12;

% Master mass matrix
M_4 = C_M4 * [77088   2916*L   23712   -1284*L         0       0         0    0    0    0;
            2916*L  172*L^(2)  1284*L   -73*L^(2)      0       0         0    0    0    0;
            23712   1284*L   154176       0        23712    -1284*L      0    0    0    0;
           -1284*L -73*L^(2)      0      344*L^(2)  1284*L  -73*L^(2)    0    0    0    0;
            0         0       23712      1284*L     154176     0      23712 -1284*L 0   0;
            0         0      -1284*L   -73*L^(2)      0     344*L^(2)  1284*L   -73*L^(2)  0   0;
            0         0         0       0        23712    1284*L   154176    0       23712  -1284*L;
            0         0         0       0       -1284*L  -73*L^(2)   0       344*L^(2) 1284*L -73*L^(2);
            0         0         0       0        0        0      23712    1284*L  77088  -2916*L;
            0         0         0       0        0        0     -1284*L   -73*L^(2) -2916*L  172*L^(2)] ...
    + [0  0  0 0 0 0 0 0 0 0;
      0  0  0 0 0 0 0 0 0 0;
      0  0  0 0 0 0 0 0 0 0;
      0  0 0 0 0 0 0 0 0 0;
      0  0 0 0 0 0 0 0 0 0;
      0  0 0 0 0 0 0 0 0 0;
      0  0 0 0 0 0 0 0 0 0;
      0  0 0 0 0 0 0 0 0 0;
      0  0  0 0 0 0 0 0  M_T  S_T;
      0  0 0 0 0 0 0 0 S_T  I_T];


% Master stiffness matrix
K_4 = C_K4* [96    12*L   -96   12*L  0    0      0     0     0     0;
           12*L  2*L^2  -12*L L^2    0    0      0     0     0     0;
           -96   -12*L    192   0    -96   12*L   0     0     0     0;
            12*L  L^2    0    4*L^2 -12*L L^2    0     0     0     0;
            0    0     -96  -12*L   192  0     -96    12*L  0     0;
            0    0      12*L L^2    0    4*L^2 -12*L  L^2   0     0;
            0    0     0    0     -96  -12*L   192   0     -96   12*L;
            0    0     0    0      12*L L^2    0     4*L^2 -12*L  L^2;
            0    0     0    0      0    0     -96   -12*L   96  -12*L;
            0    0     0    0      0    0      12*L  L^2   -12*L  2*L^2];
        
M_4 = M_4(3:end, 3:end);
K_4red = K_4(3:end, 3:end);

[V4, D4] = eig(M_4^-(1) * K_4red);
omega = D4; 
omega = sqrt(sum(omega))'; % Freq. [8x1]
% disp(omega)

freq = length(omega);
fprintf('\n');
fprintf('-------------- 4 Element Model  ----------------');
fprintf('\n');
fprintf('\n');

%   i = 8:-1:6
for j = freq:-1:(length(omega)-2) 
    f = omega(j)/(2*pi);
    fprintf('Frequency %d: %f Hz \n', (freq-j+1), f);
    fprintf('\n');
    
    fprintf('U: ');
    disp(V4(:, j));
end
% u = [v1 01 v2 02 v3 03 v4 04 v5 05] where v3 03 are fixed
omega=real(sqrt(diag(D4)));

[frq,isx]=sort(1/2/pi*omega);

ev_red=V4(:,isx);

ev=0*K_4;
ev(3:end,3:end)=ev_red;

nsub=10;
scale=1.0;

ne = 4;
nv=ne*nsub+1;
Le=L/ne;
dx=Le/nsub;

figure
for t=3:5 %size(ev,2)
    
    k=0;
    x=zeros(nv,1);
    v=zeros(nv,1);
    
    for e=1:ne
        
        xxi=Le*(e-1);
        vi=ev(2*e-1,t);
        teti=ev(2*e,t);
        vj=ev(2*e+1,t);
        tetj=ev(2*e+2,t);
        
        if (e==1); ni=0;else; ni=1;end
        
        for n=ni:nsub
            
            xk=xxi+dx*n;
            xi=(2*n-nsub)/nsub;
            vk=scale*(0.125*(4*(vi+vj)+2*(vi-vj)*(xi^2-3)*xi+Le*(xi^2-1)*(tetj-teti+(teti+tetj)*xi)));
            
            k=k+1;
            x(k)=xk;
            v(k)=vk;
        end
    end
    if(t==3)
        s = -55;
    elseif(t==4)
        s = -54;
    else
        s = -100;
    end
    plot(x,v*s); hold on;
    legend('Mode 1 exp','Mode 2 exp','Mode 3 exp','Mode 1 any','Mode 2 any','Mode 3 any')
    title('Experimental/Snalytical 4-Element Model')
end
FEMcodeLab3(4)

%% Q3 analytical plot

%---------------------------------------------------------------------
%% Question 1 plot response as function of excitation freq. 











          
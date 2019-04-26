%%% Closed Loop System (Stiff Bar)
clc
clear
close all
Kp = 50;
Kd = 1.5;

Kg = 33.3; % Gear ratio
Km = .0401; %V/rad/s
Rm = 19.2; %Ohms
J = .0005 + .0015; % Kg-m^2
n1 = Kp.*Kg.*Km./(J.*Rm);
num = n1;
d2 = 1;
d1 = Kg.^2.*Km.^2./(J.*Rm)+Kd.*Kg.*Km./(J.*Rm);
d0 = Kp.*Kg.*Km./(J.*Rm);

den = [d2 d1 d0];
sysTF = tf(num,den);

[xEx,tEx,vInExp] = fileRead('Kp_48.csv');
tEx = (tEx - min(tEx))./ 1000;
ind1 = find(xEx(1:1000)<-.17, 1, 'last');
ind2 = find(tEx<0.3,1,'last') + ind1;
xEx = xEx(ind1:ind2);
tEx = tEx(ind1:ind2) - tEx(ind1);



%%% Step Response
[x,t] = step(sysTF);
thetad = 0.17;
theta = 2*thetad*x-thetad;

setTRigid = t(find(x < thetad*(1-0.05),1,'last'));

vIn = Kp*(thetad-theta)-Kd*gradient(theta)./gradient(t);

figure(1)
hold on
plot(tEx,xEx)
plot(t,theta)
% figure(3)
% hold on
% plot(vIn)
% plot(vInExp(ind1:ind2))
title('Kp variations Kd = 1.5')
xlabel('Time(s)');ylabel('Angle (rad)');

%%% Closed Loop System (Flexible Bar)

K1 = 10;
K2 = -10;
K3 = 1.5;
K4 = 1.5;
Kg = 33.3; % Gear ratio
Km = .0401; % V/rad/s
Rm = 19.2; % Ohms
Jh = .0005; % Kg-m^2
Ja = .004; % Kg-m^2
Jm = .01; % Kg-m^2
Jl = Ja + Jm; 
fc = 1.8; % Hz
Ka = (2*pi*fc)^2*Jl;
L = .45; % m

p1 = -Kg^2*Km^2/(Jh*Rm);
p2 = Kg^2*Km^2*L/(Jh*Rm);
q1 = Ka/(L*Jh);
q2 = -Ka*(Jh+Jl)/(Jl*Jh);
r1 = Kg*Km/(Jh*Rm);
r2 = -Kg*Km*L/(Jh*Rm);
lambda3 = -p1 + K3*r1 + K4*r2;
lambda2 = -q2 + K1*r1 + K2*r2 + K4*(p2*r1 - r2*p1);
lambda1 = p1*q2 - q1*p2 + K3*(q1*r2 - r1*q2) + K2*(p2*r1 - r2*p1);
lambda0 = K1*(q1*r2 - r1*q2);

n22 = K2*r2;
n21 = K2*(p2*r1 - r2*p1);
n20 = 0;
num2 = [n22 n21 n20];
d24 = 1;
d23 = lambda3;
d22 = lambda2;
d21 = lambda1;
d20 = lambda0;
den2 = [d24 d23 d22 d21 d20];
sysTF2 = tf(num2,den2);

%%% Step Response (Displacement)
[x2,t2] = step(sysTF2);
thetad = 0.2;
x2 = 2*thetad*x2;
figure(2);
% plot(t2,x2);
% xlabel('Time(s)');ylabel('Angle (rad)');
hold on

n12 = K1*r1;
n11 = 0;
n10 = K1*(q1*r2 - r1*q2);
num1 = [n12 n11 n10];
d14 = 1;
d13 = lambda3;
d12 = lambda2;
d11 = lambda1;
d10 = lambda0;
den1 = [d14 d13 d12 d11 d10];
sysTF1 = tf(num1,den1);

%%% Step Response (Deflection)
[x1,t1] = step(sysTF1);
thetad = 0.2;
x1 = 2*thetad*x1-thetad;

[xF,tF,~,tip] = fileRead('Flexy_second.csv');
tF = (tF - min(tF))./ 1000;
ind1 = find(xF(3000:5000)<-.19, 1, 'last')+3000;
ind2 = find(tF<1.2,1,'last') + ind1;
xF = xF(ind1:ind2);
tF = tF(ind1:ind2) - tF(ind1);


overshoot = (max(x1)-0.4)/0.2;
setT = t1(find(x1 > thetad*(0.05+1),1,'last'));

plot(t1,x1);
% legend('Deflection', 'Displacement');
plot(tF,xF)
% plot(tF,tip(ind1:ind2))

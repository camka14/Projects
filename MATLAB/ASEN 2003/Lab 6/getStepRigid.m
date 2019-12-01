function [t,theta] = getStepRigid(Kp,Kd,thetad)
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

[x,t] = step(sysTF);
theta = 2*thetad*x-thetad;
function [t1,x1,t2,x2] = getStepFlexy(K1,K2,K3,K4,thetad)

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
x2 = 2*thetad*x2;

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
x1 = 2*thetad*x1-thetad;
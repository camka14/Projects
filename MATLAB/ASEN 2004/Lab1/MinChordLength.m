clear,clc,close all

W = 0.06;
rho = .5258;
V = 6;
b = 0.9;
e0 = 0.97;
chord = linspace(0.03,.1);
S = b.*chord;
AR = b^2./S;

k = 1./(pi*e0.*AR);

CL = W./(.5*rho*V^2.*S);

CD0 = k.*CL.^2;
[max, I] = max(CLCD0);

chord(I)
max
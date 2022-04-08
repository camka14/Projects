clear,clc
T = 18.2;
theta = 45;
rho = 1000;
S = 0.0411;
L = 0.22;
v = 1.307e-6;
V = linspace(3,20,500);
i = 1;

R = V.*L./v;
Cf = 0.075./(log10(R)-2).^2;
D = .5.*rho.*V.^2.*S.*Cf;

D = abs(D-T*cosd(45));
[min,I] = min(D);

V(I)
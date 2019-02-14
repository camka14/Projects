clear,clc

V = 0:500;
W = 3000;
eo = .91;
AR = 6.2;
S = 181;
rho = linspace(2.3769*10^-3,2.4824*10^-4,4);
Cd0 = 0.027;
k = 1/(pi*eo*AR);

Pr = 53.1*550.*sqrt(rho(1)./rho);
Pa = 550*345*.83.*(rho./rho(1));

ROC = (Pr-Pa)./W;

[min, i] = min(abs(ROC));

rho(i)

hold on
plot(rho,ROC)
title("Absolute Service Ceiling")
ylabel("Rate of Climb (ft/s)")
xlabel("Air Density (slug/ft^3)")
clear,clc

V = 0:500;
W = 3000;
eo = .91;
AR = 6.2;
S = 181;
rho = 2.3769*10^-3;

Cd0 = 0.027;

k = 1/(pi*eo*AR);

CL = W./(1/2*rho.*V.^2);

CD = Cd0 + k.*CL.^2;

Pr = 1.2*(1/2.*rho.*S.*Cd0 + (1/2.*rho.*S.*(W./(1/2.*rho.*V.^2.*S)).^2/(pi.*eo.*AR))).*V.^3/550;

Pa = 345*.83;

V(Pr<Pa);

hold on
plot(V,Pr)
plot([0 500], [Pa Pa])
ylim([0 Pa*1.1])
title("Power vs. Velocity @ 12,000ft")
ylabel("Power (lb*ft/s)")
xlabel("Velocity (ft/s)")
legend("Power Required","Power Available","location","southeast")
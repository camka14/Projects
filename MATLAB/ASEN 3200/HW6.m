clear,clc,close all

mu = 398600;
a = (2*3600/(2*pi))^(1/3)*mu;
T = 2*pi*sqrt(mu/a^3);
t = T/4;
x0 = 87.5;
y0 = 75;
z0 = 0;
x0_d = 0.1;
y0_d = -3;
z0_d = 0;

[dV0,dVf,vf] = CWdv(x0,y0,z0,x0_d,y0_d,z0_d,mu,a,t);


function [r,v] = CWt(x0,y0,z0,x0_d,y0_d,z0_d,mu,a,t)

r0 = [x0;y0;z0];
v0 = [x0_d;y0_d;z0_d];
n = sqrt(mu/a^3);
phirr = [4-3*cos(n*t), 0, 0; 6*(sin(n*t)-n*t), 1, 0; 0, 0, cos(n*t)];
phirv = [1/n*sin(n*t), 2/n*(1-cos(n*t)), 0; 2/n*(cos(n*t)-1), 4/n*sin(n*t)-3*t, 0; 0, 0, 1/n*sin(n*t)];
phivr = [3*n*sin(n*t), 0, 0; 6*n*(cos(n*t)-1), 0, 0; 0, 0, -n*sin(n*t)];
phivv = [cos(n*t), 2*sin(n*t), 0; -2*sin(n*t), 4*cos(n*t)- 3, 0; 0, 0, cos(n*t)];

r = phirr*r0+phirv*v0;
v = phivr*r0+phivv*v0;
end

function [dV0,dVf,vf] = CWdv(x0,y0,z0,x0_d,y0_d,z0_d,mu,a,t)

r0 = [x0;y0;z0];
v0 = [x0_d;y0_d;z0_d];
n = sqrt(mu/a^3);
phirr = [4-3*cos(n*t), 0, 0; 6*(sin(n*t)-n*t), 1, 0; 0, 0, cos(n*t)];
phirv = [1/n*sin(n*t), 2/n*(1-cos(n*t)), 0; 2/n*(cos(n*t)-1), 4/n*sin(n*t)-3*t, 0; 0, 0, 1/n*sin(n*t)];
phivr = [3*n*sin(n*t), 0, 0; 6*n*(cos(n*t)-1), 0, 0; 0, 0, -n*sin(n*t)];
phivv = [cos(n*t), 2*sin(n*t), 0; -2*sin(n*t), 4*cos(n*t)- 3, 0; 0, 0, cos(n*t)];

v0pos = -inv(phirv)*phirr*r0;
vfneg = phivr*r0+phivv*v0pos;
dV0 = v0pos-v0;
dVf = -vfneg;
vf = phivr*r0+phivv*v0;

end
clear,clc,close all

beta = 100; % attenuation dB
n = 1; % refractive index
omega = 2*pi*3e9; % rad/s
re = 2.82e-15; % m
ro = 1.52e-10; % m
k = 1.38e-23; % boltzmann's constant
No = 2.7e25; % molecules/m^3
T = 299; % K
mu = (1.661e-27*9.109e-31)/(1.661e-27+9.109e-31);

fc = sqrt(beta*omega^2/(1.2e-7)*No*(re+ro)^2*sqrt(8*pi*k*T/mu));
N = beta*omega^2/(1.2e-7*fc*1);
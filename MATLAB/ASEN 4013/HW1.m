%% 1.23 a 

clear,clc, close all

W = 200000; % N
H = 9000; % m
theta = 0.7973;
delta = 0.304;
RHO = 1.225*(delta/theta);
A = 340.3*sqrt(theta);
S = 60; % m^2
K1 = 0.2;
g0 = 9.81;
convF = 28.325/1e6;
M = [0.7:0.0001:0.8,0.8:0.0001:1.4];
Cd0 = [ones(1,length(0.7:0.0001:0.8)).*0.012,linspace(0.012,0.0275,length(0.8:0.0001:1.4))];

V = A.*M;
Cl = W*2./(RHO.*V.^2.*S);
Cd = K1.*Cl.^2 + Cd0;
TSFC = (.9 + 0.3.*M).*sqrt(theta)*convF;
Cl_Cd = Cl./Cd;
EF = Cl./(Cd.*TSFC)*1/g0;
RF = (Cl./Cd).*(V./TSFC)*1/g0;

[maxCl_Cd, i] = max(Cl_Cd);
[maxEF, j] = max(EF);
[maxRF, k] = max(RF);

disp('a)')
fprintf('Max Cl/Cd: %f\n', maxCl_Cd)
fprintf('Max Cl: %f\n', Cl(i))
fprintf('Max Cd: %f\n', Cd(i))
fprintf('Mach: %f\n', M(i))

%% 1.23 b
M2 = [0.74, 0.76, 0.78, 0.8, 0.81, 0.82];
Cd0 = [0.012, 0.012, 0.012, 0.012, 0.0121, 0.0122];

V = A.*M2;
Cl = W*2./(RHO.*V.^2.*S);
Cd = K1.*Cl.^2 + Cd0;
TSFC = (0.9 + 0.3.*M2).*sqrt(theta)*convF;
Cl_Cd = Cl./Cd;
EF = Cl./(Cd.*TSFC)*1/g0/3600;
RF = (Cl./Cd).*(V./TSFC)*1/g0/1000;
D = 1/2*RHO.*V.^2*S.*Cd/1000;

disp('b)')
fprintf('Cl:')
disp(Cl)
fprintf('Cd:')
disp(Cd)
fprintf('Cl/Cd:')
disp(Cl_Cd)
fprintf('RF:')
disp(RF)
fprintf('EF:')
disp(EF)
fprintf('D:')
disp(D)

%% 1.23 c
disp('c)')
fprintf('Max RF: %f\n', maxRF)
fprintf('Max RF mach: %f\n', M(k))
disp('d)')
fprintf('Max EF: %f\n', maxEF)
fprintf('Max EF mach: %f\n', M(j))
clear,clc,close all

data = xlsread('WTdata_group5.csv');
rho = data(:,3);
V = data(:,4);
Q = data(:,5);
drag = data(:,end-3);


cd = drag./(1/2.*rho.*V.^2.*pi*0.0508^2);
Cd = mean(cd)
figure(1)
plot(drag)
figure(2)
plot(V)
figure(3)
plot(rho)
figure(4)
plot(Q)
figure(5)
plot(cd)
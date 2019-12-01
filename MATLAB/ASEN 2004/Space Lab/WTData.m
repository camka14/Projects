clear,clc,close all

data = xlsread('WTDataTa1.csv');
rho = data(21:80,3);
V = data(21:80,4);
Q = data(21:80,5);
drag = data(21:80,end-3);

cd = drag./(1/2.*rho.*V.^2.*pi*0.0508^2);
Cd(1) = mean(cd);
stanDev= std(cd);

data = xlsread('WTDataTa2.csv');
rho = data(41:100,3);
V = data(41:100,4);
Q = data(41:100,5);
drag = data(41:100,end-3);


cd = drag./(1/2.*rho.*V.^2.*pi*0.0508^2);
Cd(2) = mean(cd);
stanDev= std(cd);

data = xlsread('WTDataTa3.csv');
rho = data(21:80,3);
V = data(21:80,4);
Q = data(21:80,5);
drag = data(21:80,end-3);


cd = drag./(1/2.*rho.*V.^2.*pi*0.0508^2);
Cd(3) = mean(cd);
stanDev= std(cd);

Cd = mean(Cd)

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
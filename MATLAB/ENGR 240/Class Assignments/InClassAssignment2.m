clear,clc
sigma0=12000;
K=9600;
d=[.1:.1:10];
sigma=HallPetch(sigma0,K,d);
figure
plot(d,sigma)
title('Yield strength of a metal')
xlabel('Diameter(mm)')
ylabel('Yield(psi)')
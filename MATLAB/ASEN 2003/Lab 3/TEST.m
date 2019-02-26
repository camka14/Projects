clear,clc,close all

r = 77;
d = 154;
l = 255;
w = 20;

theta = linspace(0,18*pi,500);

V = LCSMODEL(r,d,l,theta,w);

figure(1)
hold on
plot(theta*180/pi,V)
title('Velocity vs. Angle Test')
xlabel('Angle (deg)')
ylabel('Velocity (cm/s)')
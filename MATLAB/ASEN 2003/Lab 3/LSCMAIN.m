%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Group Names:
% 1. Samuel Razumovskiy
% 2. E Forest Owen
% 3. Robert Redfern
% 4. Sam D'souza
% 
% Author: Samuel Razumovskiy
%
% Purpose: To calculate the velocity and the force exerted on a roller 
% coaster cart as a function of the distance along the track.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear,clc,close all

%% Test Case

r = 60;
d = 140;
l = 300;
w = 20;

theta = linspace(0,18*pi,500);

V = LCSMODEL(r,d,l,theta,w);

figure(1)
hold on
plot(theta*180/pi,V)
title('Velocity vs. Angle Test')
xlabel('Angle (deg)')
ylabel('Velocity (cm/s)')

%% Experimental Comparison

r = 77;
d = 154;
l = 255;
data1 = 'Lab3 7V.csv';
data2 = 'Lab3 9V.csv';
data3 = 'Lab3 11V.csv';

[theta1,w1,v_exp1] = LCSDATA(data1);
[theta2,w2,v_exp2] = LCSDATA(data2);
[theta3,w3,v_exp3] = LCSDATA(data3);

[v1,v_exp1,theta1,errorcalc1,diff1] = getDataOut(r,d,l,theta1,w1,v_exp1);
[v2,v_exp2,theta2,errorcalc2,diff2] = getDataOut(r,d,l,theta2,w2,v_exp2);
[v3,v_exp3,theta3,errorcalc3,diff3] = getDataOut(r,d,l,theta3,w3,v_exp3);

figure(2)
hold on
ylim([-200 250])
xlim([0 5000])
plot(theta1*180/pi,v1)
plot(theta1*180/pi,v_exp1,"--")
title('Velocity vs. Angle Exp 1.')
xlabel('Angle (deg)')
ylabel('Velocity (cm/s)')
legend('Model','Experimental')

figure(3)
hold on
ylim([-200 250])
xlim([0 5000])
plot(theta2*180/pi,v2)
plot(theta2*180/pi,v_exp2,"--")
title('Velocity vs. Angle Exp 2.')
xlabel('Angle (deg)')
ylabel('Velocity (cm/s)')
legend('Model','Experimental')

figure(4)
hold on
ylim([-200 250])
xlim([0 5000])
plot(theta3*180/pi,v3)
plot(theta3*180/pi,v_exp3,"--")
title('Velocity vs. Angle Exp 3.')
xlabel('Angle (deg)')
ylabel('Velocity (cm/s)')
legend('Model','Experimental')

figure(5)
plot(theta1*180/pi,diff1)
title('Difference Exp 1.')
xlabel('Angle (deg)')
ylabel('% error')

figure(6)
plot(theta2*180/pi,diff2)
title('Difference Exp 2.')
xlabel('Angle (deg)')
ylabel('% error')

figure(7)
plot(theta3*180/pi,diff3)
title('Difference Exp 3.')
xlabel('Angle (deg)')
ylabel('% error')
clear,clc,close all

r = 77;
d = 154;
l = 255;
data = csvread('Lab3 7V.csv',1,0);
theta = data(:,2);
theta = (theta-theta(1)+mod(theta(1),360))*pi/180;
w = data(:,4).*pi/180;
v = data(:,5);



v_exp = LCSMODEL(r,d,l,theta,w);
v = v*.1;
v_exp = v_exp*.1;
diff = abs(v-v_exp);
hold on
plot(theta*180/pi,v)
plot(theta*180/pi,v_exp)
function isTrue = throwBall_func(v,theta,maxTime)
% Name: Samuel Razumovskiy
% ID: 109343605
% Course: CSCI 1320-100
% Recitation: 108
% Lab: 2
h = 1.5;
g = 9.8;
t = linspace(0,maxTime,10000);
x = v*cosd(theta).*t;
y = h+v*sind(theta).*t-1/2*g.*t.^2;
if find(y<0,1); %Finds the value of x when y is negative
    isTrue = true;
else
    isTrue = false;
end
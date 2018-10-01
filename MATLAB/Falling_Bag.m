clear,clc
x=1;
theta=[0:5:90];
for angle=theta
v(x,1)=sqrt(98.1*sind(angle));
T(x,1)=196.2*sind(angle)+98.1*sind(angle);
x=x+1;
end
plot(theta,v)
xlabel 'Theta (degree)'
ylabel 'Velocity (m/s)'
title 'Velocity vs. Angle'
figure
plot(theta,T)
xlabel 'Theta (degree)'
ylabel 'Tension (N)'
title 'Tension vs. Angle'
clear, clc
disp('Exercise 1')
a=[15,3,22;3,8,5;14,3,82]
b=[1;5;6]
c=[12,18,5,2]
disp('Create a matrix called d from third column of amtrix a')
d=a(:,3)
disp('Combine matrix b and matrix d to create matrix e')
e=[b,d]
disp('Combine matrix b and matrix d to createe matrix f')
f=[b;d]
disp('creat matrix g from matrix a and the first three elements of matrix c')
g=[a;c(1:3)]
disp('create matrix h with the first element equal to a1,3, the second element equal to c1,2, and the third element equal to b2,1')
h=[a(1,3),c(1,2),b(2,1)]

disp('Exercise 2')
g=9.81; %m/s^2
v1=100; %m/s
v2=50; %m/s
v3=25; %m/s
theta=[0:0.05:pi/2];
R1=(v1^2/g).*sin(2.*theta);
R2=(v2^2/g).*sin(2.*theta);
R3=(v3^2/g).*sin(2.*theta);
plot(theta,R1,'o',theta,R2,'+',theta,R3,'x')
xlabel('Angle')
ylabel('Range')
title('Range of projectile')
legend 'v1=100' 'v2=50' 'v3=25'
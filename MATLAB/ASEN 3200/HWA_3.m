clear,clc

theta3 = 60;
theta2 = -30;
theta1 = 120;
R3T3 = [cosd(theta3),sind(theta3),0;-sind(theta3),cosd(theta3),0;0,0,1];
R1T2 = [1,0,0;0,cosd(theta2),sind(theta2);0,-sind(theta2),cosd(theta2)];
R3T1 = [cosd(theta1),sind(theta1),0;-sind(theta1),cosd(theta1),0;0,0,1];

Q = R3T3*R1T2*R3T1;

[v,e] = eig(Q);

phi = acosd(real(e(1)));

u = Q*v(:,3);

nu = sind(phi/2)*u;

ep = cosd(phi/2);

q = [nu;ep];

theta1 = 60;
theta2 = -30;
theta3 = 120;
R3T3 = [cosd(theta3),sind(theta3),0;-sind(theta3),cosd(theta3),0;0,0,1];
R2T2 = [cosd(theta2),0,-sind(theta2);0,1,0;sind(theta2),0,cosd(theta2)];
R1T1 = [1,0,0;0,cosd(theta1),sind(theta1);0,-sind(theta1),cosd(theta1)];

Q = R3T3*R2T2*R1T1;

[v,e] = eig(Q);

phi = acosd(real(e(1)));

u = Q*v(:,3);

nu = sind(phi/2)*u;

ep = cosd(phi/2);

q = [nu;ep];

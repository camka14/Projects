clear,clc,close all

mu = 132712000000;
r1 = [-1.05e8,1.579e8,-1.52e5];
r2 = [-1.461e8,1.081e8,-2.265e5];
r3 = [-1.652e8,4.25e7,-2.673e5];

r1m = norm(r1);
r2m = norm(r2);
r3m = norm(r3);

N = r1m*cross(r2,r3)+r2m*cross(r3,r1)+r3m*cross(r1,r2);
D = cross(r1,r2)+cross(r2,r3)+cross(r3,r1);
S = r1*(r2m-r3m)+r2*(r3m-r1m)+r3*(r1m-r2m);

Nm = norm(N);
Dm = norm(D);

v1 = sqrt(mu/(Nm*Dm))*(cross(D,r1)/r1m+S);
v2 = sqrt(mu/(Nm*Dm))*(cross(D,r2)/r2m+S);
v3 = sqrt(mu/(Nm*Dm))*(cross(D,r3)/r3m+S);

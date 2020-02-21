clear,clc,close all

mu = 132712000000;
r1 = [0.5887,-0.2206,0.0239]*1.496e8;
r2 = [0.5027,0.2289,0.0436]*1.496e8;
r3 = [0.3243,0.4560,0.0453]*1.496e8;

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

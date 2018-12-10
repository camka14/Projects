clear,clc
g = 9.81;
m1 = 3;
m2 = 4;
m3 = 1.2;
k1 = 35;
k2 = 20.5;
k3 = 10;
k4 = 25;

kmat = [(k1 + k2 + k3), -k3, 0;
        -k3, k3+k4, -k4;
        0, -k4, k4];
mmat = [m1*g;m2*g;m3*g];

ansmat = kmat\mmat;


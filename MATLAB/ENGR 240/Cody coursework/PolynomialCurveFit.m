clear,clc
% [c1, c2, c4]

T=[0     5    10    20    30    40    50    60    70    80    90   100];
T=T+273.15;
T=T./273.15
mu=log([1.787e-3   1.519e-3   1.307e-3   1.002e-3   7.975e-4   6.529e-4   5.468e-4   4.665e-4   4.042e-4   3.547e-4   3.147e-4   2.818e-4]./1.787e-3);
A=[12, sum(T),sum(T.^2);sum(T),sum(T.^2),sum(T.^3);sum(T.^2),sum(T.^3),sum(T.^4)]
B=[sum(mu),sum(T.*mu),sum(T.^2.*mu)];
format long
Ci=A\B'
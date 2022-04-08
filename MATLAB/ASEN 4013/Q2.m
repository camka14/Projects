clear,clc
Tt4 = [1800, 2000, 2200, 2400];
Pic = [10, 20];

M9 = zeros(8,1);
V9 = zeros(8,1);
Fm = zeros(8,1);
f = zeros(8,1);
S = zeros(8,1);
k = 1;

for i = 1:length(Pic)
    for j = 1:length(Tt4)
        [M9(k),V9(k),Fm(k),f(k),S(k)] = calc(Tt4(j),Pic(i));
        k = k+1;
    end
end

function [M9,V9,T,f,S] =calc(Tt4,piC)
    a0 = sqrt(1.4*287*217);
    tauR = 1 + (1.4-1)/2 * 2^2;
    tauLambda = Tt4/217;
    tauC = piC^(0.4/1.4);
    tauT = 1 - (tauR/tauLambda)*(tauC - 1);
    
    M9 = sqrt( 2/(1.4-1) * (tauR*tauC*tauT - 1));
    V9 = a0 * sqrt( 2/(1.4-1)*tauLambda/(tauR*tauC)*(tauR*tauC*tauT - 1));
    T = a0*(V9/a0 - 2);
    f = 1.004*217/42800 * (tauLambda - tauR*tauC);
    S = f/T * 1e6;
end
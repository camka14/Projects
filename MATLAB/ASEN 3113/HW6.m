clear,clc

L = 50;
d = .1;
dT = 150-15;
h = 20;
k = 0.035;
A = L*2*pi*d/2;
Qd = h*A*dT;

for t = 0.001:.0001:.1
    Q = dT/(log((t+d/2)/(d/2))/(2*pi*L*k)+1/(h*2*pi*L*(t+d/2)));
    if abs(Q-0.1*Qd) < 10
        break
    end
end
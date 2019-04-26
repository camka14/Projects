clear,clc

for Kp = [10]
B = Kp;
Br = [1 0.5+Kp];

sysTF = tf(B,Br);

t = 0:0.01:10;
xstep = step(sysTF,t);

t9 = t(xstep>0.9);
t9 = t9(1);

figure(1)
grid on
hold on
plot(t,xstep);
xlabel("time (s)")
ylabel("B(t)")


u=square(2*pi*0.2*t);
xgen = lsim(sysTF,u,t);

figure(2)
grid on
hold on
plot(t,xgen)
xlabel("time (s)")
ylabel("B(t)")

end
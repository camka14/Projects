clear,clc
disp('Samuel Razumovskiy')
f=@(t,w) (20-.06*w)/.02;
[t,w]=ode45(f,[0,.5],50);
ans=w(end)
plot(t,w)
title('Motor Speed')
xlabel('Time (s)')
ylabel('Rotational Speed (rad/s)')
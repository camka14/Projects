function [r,u,uprime] = shoot(a,b,ua,ub)
f=@(r,u)[u(2); u(1)/r^2-(1/r)*u(2)];
n=1;
for guess=[1,-1]
    [r,u]=ode45(f,[a b],[ua guess])
    Uguess(n)=u(end,1)
    n=n+1;
end
Uinitialprime=-1+((1+1)/(Uguess(1)-Uguess(2)))*(ub-Uguess(2))
[r,u]=ode45(f,[a b],[ua Uinitialprime])
uprime=u(:,2);
u=u(:,1);
table(r,u,uprime)
plot(r,u)
title('Radial Displacement')
xlabel('Radius')
ylabel('Displacement')
end
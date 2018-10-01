function people = population(kgm, pmax)
% Remember that you can change the names of variables, but not the order.
% Do not change the name of the function (population).
f=@(t,p) kgm*(1-(p/pmax))*p
error=1e-4;
h=30;
Pf=ones([2,1]);
Pf2=zeros([2,1]);
k=2;
tspan=[1950,2010];
[t,p]=ode45(f,tspan,2555);
while abs(Pf(end)-Pf2(end))/Pf(end)*100>error
    Pi=2555;
    Pf2=Pf;
    n=0;
    for x=1:k
        n=n+1;
        Pf(n)=Pi+f(1,Pi)*h;
        Pi=Pf(n);
    end
    time=[1950:h:2010-h];
    k=k+1;
    h=60/k;
end
plot(time,Pf,'r --')
hold on
plot(1950:1.5:2010,p,'b -')
hold on
Pa=[2555,3040,3708,4454,5276,6079,6892];
plot(1950:10:2010,Pa,'k *')
title('Eulers Method')
xlabel('Time(Years)')
ylabel('Population')
legend('User Method','ODE45','Actual Data','location','southeast')
people=Pf(end)
end
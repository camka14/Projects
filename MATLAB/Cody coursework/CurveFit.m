clear,clc
% [ alpha, beta, Rsquare]
x=[0.1 0.2 0.4 0.6 0.9 1.3 1.5 1.7 1.8];
y=[0.75 1.25 1.45 1.25 0.85 0.55 0.35 0.28 0.18];
Y=y./x;
Y=log(Y);
ab=polyfit(x,Y,1)
alpha=exp(ab(1,2))
beta=ab(1,1);
i=1;
for t=x
    f(i)=[alpha*t*exp(beta*t)]
    i=i+1;
end
plot(x,f,x,y);
xlabel('x Values')
ylabel('y Values')
title('Curve Fit of Exponential Function')
legend('Curve Fit', 'Data points')
SSerr=sum((y-f).^2);
SStot=sum((y-mean(y)).^2);
R2=1-SSerr/SStot;
curvefit=[alpha,beta,R2];
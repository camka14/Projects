,cclear,clc
disp('Samuel Razumovskiy')
disp('Problem 1')
f=@(x) exp(sqrt(x))/sqrt(x);
k=1;
error=1e-6;
y=1;
z=4;
while abs(2*exp(2)-2*exp(1)-y)>error
    n=1;
    b=3/k; %step size
    a=1; %lower bound
    for  b=(a:b:z) %upper bound
        X1=((b-a)/2)*(-1/sqrt(3))+(b+a)/2;
        X2=((b-a)/2)*(1/sqrt(3))+(b+a)/2;
        W=(b-a)/2;
        yp=W*f(X1)+W*f(X2); %finds integral in these bounds
        a=b;
        T(n)=yp; %stores these bounds
        n=n+1;
    end
    y=abs(sum(T)); %adds all the integration
    k=k+1;
end
format long
segments=k
Error=abs(2*exp(2)-2*exp(1)-y)
y

disp('Problem 2')
[t,X5]=ode45('displacement5',[0,15],[0,1]);
[t,X40]=ode45('displacement40',[0,15],[0,1]);
[t,X200]=ode45('displacement200',[0,15],[0,1]);
plot(t,X5,'--',t,X40,'- o',t,X200,'- r')
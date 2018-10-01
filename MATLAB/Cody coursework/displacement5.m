function [X] = displacement5(t,x)
n=1;
k=20;
m=20;
c=5;
X=zeros(2,1);
X(n)=x(n+1);
X(n+1)=(-c*x(n+1)-k*x(n))/m;
n=n+2;
end
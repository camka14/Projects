clear,clc
disp('Samuel Razumovskiy')
f=@(t) (t+(2./t)).^2;
x=2;
error=1e-5;
results=10;
n=1;
p=0;
while abs(25/3-results)>error
    n=n+1
    p=n*2
    h=(x-1)/p;
    results=(h)/3*(f(1)+4*sum(f(1+h:2*h:x-h))+2*sum(f(1+2*h:2*h:x-2*h))+f(x));
end
results=[results abs(25/3-results) n];
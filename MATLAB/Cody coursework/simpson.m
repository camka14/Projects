function [results] = simpson(x)
f=@(t) (t+2./t).^2;
error=5e-8;
results=10;
n=0;
p=0;
while abs(erf(x)-results)>error
    n=n+1;
    p=n*2;
    h=x/p;
    results=(h)/3*(f(1)+4*sum(f(h:2*h:x-h))+2*sum(f(2*h:2*h:x-2*h))+f(x));
end
results=[results abs(erf(x)-results) n];
end

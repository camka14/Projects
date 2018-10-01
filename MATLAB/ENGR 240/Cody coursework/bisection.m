function [ output ] = bisection( alpha, L, U )
tol=1e-14;
a=1;
b=2;
while abs(a+b)>tol;
    m=(L+U)/2;
    format long
    if besselj(alpha,m).*besselj(alpha,L)<0;
        U=m;
    else 
        L=m;
    end
    a=besselj(alpha,U);
    b=besselj(alpha,L);
end
output=U;
end
function [y] = ztable(z)
% inputs are input in row vector form, can be several numbers.
% y is the area under the curve representing probability, should match your 109 book.
% Names of variables (y, inputs) can be changed.  The name of fucntion (ztable) and order of variables cannot.
f=@(x) 1/sqrt(2*pi)*exp((-1/2)*x^2)
k=1;
for z=z
    n=1;
    a=0;
    b=z/22;
    for  b=(a:b:z)
        X1=((b-a)/2)*(-1/sqrt(3))+(b+a)/2;
        X2=((b-a)/2)*(1/sqrt(3))+(b+a)/2;
        W=(b-a)/2;
        yp=W*f(X1)+W*f(X2);
        a=b;
        T(n)=yp
        n=n+1;
    end
    y(k)=abs(sum(T))
    k=k+1
end
end
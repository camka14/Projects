function [output] = brackets1(alpha, x, numroot)
% Inputs and outputs are outlined in the problem descriptions.
% Remember that you can change the names of variables, but not the order.
% Do not change the name of the function (brackets).
a=2;
b=1;
tol=1e-8;
n=2;
for alpha=alpha;
    for numroot=1:1:numroot
        while abs(a+b)>tol;
            if besselj(alpha,x).*besselj(alpha,n)<0;
                m=(x+n)/2;
                if besselj(alpha,m).*besselj(alpha,x)<0;
                    n=m;
                else besselj(alpha,m).*besselj(alpha,n)<0;
                    x=m;
                end
                a=besselj(alpha,n);
                b=besselj(alpha,x);
            else
                n=n+1;
            end
        end
        matrix(alpha+1,numroot)=n;
        x=n;
        n=ceil(n);
        a=2;
        b=1;
    end
    x=1;
    n=1;
end
output=matrix;
end
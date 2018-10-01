function [value]=dintegral(a,b,c,d)
    % a, b, c, d are inputs representing integration limits.
    % value represents the answer for the double integral.
    % Names of variables (value,a,b,c,d) can be changed.  The name of fucntion (dintegral) and order of variables cannot.
    f=@(x,y) 3*x+4*x.*sqrt(x.*y)
    value=integral2(f,a,b,c,d)
    fsurf(f,[a b c d])
end
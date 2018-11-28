clear,clc
fun = @(x) x-cos(x);
gfun = @(x) cos(x);
eps = 10^(-(2+1));
x1 = 0;
x2 = 0.5;
while abs(x1-x2) > eps
    x1 = x2;
    x2 = gfun(x1);
end
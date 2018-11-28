fun = @(x) x-cos(x);
gfun = @(x) cos(x);
eps = 10^(-(2+1));
x = 0.5;

while fun(x) ~= eps
    x = gfun(x);
end
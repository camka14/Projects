function [x,y,yc] = NACA_Airfoils(m,p,t,c,N)
% NACA_Airfoils produces the x and y coordinates of a desired NACA four
% digit airfoil and the mean camber line, provided the four digits that
% come from m, p, and t, the chord length, and the number of points N

% Actual values of m, p, and t
m = m/100;
p = p/10;
t = t/100;
% Using the method from Kuthe and Chow to get x values
x = c/2+c/2*cos(linspace(0,pi,ceil(N/2)));

% Y thickness
yt = t.*c/0.2.*(0.2969.*sqrt(x./c)-0.1260.*(x./c)-0.3516.*(x./c).^2+...
        0.2843.*(x./c).^3-0.1036.*(x./c).^4);

% Y mean camber (This somehow works but I'm not sure if it's more efficient
% than a regular for loop)

if (0 <= x) & (x <= p*c)
    yc = (m/p^2).*x.*(2*p - x./c);
else
    yc = (m/(1-p)^2).*(c - x).*(1 + x./c - 2*p);
end

% Calculating xi
xi =atan(diff(yc));
xi(end+1) = 0;

% Finding X upper and X lower
xU = x-yt.*sin(xi);
xL = x+yt.*sin(xi);

% Finding Y upper and Y lower then concatenating everything
yU = yc+yt.*cos(xi);
yL = yc-yt.*cos(xi);
x = [xL,fliplr(xU(1:end-1))];
y = [yL,fliplr(yU(1:end-1))];
end
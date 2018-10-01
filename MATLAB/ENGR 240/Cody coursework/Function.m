function [Y] = Function(t,y)
g=32.2;
Y=zeros(2,1);
Y(1)=y(2);
Y(2)=(c*y(2)-k*x)/m;
end
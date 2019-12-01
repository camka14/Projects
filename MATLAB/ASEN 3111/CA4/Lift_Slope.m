function [a,alphaL0] = Lift_Slope(m,p,t,c,v_inf)

N = 150;
[x,y] = NACA_Airfoils(m,p,t,c,N);
alpha = linspace(-5,10);
cl = zeros(size(alpha));
M = N;
for i = 1:100
    cl(i) = Vortex_Panel(alpha(i)*pi/180,v_inf,c,x,y,M);
end
fun = polyfit(alpha,cl,1);
a = fun(1);
alphaL0 = (-fun(2)/fun(1));
end
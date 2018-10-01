clear,clc
%polyval(a,x)
a=[2 5 0 1] %f(x)=2x^3+5x^2+1
polyval(a,3) %f(3)=?
y=[-4.9 2 1];
t=[-1:.1:2];
H=polyval(y,t)
roots(y)
x1=[-1,2] %code for the x axis
y1=[0,0]
plot(t,H,x1,y1,'r')

a=[3,-5,6,-2]
b=[1,3,0,-1,0,2.5]
c=conv(a,b) %multiplying polynomials
d=deconv(b,a) %dividing polynomials
roots(a) %roots of a polynomial

f=@(x) x^3-2*x-5
root_f=fzero(f,[0]) %approx of zero
f(2)
s=@(theta) sin(theta)
root_s=fzero(s,1)
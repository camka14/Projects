clear,clc
n=1;
disp('Problem 1')
for h=[10 5 2 1 .1]
k=7.13e3;
a=.001;
B=.0041;
x0=0;
y0=0;
xm=0;
ym=0;
f=@(t,x) k*(a-x)^2*(B-x/2);
for i=1:10/h
k1=f(x0,y0); %k1 is used for both Heun's and Midpoint
k2=f(x0+h,y0+k1*h);
y0=y0+(.5*k1+.5*k2)*h; %y value for Heun's method
x0=x0+h;
k2=f(xm+1/2*h,ym+1/2*k1*h);
ym=ym+(k2)*h; %y value evaluated with Midpoint method
xm=xm+h;
end
Heuns(n,1)=y0;
Midpoint(n,1)=ym;
n=n+1;
end
format short
t=table(Heuns,Midpoint)

disp('Problem 2')
[t,y1]=ode45('Function',[0,5],[0,0]);
y=y1(:,1);
v=y1(:,2);
table=table(t,y,v,'VariableName',{'Time' 'Height' 'Velocity'})
subplot(2,1,1)
plot(t,y)
subplot(2,1,2)
plot(t,v)
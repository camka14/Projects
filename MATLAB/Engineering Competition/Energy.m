function [ x ] = Energy( Px,Py,k,m,mu,h1 )
%input a k value for the spring, an x value for the distance pulled, a mass
% and a hieght.
x=.1; %m
D=1; %m 
P=sqrt(Px^2+Py^2)*.3048 %m distance to target
w=m*9.81; %N weight of payload
Ff=mu*w*sind(45); %N force of friction
while abs(D-P)>0.01
    x=x+.0001; %m
    g=9.81; %m/s^2
    h2=h1-x*sind(45); %m height during initial energy
    E=.5*k*x^2+m*g*h2-Ff*x; %J initial energy
    vi=sqrt(2*(E/m-g*h1)); %m/s velocity
    Vyi=vi*sind(45); %m/s vertical velocity
    Vxi=vi*cosd(45); %m/s horizontal velocity
    t=(-Vyi-sqrt(Vyi^2+2*g*h1))/-g; %s time
    D=Vxi*t; %m distance launched
end
theta=asind(Px/Py)
D
end
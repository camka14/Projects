function [ x ] = Energy( Px,Py,k,m,mu,h1 )
%input x and y coordingates in feet, k value for the spring in N/m, mu
%mass of projectile in grams, value for friction constant, and initial
%height
x=.1; %m initial distance pulled
D=1; %m 
P=sqrt(Px^2+Py^2)*.3048; %m distance to target
w=m*9.81; %N weight of payload
Ff=mu*w*sind(45); %N force of friction
while abs(D-P)>0.01
    x=x+.0001; %m distance to pull
    g=9.81; %m/s^2
    h2=h1-x*sind(45); %m height at initial
    E=.5*k*x^2+m*g*h2-Ff*x; %J initial energy
    vi=sqrt(2*(E/m-g*h1)); %m/s velocity
    Vyi=vi*sind(45); %m/s vertical velocity
    Vxi=vi*cosd(45); %m/s horizontal velocity
    t=(-Vyi-sqrt(Vyi^2+2*g*h1))/-g; %s time
    D=Vxi*t; %m distance launched
end
theta=asind(Px/Py);
fprintf('Distance to target %.3f m\n', D)
fprintf('Target heading %.3f deg\n', theta)
fprintf('Draw Distance %.3f cm\n', x*100)
end
function [ Velocity ] = Rocket( t )
format longG
n=1;
for t=t
    if  t>30
        v=1700*exp(-.2*(t-30));
    elseif 20<t && t<=30
        v=50*t+2*(t-20)^2;
    elseif 10<t && t<=20
        v=1100-5*t;
    elseif 0<t && t<=10
        v=11*t^2-5*t;
    else
        v=0;
    end
    Velocity(n,1)=v;
    n=n+1;
end
end


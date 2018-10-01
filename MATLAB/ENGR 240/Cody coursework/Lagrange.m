function [pressure] = Lagrange(temperature)
format short
t=0:5:50
p=[0.0061, 0.0087, 0.0123, 0.0170, 0.0234, 0.0317, 0.0425, 0.0563, 0.0738, 0.0959, 0.1235]
i=1;
for temperature=temperature
    [~,I] = sort(abs(t-temperature)); %Finds the location of the closest value to the given temperature
    P0=p(I(1)) %Finds the pressure at the given index
    P1=p(I(2))
    P2=p(I(3))
    
    t0=t(I(1)) %Finds the closest temps given the index
    t1=t(I(2))
    t2=t(I(3))
        
    L0=((temperature-t1)/(t0-t1))*((temperature-t2)/(t0-t2))
    L1=((temperature-t0)/(t1-t0))*((temperature-t2)/(t1-t2))
    L2=((temperature-t0)/(t2-t0))*((temperature-t1)/(t2-t1))
    pressure(i)=L0*P0+L1*P1+L2*P2
    i=i+1;
end
end
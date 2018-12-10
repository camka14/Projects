function dT_dt = Thrust(t,X,Cd,CD,G,At,Ab,rhoW,rhoAa,v0,P0,Pa,Te,Pend,Ma0,vb,R,theta0,g)

va = X(1);
Ma = X(2);
Mr = X(3);

if z <= 0
    dT_dt = zeros(3,1);
    return
end

if va < vb
    P = P0*(v0/va)^G;
    dva_dt = Cd*At*sqrt(2/rhoW*(P-Pa));
    dma_dt = 0;
    dm_dt = Cd*At*sqrt(2*rhoW*(P-Pa));
    dmr_dt = -dm_dt;
    
    T = 2*Cd*At*(P-Pa);
elseif va >= vb
    P = Pend*(Ma/Ma0)^G;
    if P > Pa
        Pc    = P*(2/(G+1))^(G/(G-1));
        rhoa  = Ma/vb;
        Temp  = P/(rhoa*R);
        if Pc > Pa
            Pe = Pc;
            Te = (2/(G+1))*Temp;
            rhoe = Pe/(R*Te);
            Me = 1;
        else
            Pe = Pa;
            Me = sqrt(((P/Pa)^((G-1)/G)-1)*2/(G-1));
            Te = Temp/(1+(G-1)/2*Me^2);
            rhoe = Pe/(R*Te);
        end
        Ve = Me*sqrt(G*R*Te);
        dva_dt = 0.002;
        dma_dt = Cd*rhoe*At*Ve;
        dmr_dt = -dma_dt;
        T = Ma*Ve+(Pe-Pa)*At;
    else
        T = 0;
        dva_dt = 0.002;
        dma_dt = Ma;
        dmr_dt = Mr;
    end
end

dT_dt = [dva_dt;dma_dt;dmr_dt];
end
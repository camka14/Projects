function dp_dt = VM_int(t,X,Cd,CD,G,At,Ab,rhoW,rhoAa,v0,P0,Pa,Te,Pend,Ma0,vb,R,theta0,g)

va = X(1);
Ma = X(2);
Mr = X(3);
Vx = X(4);
Vz = X(5);
x  = X(6);
z  = X(7);

if z <= 0
    dp_dt = zeros(7,1);
    return
end

if va < vb
    P = P0*(v0/va)^G;
    dva_dt = Cd*At*sqrt(2/rhoW*(P-Pa));
    dma_dt = 0;
    dmr_dt = -Cd*At*sqrt(2*rhoW*(P-Pa));
    
    T = 2*Cd*At*(P-Pa);
else
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
        dva_dt = 0;
        dma_dt = -Cd*rhoe*At*Ve;
        dmr_dt = dma_dt;
        T = dma_dt*Ve+(Pe-Pa)*At;
    else
        T = 0;
        dva_dt = 0;
        dma_dt = 0;
        dmr_dt = 0;
    end
end

V = sqrt(Vx^2+Vz^2);

if sqrt(x^2+(z-0.25)^2) < 0.5
    hx = cos(theta0);
    hz = sin(theta0);
else
    hx = Vx/V;
    hz = Vz/V;
end

D = rhoAa/2*V^2*CD*Ab;
F = T - D;
dVx_dt = F*hx/Mr;
dVz_dt = F*hz/Mr - g;

dx_dt = Vx;
dz_dt = Vz;
dp_dt = [dva_dt;dma_dt;dmr_dt;dVx_dt;dVz_dt;dx_dt;dz_dt];
end
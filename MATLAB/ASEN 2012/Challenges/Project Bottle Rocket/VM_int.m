function dp_dt = VM_int(t,X,Cd,CD,Gamma,At,Ab,vA0,vb,rhoW,rhoAa,Pa,P0,Pend,g,R,MA0,theta0)

vA = X(1); % Volume of air
MA = X(2); % Mass of air
MR = X(3); % Mass of rocket
Vx = X(4); % Velocity x
Vz = X(5); % Velocity z
x  = X(6); % Position x
z  = X(7); % Position z

% Ends program when rocket hits ground
if z <= 0
    dp_dt = zeros(7,1);
    return
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Phase 1 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if vA < vb 
% Equations for Pressure, change in volume of air, change in mass of
% rocket, and thrust respectively
    P      = P0*(vA0/vA)^Gamma;
    dvA_dt = Cd*At*sqrt(2/rhoW*(P-Pa));
    dMA_dt = 0;
    dMR_dt = -Cd*At*sqrt(2*rhoW*(P-Pa));
    
    Thrust = 2*Cd*At*(P-Pa);
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Phase 2 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
else
% Initial check of the pressure to check the condition
    P = Pend*(MA/MA0)^Gamma;
    
    % Checks if the pressure is greater than the ambient 
    if P > Pa   
% Equations for pressure critical, density of air, and temperature
% respectively
        Pc     = P*(2/(Gamma+1))^(Gamma/(Gamma-1));
        rhoA   = MA/vb;
        Temp   = P/(rhoA*R);
        
% Checks if the flow is choked or not then calculates exit pressure, exit 
% temperature, and exit mach number respectively
        if Pc > Pa % Choked flow
            Pe = Pc;
            Tempe = (2/(Gamma+1))*Temp;
            Me = 1;
        else       % Not choked flow
            Pe = Pa;
            Me = sqrt(((P/Pa)^((Gamma-1)/Gamma)-1)*2/(Gamma-1));
            Tempe = Temp/(1+(Gamma-1)/2*Me^2);
        end
        
% Equations for density at exit, exit velocity, change in air mass, change 
% in rocket mass, and thrust respectively
        rhoe   = Pe/(R*Tempe);
        Ve     = Me*sqrt(Gamma*R*Tempe);
        dvA_dt = 0;
        dMA_dt = -Cd*rhoe*At*Ve;
        dMR_dt = dMA_dt;
        Thrust = -dMA_dt*Ve+(Pe-Pa)*At;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Phase 3 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    else
% All derivatives set to 0 since there is no change
        Thrust = 0;
        dvA_dt = 0;
        dMA_dt = 0;
        dMR_dt = 0;
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%% End of Phases %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


V = sqrt(Vx^2+Vz^2);    % Velocity magnitude
D = rhoAa/2*V^2*CD*Ab;  % Drag magnitude
F = Thrust - D;         % Thrust magnitude

% Heading calculator
if norm([x z-.25]) < 0.5 % Checks if on rail and hardcodes heading
    hx = cosd(theta0);
    hz = sind(theta0);
else
    hx = Vx/V;
    hz = Vz/V;
end

% Velocity derivatives
dVx_dt = F*hx/MR;
dVz_dt = F*hz/MR - g;

% Position derivatives
dx_dt  = Vx;
dz_dt  = Vz;

dp_dt  = [dvA_dt;dMA_dt;dMR_dt;dVx_dt;dVz_dt;dx_dt;dz_dt];
end
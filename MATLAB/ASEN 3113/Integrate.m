function [d_dt] = Integrate(t,X,WN,WE,WD,rho,mass,A,Cd,g)
% ODE45 function to integrate a flight path with drag

% Defining position and velocity although position is not used
VN = X(1);
VE = X(2);
VD = X(3);

N = X(4);
E = X(5);
D = X(6);

% Calculating the relative wind
VNrel = VN-WN;
VErel = VE-WE;
VDrel = VD-WD;

% Calculating the relative wind magnitude
Vrel = sqrt(VNrel^2+VErel^2+VDrel^2);

% Calculating the relative wind cosine directions
Nalpha = acos(VNrel/Vrel);
Ebeta = acos(VErel/Vrel);
Dgamma = acos(VDrel/Vrel);

% Calculating drag with relative wind
Drag = -Cd*rho*A*Vrel^2/2;

% Calculating acceleration
dVN_dt = Drag*cos(Nalpha)/mass;
dVE_dt = Drag*cos(Ebeta)/mass;
dVD_dt = Drag*cos(Dgamma)/mass + g;

% Applying velocity
dN_dt = VN;
dE_dt = VE;
dD_dt = VD;

d_dt = [dVN_dt;dVE_dt;dVD_dt;dN_dt;dE_dt;dD_dt];
end


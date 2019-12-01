function [dydt] = FB_quadcopter_ODE(t,y,mass,I_B,g,k1,k2,k3,k4)
% quadcopter_ODE This function is used to simulate trimmed flight of a
% quadcopter with simplified kinematics and dynamics.

% Position in E frame
pos_N = y(1); pos_E = y(2); pos_D = y(3); % m
% Velocity in B frame
vel_xB = y(4); vel_yB = y(5); vel_zB = y(6); % m/s
psi = y(7); theta = y(8); phi = y(9); % rad
p = y(10); q = y(11); r = y(12); % rad/s
VE_B = [vel_xB;vel_yB;vel_zB];
wEB = [p;q;r];

% Transfer matrix from B to E frame coordinates
L_EB = [cos(theta)*cos(psi),sin(phi)*sin(theta)*cos(psi)-cos(phi)*sin(psi),...
    cos(phi)*sin(theta)*cos(psi)+sin(phi)*sin(psi);cos(theta)*sin(psi),...
    sin(phi)*sin(theta)*sin(psi)+cos(phi)*cos(psi),...
    cos(phi)*sin(theta)*sin(psi)-sin(phi)*cos(psi);...
    -sin(theta),sin(phi)*cos(theta),cos(phi)*cos(theta)];

% Weight in B frame coordinates
weight = L_EB\[0;0;mass*g];

% Drag in B frame coordinates
VEmag = norm(VE_B);
Aa = -1*10^-3.*VEmag.*VE_B;

% Forces from rotors and aerodynamic drag added together
Xc = 0;
Yc = 0;
Zc = -mass*g;
Ac = [Xc;Yc;Zc];
FB = weight+Aa+Ac;

% Acceleration in B frame coordinates
a_B = FB./mass-cross(wEB,VE_B);
uB_d = a_B(1);
vB_d = a_B(2);
wB_d = a_B(3);

% Velocity in E frame coordinates
VE_E = L_EB*VE_B;
vel_NE = VE_E(1);
vel_EE = VE_E(2);
vel_DE = VE_E(3);

% Finding the aerodynamic moments from rotors and drag
wmag = norm(wEB);
G_a = -2*10^-6*wmag.*[p;q;r];

Lc = -k1*p-k2*phi;
Mc = -k3*q-k4*theta;
Nc = -0.004*r;
G_c = [Lc;Mc;Nc];
G_B = G_a+G_c;

% Finding changes in psi,theta,phi from p,q,r
Rates = [1, sin(phi)*tan(theta), cos(phi)*tan(theta);...
         0, cos(phi),            -sin(phi);...
         0, sin(phi)*sec(theta), cos(phi)*sec(theta)]*[p;q;r];
phi_d = Rates(1);
theta_d = Rates(2);
psi_d = Rates(3);

% Finding change in p,q,r
w_d = I_B\(cross(-wEB,I_B*wEB)+G_B);

p_d = w_d(1);
q_d = w_d(2);
r_d = w_d(3);

yd_trans = [vel_NE; vel_EE; vel_DE; uB_d; vB_d; wB_d];
yd_rot  = [psi_d; theta_d; phi_d; p_d; q_d; r_d];

dydt = [yd_trans;yd_rot];
end


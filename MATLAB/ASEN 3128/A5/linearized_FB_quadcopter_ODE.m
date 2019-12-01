function [dydt] = linearized_FB_quadcopter_ODE(t,y,mass,I_B,g,radius,del_VE_Er,k1,k2,k3,k4,k5,k6)
% quadcopter_ODE This function is used to simulate trimmed flight of a
% quadcopter with simplified kinematics and dynamics.

% Position in E frame
del_pos_N = y(1); del_pos_E = y(2); del_pos_D = y(3); % m
% Velocity in B frame    
del_u = y(4); del_v= y(5); del_w= y(6); % m/s
del_psi = y(7); del_theta = y(8); del_phi = y(9); % rad
del_p = y(10); del_q = y(11); del_r = y(12); % rad/s
del_VE_B = [del_u;del_v;del_w];

% Transfer matrix from B to E frame coordinates
L_EB = [cos(del_theta)*cos(del_psi),sin(del_phi)*sin(del_theta)*cos(del_psi)-cos(del_phi)*sin(del_psi),...
    cos(del_phi)*sin(del_theta)*cos(del_psi)+sin(del_phi)*sin(del_psi);cos(del_theta)*sin(del_psi),...
    sin(del_phi)*sin(del_theta)*sin(del_psi)+cos(del_phi)*cos(del_psi),...
    cos(del_phi)*sin(del_theta)*sin(del_psi)-sin(del_phi)*cos(del_psi);...
    -sin(del_theta),sin(del_phi)*cos(del_theta),cos(del_phi)*cos(del_theta)];

% Velocity required in B frame calculated from E frame velocity required
if t >= 2
    del_VE_Er = [0;0;0];
end
del_VE_r = L_EB\del_VE_Er;
% Forces from rotors and aerodynamic drag
del_Xc = 0;
del_Yc = 0;
del_Zc = 0;
del_Ac = [del_Xc;del_Yc;del_Zc];

% Acceleration in B frame coordinates
del_u_d = -g*del_theta;
del_v_d = g*del_phi;
del_w_d = 1/mass*del_Ac(3);

% Velocity in E frame coordinates
VE_E = L_EB*del_VE_B;
vel_NE = VE_E(1);
vel_EE = VE_E(2);
vel_DE = 0;

% Finding the aerodynamic moments from rotors and drag
del_Lc = -k1*del_p + k2*(-del_phi+k3*(del_VE_r(2)-del_v));
del_Mc = -k4*del_q + k5*(-del_theta+k6*(del_VE_r(1)-del_u));
del_Nc = -0.004*del_r;
del_G_c = [del_Lc,del_Mc,del_Nc];

% Finding change in p,q,r
del_p_d = 1/I_B(1,1)*del_G_c(1);
del_q_d = 1/I_B(2,2)*del_G_c(2);
del_r_d = 1/I_B(3,3)*del_G_c(3);

% Finding changes in psi,theta,phi from p,q,r
del_psi_d = del_r;
del_theta_d = del_q;
del_phi_d = del_p;

yd_trans = [vel_NE; vel_EE; vel_DE; del_u_d; del_v_d; del_w_d];
yd_rot  = [del_psi_d; del_theta_d; del_phi_d; del_p_d; del_q_d; del_r_d];

dydt = [yd_trans;yd_rot];
end

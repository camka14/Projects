function [dydt] = linearized_Aircraft_ODE(t,y,u0,A)
% linearized_Aircraft_ODE This function is used to simulate trimmed flight 
% of an aircraftwith simplified kinematics and dynamics.

% Position in E frame
del_pos_N = y(1); del_pos_E = y(2); del_pos_D = y(3); % m
% Velocity in B frame    
del_u = y(4); del_v= y(5); w= y(6); % m/s
del_psi = y(7); del_theta = y(8); del_phi = y(9); % rad
del_p = y(10); q = y(11); del_r = y(12); % rad/s
del_VE_B = [del_u;del_v;w];

% Transfer matrix from B to E frame coordinates
L_EB = [cos(del_theta)*cos(del_psi),sin(del_phi)*sin(del_theta)*cos(del_psi)-cos(del_phi)*sin(del_psi),...
    cos(del_phi)*sin(del_theta)*cos(del_psi)+sin(del_phi)*sin(del_psi);cos(del_theta)*sin(del_psi),...
    sin(del_phi)*sin(del_theta)*sin(del_psi)+cos(del_phi)*cos(del_psi),...
    cos(del_phi)*sin(del_theta)*sin(del_psi)-sin(del_phi)*cos(del_psi);...
    -sin(del_theta),sin(del_phi)*cos(del_theta),cos(del_phi)*cos(del_theta)];

% Forces from rotors and aerodynamic drag
del_Xc = 0;
del_Yc = 0;
del_Zc = 0;
del_Ac = [del_Xc;del_Yc;del_Zc];

% Acceleration in B frame coordinates
del_y = [del_u;w;q;del_theta];
del_y_d = A*del_y;

del_u_d = del_y_d(1);
del_v_d = 0;
w_d = del_y_d(2);

% Velocity in E frame coordinates
VE_E = L_EB*del_VE_B;
vel_NE = del_u;
vel_EE = VE_E(2);
vel_DE = w-u0*del_theta;

% Finding the aerodynamic moments from rotors and drag
del_Lc = 0;
del_Mc = 0;
del_Nc = 0;
del_G_c = [del_Lc,del_Mc,del_Nc];

% Finding change in p,q,r
del_p_d = 0;
q_d = del_y_d(3);
del_r_d = 0;

% Finding changes in psi,theta,phi from p,q,r
del_psi_d = 0;
del_theta_d = del_y_d(4);
del_phi_d = 0;

yd_trans = [vel_NE; vel_EE; vel_DE; del_u_d; del_v_d; w_d];
yd_rot  = [del_psi_d; del_theta_d; del_phi_d; del_p_d; q_d; del_r_d];

dydt = [yd_trans;yd_rot];
end


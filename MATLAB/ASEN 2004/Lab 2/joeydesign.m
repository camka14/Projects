%joey design calculations
clear; close all; clc;
%% initial measurements and constraints

thick = .005; %foam thickness in meters
s_wet = .23922; %cad surface area m^2
roh_inf = 1.0581; %density in boulder (1.5km)

%wings
    b = .8; %wingspan in meters
    c = .07; % chord length in meters
    s_ref = b*c; %reference area wing
    fprintf('s_ref: %.2f m^2\n',s_ref);
    AR = b^2/s_ref; %aspect ratio
    fprintf('AR: %.2f m^2\n',AR);
    band = c*.4; %width of the kf step (40%)
    
%fuse
    L = .53; %nose to tail in meters
    W = .03; %width in meters
    wing_cen = .25; %nose to center of wing in meters
    h = .03; %fuse height in meters
    
%tail section
    vert_h = .08; %vertical stab height
    vert_l = .06; %vertical stab length
    horz_h = .06; %1/2 horizontal stab height
    horz_l = .08; %1/2 horizontal stab length
    
    vert_vol = vert_h * vert_l *thick;
    horz_vol = 2 * horz_h * horz_l * thick;



%% calculations 

% weight
    roh = .3; %density of foam board kg/m^2
    dowel_roh = 350; %density of poplar wood kg/m^3
    wing_w = roh * (s_ref + band*b); %weight of wing in kg
    fuse_w = roh * (L*W + 2*L*h); %over-estimate of fuse weight kg
    vert_w = roh * (vert_h * vert_l); %kg
    horz_w = roh * (horz_h * horz_l); %kg
    dowel_w = dowel_roh * (.04*0.0047625^2*pi); %weight of the rods used
    glue_w = .00401; %g per stick
    num_stick = 4; %estimate of the number of sticks used
    added = .005; %just added weight to modify 
    total_w = wing_w + fuse_w + vert_w + 2*horz_w + 3* dowel_w + + glue_w*num_stick + added;
    fprintf('Total Weight: %f kg\n',total_w);
    
    wing_load = (total_w) / s_ref; 
    fprintf('Wing loading: %f kg/m^2\n',wing_load);

%Center of gravity 
    % 0 is defined at the leading edge
    x_cg_wing = .0311; 
    x_cg_fuse = .035;
    x_cg_vert = .27;  
    x_cg_horz = .27; 
    x_cg_added = -.25; %location of the balast 
    x_cg = (wing_w*x_cg_wing + fuse_w*x_cg_fuse + vert_w*x_cg_vert + 2*horz_w*x_cg_horz + dowel_w*x_cg_horz + added*x_cg_added)/(total_w);
    percent_cg = (x_cg/c) *100;
    fprintf('Cg from leading edge: %fm and %f%% \n',x_cg, percent_cg)
    

%L/D
    %desired 
    R_desired = 80; %range want in m
    height = 8; %launch height
    L_D = R_desired/height; %this will be the minimum L/D goal for range
    fprintf('L_D Required: %f \n',L_D);
    %calculated for aircraft (pg 239)
    
%C_L
    v_inf = 4.766; %temp flying speed in m/s
    Re_entire = (roh_inf * v_inf * L)/(1.789*10^-5); %calculation for Re whole plane
    Re_wing = (roh_inf * v_inf * c)/(1.789*10^-5); %calculation for Re wing
    C_f = .074/(Re_entire^.2); %coefficient of friction 
    C_D0 = C_f*(s_wet/s_ref); 
    C_D = 2*C_D0; %making the assumption that C_D = 2C_D0
    C_Lreq = (L_D)*2*C_D0;
    q_inf = .5*roh_inf*(v_inf)^2;
            %C_L = (total_w)/(q_inf*s_ref);
    k = C_D0/(C_Lreq^2);
    
    fprintf('C_D0: %f \n',C_D0);
    fprintf('C_L required: %f \n',C_Lreq);
    %fprintf('C_L: %f \n',C_L);
    fprintf('C_D = %f + %f*C_L^2 \n',C_D0,k);

   
    % Wing Loading Comparison Plot: 
    W_Sreq_6 = C_Lreq*(0.5)*(roh)*(v_inf^2);
    V_infVec = linspace(3,7,1000); 
    W_Sreq = C_Lreq*(0.5)*(roh).*(V_infVec.^2); %theoretical wing loading
    fprintf('Wing loading theoretical: %f kg/m^2\n',W_Sreq_6);
    fprintf('Actual Wing loading: %f kg/m^2\n',wing_load);
    
    plot(V_infVec,W_Sreq); 
    xlabel('Velocities'); 
    ylabel('Wing loading');
    hold on
    plot([0 10], [wing_load wing_load])
    legend('Theoretial wing loading','Actual wing loading')
    
    [~, I] = min(abs(wing_load-W_Sreq));
    V_req = V_infVec(I);
    fprintf('Flying velocity: %f m/s\n',V_req);
   
%AOA 
%re and cl req look at the aoa
aoa = 5; %estimate from file:///C:/Users/jode0200/Downloads/Numerical_Study_on_Aerodynamic_Characteristics_of_Kline-Fogleman_Airfoil_and_Its_3D_Application_at_Low_Reynolds_Number.pdf
%and https://people.eng.unimelb.edu.au/imarusic/proceedings/19/395.pdf 

%flying speed
    v = sqrt((2*wing_load)/(C_Lreq * roh_inf));
    
%% stability calculations

%horz tail volume
    s_h = 2* horz_h * horz_l; %planform area of horz stab
    ac = .25*horz_h; %aerodynamic center measured from the front of the horz stab
    ac_dist = x_cg_horz - horz_h + ac; % distance from cg and aerodynamic center of horz stab
    Vol_H = (s_h * ac_dist)/(s_ref*c); 
    fprintf('Vol_H: %f \n',Vol_H);
%     C_L_tail = ; % 
% vertical tail volume
    s_v = vert_h*vert_l; %planform area vert stab
    ac_v =  .25*vert_l; %aerodynamic center from the front of the vert stab
    ac_v_dist = x_cg_vert - vert_l + ac_v; % distance from cg and aerodynamic center of vert stab
    Vol_v = (s_v*ac_v_dist)/(s_ref*b);
    fprintf('Vol_v: %f \n',Vol_v);
    
% %moment calculation 
%     C_m_cg = 0; %coefficient of moment for cg (assuming 0 for trimmed flight)
%     %INSERT VALUE HERE
%     C_m_ac_w = ; %coefficient of moment for aerodynamic center of wing
%     C_L_wing = C_Lreq; %coefficient of lift, wing 
%     ac_wing = .25*c; %aerodynamic center of wing measured from front of wing
%     dist_mom = (x_cg/c) - (.25*c)/c; 
%     
    
%  %Solve for C_L_ht:
%  syms C_L_htsm; 
%    
%  C_Lhteq = C_m_cg  == C_m_ac_w + C_L_wing*(dist_mom)- Vol_H*(C_L_htsm); 
%  
%  
% C_L_ht = double(solve(CLhteq,C_L_htsm)); 
% 
% 
% %Enter the required tail angle of attack for trimmed flight: 
% alpha_tail = ; 
% 
% %Incident angle for the tail: 
% it = aoa - alpha_tail; 
% 

%% polyhederial 

    % ac_v_dist is the distance from cg and aerodynamic center of vert stab
    %b is span 

    B = 5; %stability factor
    gamma = (B*b*C_Lreq)/(ac_v_dist); %solves for the angle of dihedrial needed








    
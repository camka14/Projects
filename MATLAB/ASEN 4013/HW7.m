clear,clc

pi_dmax= 0.95;
T0 = 217;
gamma_c = 1.4;
Cpc = 1.004;
pi_b = 0.94;
gamma_t = 1.3;
Cpt = 1.235;
pi_n = 0.95;
P0_P9 = 1;
Tt4 = 1800;
h_pr = 42800;
neub = 0.96;
M0 = 3;

neur = (1-0.075*(M0-1)^1.35);
pi_d = pi_dmax * neur;

Tau_r = 1 + (gamma_c -1)/2 * M0^2;
pi_r = (1 + (gamma_c -1)/2 * M0^2)^(gamma_c/(gamma_c-1));
Tt3= T0 * Tau_r;
ht4 = 2116.5454;
ht3 = 614.8069;
f = (ht4-ht3)/(neub*h_pr-ht4);
Rc = (gamma_c-1)/gamma_c*Cpc*1000;
Rt = (gamma_t-1)/gamma_t*Cpt*1000;
Pt9_P9 = P0_P9 * pi_r * pi_d * pi_b * pi_n;

a0 = sqrt(gamma_c*Rc*T0);

V0 = M0*a0;

T9_T0 = (Tt4/T0)/(Pt9_P9)^((gamma_t-1)/gamma_t);

M9 = sqrt(2/(gamma_t-1)*((Pt9_P9)^((gamma_t-1)/gamma_t)-1));

V9_a0 = M9*sqrt((gamma_t*Rt/(gamma_c*Rc))*T9_T0);

F_m0 = a0*((1+f)*V9_a0-M0);

S = f/F_m0;

neup = (2*V0*F_m0)/(a0^2*((1+f)*V9_a0^2-M0^2))*100;

neuth = (a0^2*((1+f)*V9_a0^2-M0^2))/(2*f*h_pr*1000)*100;

V9_V0 = V9_a0/M0;


%%
clear,clc

f = 0.01714;
cp_c = 0.24;
cp_t = 0.276;
g_t = 1.33;
et = 0.9;
g_c = 1.4;
tau_r = 1.128;
tau_l = 7.136;
tau_c = 3.119;
alpha = 8;
tau_f = 1.1744;
pi_r = 1.5243;
pi_d = 0.99;
pi_c = 36;
pi_b = 0.96;
pi_n = 0.99;
pi_fn = 0.99;
pi_f = 1.65;
neu_m = 0.99;
Rc = 53.36;
Rt = 53.29;
Tt4 = 2420;
T0 = 390;
M9 = 0.7271;
a0 = 968.2;
gc = 32.2;
M0 = 0.8;


tau_t = 1-(1/(neu_m*(1+f)) * tau_r/tau_l * (tau_c-1+alpha*(tau_f-1)));

pi_t = tau_t^(g_t/((g_t-1)*et));

% Pt9_P9 = ((g_t+1)/2)^(g_t/(g_t-1));

Pt9_P9 = pi_r*pi_d*pi_c*pi_b*pi_t*pi_n;

T9_T0 = tau_l*tau_t*cp_c/(Pt9_P9^((g_t-1)/g_t)*cp_t);

M9 = sqrt(2/(g_t-1)*(Pt9_P9^((g_t-1)/g_t)-1));

V9_a0 = M9*sqrt((g_t*Rt)/(g_c*Rc)*(T9_T0));

Pt19_P19 = ((g_c+1)/2)^(g_c/(g_c-1));

P0_P19 = Pt19_P19/(pi_r*pi_d*pi_f*pi_fn);

P0_P9 = 1;

M19 = 1;%sqrt( (2/(g_c-1)) * (Pt19_P19^((g_c-1)/g_c) - 1) );

T19_T0 = tau_r*tau_f/(Pt19_P19)^((g_c-1)/g_c);

V19_a0 = M19*sqrt(T19_T0);

F_m0 = 1/(1+alpha)*a0/gc*((1+f)*V9_a0-M0+(1+f)*(Rt*T9_T0/(Rc*V9_a0)*(1-P0_P9)/g_c))+alpha/(1+alpha)*a0/gc*(V19_a0-M0+T19_T0/V9_a0*(1-P0_P19)/g_c)

S = f/((1+alpha)*F_m0)*3600










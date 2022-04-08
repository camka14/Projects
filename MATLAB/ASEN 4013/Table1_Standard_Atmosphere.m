% -------------------------------------------------------------------------
% --------------------- Standard Atmosphere ------------------------
% -------------------------------------------------------------------------

lwd = 1.5; mks = 11; fsz=20; fszt=24; fw='b'; fwt='b'; d2r=pi/180; R=287;

Tref=288.15; % in K
pref=101325; % in Pa
rhoref=1.225; % in kg/m^3
aref=340.294; % in m/s

hmax=80000; % Select maximum height in meters (< 84852)
hint=100; % Select the interval in meters

h=0:hint:hmax; % height in m
nn=length(h);

T=zeros(size(h));
p=zeros(size(h));
rho=zeros(size(h));
a=zeros(size(h));

for n=1:nn
    [T(n), a(n), p(n), rho(n)]=atmoscoesa(h(n));
end

figure(1)
subplot(1,2,1)
plot(T,h/1000,'b','linewidth',lwd);hold on;
set(gca,'xlim',[190 300],'xtick',[190:10:300],'fontsize',fsz);grid on;
set(gca,'ylim',[0 80],'ytick',[0:5:80],'fontsize',fsz)
xlabel('Temperature (K) ');set(gca,'ycolor','black','fontsize',fsz);
ylabel('Height (km)');set(gca,'ycolor','black','fontsize',fsz);
title('Standard Atmosphere - Temperature','fontsize',fszt);
text(270, 5,'Troposphere','fontsize',fsz);
text(218,15,'Tropopause ','fontsize',fsz);
text(240,32,'Stratosphere ','fontsize',fsz);
text(272,49,'Stratopause ','fontsize',fsz);
text(230,70,'Mesosphere ','fontsize',fsz);

subplot(1,2,2)
plot(a,h/1000,'b','linewidth',lwd);hold on;
set(gca,'xlim',[280 340],'xtick',[280:5:340],'fontsize',fsz);grid on;
set(gca,'ylim',[0 80],'ytick',[0:5:80],'fontsize',fsz)
xlabel('Sound Speed (m/s) ');set(gca,'ycolor','black','fontsize',fsz);
ylabel('Height (km)');set(gca,'ycolor','black','fontsize',fsz);
title('Standard Atmosphere - Sound Speed','fontsize',fszt);
text(290, 5,'Troposphere','fontsize',fsz);
text(297,15,'Tropopause ','fontsize',fsz);
text(310,32,'Stratosphere ','fontsize',fsz);
text(314,49,'Stratopause ','fontsize',fsz);
text(300,70,'Mesosphere ','fontsize',fsz);

% ---- Generate Table of Values ----

Table=1;
if (Table==1)
    % Absolute values
    A=[h;T;p;rho;a];
    fprintf('\n\n%10s %8s %10s %11s %7s\n\n',' Height(m)','T(K)','p(Pa)',' rho(kg/m^3)','a(m/s)');
    fprintf('%10.0f %10.2f %10.1f %10.4f %10.1f\n',A)
    fprintf('\n%10s %8s %10s %11s %7s\n\n',' Height(m)','T(K)','p(Pa)',' rho(kg/m^3)','a(m/s)');
    % Values normalized by reference values
    T=T/Tref; p=p/pref; rho=rho/rhoref;a=a/aref;
    A=[h;T;p;rho;a];
    fprintf('\n\n%10s %8s %10s %14s %10s\n\n','Height(m)','T/T_ref','p/p_ref','rho/rho_ref','a/a_ref');
    fprintf('%10.0f %8.4f %12.4e %12.4e %12.4e\n',A)
    fprintf('\n%10s %8s %10s %14s %10s\n\n',' Height(m)','T/T_ref','p/p_ref','rho/rho_ref','a/a_ref');
    fprintf('\n%20s %20s %20s %20s \n','T_ref = 288.15 K, ','p_ref = 101,325 Pa, ','rho_ref = 1.225 kg/m^3');
    fprintf('\n%20s \n\n','a_ref = 340.294 m/s');
end
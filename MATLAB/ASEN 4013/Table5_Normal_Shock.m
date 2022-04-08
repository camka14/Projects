% -------------------------------------------------------------------------
% --------------------- Normal Shock ---------------------------------
% -------------------------------------------------------------------------

lwd = 1.5; mks = 11; fsz=20; fszt=24; fw='b'; fwt='b'; d2r=pi/180; R=287;

gam=1.4; % Choose the value of specific heat ratio
Mmax=10; % Choose maximum value of Mach number
Mint=0.01; % Choose the interval

M=1:Mint:Mmax;
np=length(M);
M2=zeros(size(M));
Tt2byTt1=zeros(size(M));
pt2bypt1=zeros(size(M));
T2byT1=zeros(size(M));
p2byp1=zeros(size(M));
r2byr1=zeros(size(M));

for n=1:np
    M2(n)=( M(n)*M(n)+(2/(gam-1)) )/((2*gam/(gam-1))*M(n)*M(n)-1);
    M2(n)=sqrt(M2(n));
    Tt2byTt1(n)=1;
    T2byT1(n)=2*(gam-1)*(1+0.5*(gam-1)*M(n)*M(n))*((2*gam/(gam-1))*M(n)*M(n)-1) ...
        /((gam+1)*M(n))^2;
    p2byp1(n)=1+(2*gam/(gam+1))*(M(n)*M(n)-1);
    pt2bypt1(n)=( 0.5*(gam+1)*M(n)*M(n)/(1+0.5*(gam-1)*M(n)*M(n)) )^(gam/(gam-1)) ...
        /( (2*gam/(gam+1))*M(n)*M(n)-((gam-1)/(gam+1)) )^(1/(gam-1));
    r2byr1(n)=p2byp1(n)/T2byT1(n);
end

figure(7)
subplot(2,1,1)
plot(M,M2,'b','linewidth',lwd);hold on;
plot(M,pt2bypt1,'b','linewidth',lwd);hold on;
plot(M,Tt2byTt1,'b','linewidth',lwd);hold on;
set(gca,'xlim',[1 Mmax],'xtick',[1:0.5:Mmax],'fontsize',fsz);grid on;
set(gca,'ylim',[0 1.02],'ytick',[0:0.1:1],'fontsize',fsz)
xlabel('M_1');set(gca,'ycolor','black','fontsize',fszt);
ylabel('M_2 T_{t2}/T_{t1} p_{t2}/p_{t1}');set(gca,'ycolor','black','fontsize',fszt);
title('Normal Shock','fontsize',fszt);
text(7.0,0.45,'M_2 ','fontsize',fsz);
text(7.0,0.08,'p_{t2}/p_{t1} ','fontsize',fsz);
text(7.0,0.92,'T_{t2}/T_{t1} ','fontsize',fsz);

%figure(8)
subplot(2,1,2)
plot(M,T2byT1,'b','linewidth',lwd); hold on;
plot(M,p2byp1,'b','linewidth',lwd); hold on;
plot(M,r2byr1,'b','linewidth',lwd); hold on;
set(gca,'xlim',[1 Mmax],'xtick',[1:0.5:Mmax],'fontsize',fsz);grid on;
set(gca,'ylim',[0 20],'ytick',[0:2:20],'fontsize',fsz)
xlabel('M_1');set(gca,'ycolor','black','fontsize',fszt);
ylabel('T_2/T_1 p_2/p_1 \rho_2/\rho_1');set(gca,'ycolor','black','fontsize',fszt);
%title('Normal Shock','fontsize',fszt);
text(7.0,7.0,'\rho_2/\rho_1 ','fontsize',fsz);
text(6.5,12,'T_2/T_1 ','fontsize',fsz);
text(3.8,14,'p_2/p_1 ','fontsize',fsz);

% ------ Generate Table of Values ------

Table=1;
if (Table==1)
    A=[M; M2; T2byT1; p2byp1; r2byr1; pt2bypt1];
    fprintf('\n\n%4s %5s %9s %10s %12s %8s\n\n',' M1','M2','T2/T1',' p2/p1','rho2/rho1','pt2/pt1');
    fprintf('%5.2f %5.2f %10.4e %10.4e %10.4e %10.4e\n',A)
    fprintf('\n%4s %5s %9s %10s %12s %8s\n\n',' M1','M2','T2/T1',' p2/p1','rho2/rho1','pt2/pt1');
end
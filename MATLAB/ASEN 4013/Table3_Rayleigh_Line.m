% ------------------------------------------------------------------------
% --------------------- Rayleigh Line --------------------------------
% ------------------------------------------------------------------------

lwd = 1.5; mks = 11; fsz=20; fszt=24; fw='b'; fwt='b'; d2r=pi/180; R=287;

gam=1.4; % Choose the value of specific heat ratio

Mmax=2; % Choose maximum value of Mach number
Mint=0.02; % Choose the interval
M=0:Mint:Mmax;
nn=length(M);

fM2=zeros(size(M));
TtbyTts=zeros(size(M));
ptbypts=zeros(size(M));
TbyTs=zeros(size(M));
pbyps=zeros(size(M));

for n=1:nn
    fM2(n)=(1+0.5*(gam-1)*M(n)*M(n))*M(n)*M(n)/((1+gam*M(n)*M(n))^2);
    TtbyTts(n)=2*(gam+1)*M(n)*M(n)*(1+0.5*(gam-1)*M(n)*M(n))/((1+gam*M(n)*M(n))^2);
    TbyTs(n)=( (gam+1)*M(n)/(1+gam*M(n)*M(n)) )^2;
    pbyps(n)=(gam+1)/(1+gam*M(n)*M(n));
    ptbypts(n)=pbyps(n)*( 2*(1+0.5*(gam-1)*M(n)*M(n))/(gam+1) )^(gam/(gam-1));
end

figure(3)
plot(M,fM2,'k','linewidth',lwd);
set(gca,'xlim',[0 5],'xtick',[0:0.5:5],'fontsize',fsz);grid on;
set(gca,'ylim',[0 0.25],'ytick',[0:0.05:0.25],'fontsize',fsz)
xlabel('Mach Number M');set(gca,'ycolor','black','fontsize',fsz);
ylabel('f (M^2)');set(gca,'ycolor','black','fontsize',fsz);
title('Constant Area Duct with Heating','fontsize',fszt);

figure(4)
plot(M,TtbyTts,'b','linewidth',lwd);hold on;
plot(M,TbyTs,'r','linewidth',lwd); hold on;
plot(M,ptbypts,'k','linewidth',lwd);hold on;
plot(M,pbyps,'b','linewidth',lwd);
set(gca,'xlim',[0 5],'xtick',[0:0.5:5],'fontsize',fsz);grid on;
set(gca,'ylim',[0 5],'ytick',[0:0.5:5],'fontsize',fsz)
xlabel('Mach Number M');set(gca,'ycolor','black','fontsize',fsz);
ylabel('T/T_*, T_t/T_{t*}, p/p_*, p_t/p_{t*}');set(gca,'ycolor','black','fontsize',fsz);
title('Constant Area Duct with Heating','fontsize',fszt);
text(0.5,2.0,'p/p_* ','fontsize',fsz);
text(1.7,0.2,'p/p_* ','fontsize',fsz);
text(2.9,3.0,'p_{t}/p_{t*} ','fontsize',fsz);
text(0.2,1.3,'p_{t}/p_{t*} ','fontsize',fsz);
text(0.15,0.7,'T/T_* ','fontsize',fsz);
text(0.7,0.7,'T_t/T_{t*} ','fontsize',fsz);
text(4.0,0.2,'T/T_* ','fontsize',fsz);
text(4.0,0.7,'T_t/T_{t*} ','fontsize',fsz);

% ---- Generate Table of Values ----

Table=1;
if (Table==1)
    A=[M; fM2; TtbyTts; TbyTs; ptbypts; pbyps];
    fprintf('\n\n%4s %9s %11s %9s %11s %9s\n\n','M','phi','Tt/Tt*',' T/T*','pt/pt*','p/p*');
    fprintf('%5.2f %10.6f %10.6f %10.6f %10.6f %10.6f\n',A)
    fprintf('\n%4s %9s %11s %9s %11s %9s\n\n','M','phi','Tt/Tt*',' T/T*','pt/pt*','p/p*');
end
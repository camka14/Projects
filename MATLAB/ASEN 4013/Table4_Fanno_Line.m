% ------------------------------------------------------------------------
% --------------------- Fanno Line --------------------------------
% ------------------------------------------------------------------------

lwd = 1.5; mks = 11; fsz=20; fszt=24; fw='b'; fwt='b'; d2r=pi/180; R=287;

gam=1.4; % Choose the value of specific heat ratio

Mmax=5; % Choose maximum value of Mach number
Mint=0.02; % Choose the interval
M=0:Mint:Mmax;
nn=length(M);

phiM2=zeros(size(M));
TtbyTts=zeros(size(M));
ptbypts=zeros(size(M));
TbyTs=zeros(size(M));
pbyps=zeros(size(M));

for n=1:nn
    phiM2(n)=(1-M(n)*M(n))/(gam*M(n)*M(n)) ...
        + (0.5*(gam+1)/gam)*log( 0.5*(gam+1)*M(n)*M(n)/(1+0.5*(gam-1)*M(n)*M(n)) );
    TtbyTts(n)=1;
    TbyTs(n)=0.5*(gam+1)/(1+0.5*(gam-1)*M(n)*M(n));
    pbyps(n)=sqrt(TbyTs(n))/M(n);
    ptbypts(n)=(1/M(n))*( 2*(1+0.5*(gam-1)*M(n)*M(n))/(gam+1) )^(0.5*(gam+1)/(gam-1));
end

figure(5)
plot(M,phiM2,'k','linewidth',lwd);
set(gca,'xlim',[0 5],'xtick',[0:0.5:5],'fontsize',fsz);grid on;
set(gca,'ylim',[0 5],'ytick',[0:0.5:5],'fontsize',fsz)
xlabel('Mach Number M');set(gca,'ycolor','black','fontsize',fsz);
ylabel('\phi (M^2)');set(gca,'ycolor','black','fontsize',fsz);
title('Constant Area Duct with Friction','fontsize',fszt);

figure(6)
plot(M,TtbyTts,'k','linewidth',lwd);hold on;
plot(M,TbyTs,'r','linewidth',lwd); hold on;
plot(M,ptbypts,'b','linewidth',lwd);hold on;
plot(M,pbyps,'g','linewidth',lwd);
set(gca,'xlim',[0 5],'xtick',[0:0.5:5],'fontsize',fsz);grid on;
set(gca,'ylim',[0 5],'ytick',[0:0.5:5],'fontsize',fsz)
xlabel('Mach Number M');set(gca,'ycolor','black','fontsize',fsz);
ylabel('T/T_*, T_t/T_{t*}, p/p_*, p_t/p_{t*}');set(gca,'ycolor','black','fontsize',fsz);
title('Constant Area Duct with Friction','fontsize',fszt);
text(0.6,2.0,'p/p_* ','fontsize',fsz);
text(1.7,0.3,'p/p_* ','fontsize',fsz);
text(2.7,3.0,'p_{t}/p_{t*} ','fontsize',fsz);
text(0.1,1.5,'p_{t}/p_{t*} ','fontsize',fsz);
text(0.2,1.2,'T/T_* ','fontsize',fsz);
text(4.0,0.3,'T/T_* ','fontsize',fsz);
text(4.0,1.1,'T_t/T_{t*} ','fontsize',fsz);

% ---- Generate Table of Values ----

Table=1;
if (Table==1)
    A=[M; fM2; TbyTs; ptbypts; pbyps];
    fprintf('\n\n%4s %9s %10s %11s %9s\n\n','M','phi',' T/T*','pt/pt*','p/p*');
    fprintf('%5.2f %10.6f %10.6f %10.6f %10.6f\n',A)
    fprintf('\n%4s %9s %10s %11s %9s\n\n','M','phi',' T/T*','pt/pt*','p/p*');
end
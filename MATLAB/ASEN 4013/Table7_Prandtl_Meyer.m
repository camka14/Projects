% ------------------------------------------------------------------------------------
% --------------------- Prandtl-Meyer Function --------------------------------
% ------------------------------------------------------------------------------------

lwd = 1.5; mks = 11; fsz=20; fszt=24; fw='b'; fwt='b'; d2r=pi/180; R=287;

gam=1.4; % Choose the value of specific heat ratio

for rng=1:2
    Mmax=10; % Choose maximum value of Mach number
    Mint=0.05; % Choose the interval
    if(rng==2)
        Mmax=100; Mint=0.05;
    end
    M=[1:Mint:Mmax];
    
    nn=length(M);
    nu=zeros(size(M));
    mu=zeros(size(M));
    Tt2byTt1=zeros(size(M));
    pt2bypt1=zeros(size(M));
    T2byT1=zeros(size(M));
    p2byp1=zeros(size(M));
    r2byr1=zeros(size(M));
    
    figure(9)
    subplot(2,1,rng)
    for n=1:nn
        ang1=atan(sqrt(M(n)^2-1));
        ang2=atan(sqrt((M(n)^2-1)*(gam-1)/(gam+1)));
        nu(n)=sqrt((gam+1)/(gam-1))*ang2-ang1;
        nu(n)=nu(n)/d2r;
        mu(n)=asin(1/M(n))/d2r;
        % Tt2byTt1(n)=1;
        % pt2bypt1(n)=1;
        % T2byT1(n)=(1+0.5*(gam-1)*M(n)^2)/(1+0.5*(gam-1)*M2(n)^2);
    end
    if(rng==1)
        plot(M,nu,'b','linewidth',lwd);hold on;
        plot(M,mu,'b','linewidth',lwd);hold on;
        set(gca,'xlim',[1 10],'xtick',[1:0.5:10],'fontsize',fsz);grid on;
        x0=[8 10];y0=[130.2 130.2]; plot(x0,y0,'k','linewidth',lwd);hold on;
        % text(6.5,130.2,'M2 = \infty','fontsize',fszt);
        text(8,107,'\nu (deg)','fontsize',fszt);
        text(8,15,'\mu (deg)','fontsize',fszt);
        text(6.5,130.2,'M2 = \infty','fontsize',fszt);
        set(gca,'ylim',[0 135],'ytick',[0:10:130],'fontsize',fsz)
        xlabel('Mach Number ');set(gca,'ycolor','black','fontsize',fszt);
        title('Prandtl-Meyer Function','fontsize',fszt);
    else
        semilogx(M,nu,'b','linewidth',lwd);hold on;
        semilogx(M,mu,'b','linewidth',lwd);hold on;
        set(gca,'xlim',[1 100],'fontsize',fsz);grid on;
        x0=[50 100];y0=[130.2 130.2]; semilogx(x0,y0,'k','linewidth',lwd);hold on;
        text(25,130.2,'M2 = \infty','fontsize',fszt);
        text(40,115,'\nu (deg)','fontsize',fszt);
        text(40,15,'\mu (deg)','fontsize',fszt);
        set(gca,'ylim',[0 135],'ytick',[0:10:130],'fontsize',fsz)
        xlabel('Mach Number ');set(gca,'ycolor','black','fontsize',fszt);
        % title('Prandtl-Meyer Function','fontsize',fszt);
    end
    
    % ------ Generate Table of Values ------
    
    Table=1;
    if (Table==1 & rng==1)
        A=[M; nu; mu];
        fprintf('\n\n%4s %6s %6s\n\n',' M',' nu(deg)',' mu(deg)');
        fprintf('%5.2f %8.3f %8.3f\n',A)
        fprintf('\n%4s %6s %6s\n\n',' M',' nu(deg)',' mu(deg)');
    end
end
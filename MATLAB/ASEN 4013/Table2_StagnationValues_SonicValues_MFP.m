% ----------------------------------------------------------------------------------------
% -------- Stagnation and Sonic values and Mass Flow Parameter ------------
% ----------------------------------------------------------------------------------------
lwd = 1.5; mks = 11; fsz=20; fszt=24; fw='b'; fwt='b'; d2r=pi/180; R=287;

R = 287;
Mmax=5;     % Choose maximum value of Mach number
Mint=0.02;  % Choose the interval
M=[0:Mint:Mmax];
nn=length(M);

MFP=zeros(size(M));
AbyAs=zeros(size(M));
TtbyT=zeros(size(M));
ptbyp=zeros(size(M));
rtbyr=zeros(size(M));
TbyTs=zeros(size(M));
pbyps=zeros(size(M));
rbyrs=zeros(size(M));

for m=1:3
    if(m==1)
        gam=1.4; col='-b'; clt='b'; txt='\gamma = 1.4';
        txtxl=2.4; txtyl=0.3; txtxr=3.0; txtyr=4;
    end
    if(m==2)
        gam=1.33; col='-.k'; clt='k'; txt='\gamma = 1.33';
        txtxl=2; txtyl=0.2; txtxr=2.4; txtyr=5;
        txtt=3.0; tytt=1.e3; txts=3.0; tyts=1.0;
    end
    if(m==3)
        gam=1.3; col='--r'; clt='r'; txt='\gamma = 1.3';
        txtxl=2.6; txtyl=0.1; txtxr=2.55; txtyr=6;
        txtt=3.0; tytt=1.e3; txts=3.0; tyts=1.0;
    end
    
    for n=1:nn
        MFP(n)=sqrt(gam)*M(n)*(1+0.5*(gam-1)*M(n)*M(n))^(-0.5*(gam+1)/(gam-1));
        AbyAs(n)=(1/M(n))*(2*(1+0.5*(gam-1)*M(n)*M(n))/(gam+1))^(0.5*(gam+1)/(gam-1));
        TtbyT(n)=1+0.5*(gam-1)*M(n)^2;
        ptbyp(n)=TtbyT(n)^(gam/(gam-1));
        rtbyr(n)=ptbyp(n)/TtbyT(n);
        TbyTs(n)=2*(1+0.5*(gam-1)*M(n)^2)/(gam+1);
        TbyTs(n)=1/TbyTs(n);
        pbyps(n)=TbyTs(n)^(gam/(gam-1));
        rbyrs(n)=pbyps(n)/TbyTs(n);
    end
    % if(m==1)
    % [M(31) M(43) M(51)]
    % [MFP(31) MFP(43) MFP(51)] % print MFP for M = 0.6, 0.85, 1.0
    % end
    
    figure(2)
    subplot(1,2,1)
    plot(M,MFP,col,'linewidth',lwd); hold on;
    % text(txtxl,txtyl,txt,'fontsize',fsz);
    set(gca,'xlim',[0 4],'xtick',[0:0.5:4],'fontsize',fsz);grid on;
    set(gca,'ylim',[0 0.7],'ytick',[0:0.1:0.7],'fontsize',fsz)
    xlabel('Mach Number M');set(gca,'ycolor','black','fontsize',fsz);
    ylabel('MFP\surd R');set(gca,'ycolor','black','fontsize',fsz);
    title('Mass Flow Parameter','fontsize',fszt);
    text(2.5,0.6,'solid - \gamma = 1.4','fontsize',fsz);
    text(2.5,0.55,'dotdash - \gamma = 1.33','fontsize',fsz);
    text(2.5,0.5,'dash - \gamma = 1.3','fontsize',fsz);
    
    subplot(1,2,2)
    plot(M,AbyAs,col,'linewidth',lwd); hold on;
    % text(txtxr,txtyr,txt,'fontsize',fsz);
    set(gca,'xlim',[0 4],'xtick',[0:0.5:4],'fontsize',fsz);grid on;
    set(gca,'ylim',[0 10],'ytick',[0:1:10],'fontsize',fsz)
    xlabel('Mach Number M');set(gca,'ycolor','black','fontsize',fsz);
    ylabel('A/A_*');set(gca,'ycolor','black','fontsize',fsz);
    title('Area Ratio','fontsize',fszt);
    text(1,8.0,'solid - \gamma = 1.4','fontsize',fsz);
    text(1,7.5,'dotdash - \gamma = 1.33','fontsize',fsz);
    text(1,7.0,'dash - \gamma = 1.3','fontsize',fsz);
    
    figure(3)
    semilogy(M,TtbyT,col,'linewidth',lwd); hold on;
    semilogy(M,ptbyp,col,'linewidth',lwd); hold on;
    semilogy(M,rtbyr,col,'linewidth',lwd); hold on;
    set(gca,'xlim',[0 Mmax],'xtick',[0:0.5:Mmax],'fontsize',fsz);grid on;
    %set(gca,'ylim',[0 0.7],'ytick',[0:0.1:0.7],'fontsize',fsz)
    xlabel('Mach Number M');set(gca,'ycolor','black','fontsize',fsz);
    ylabel('T_t/T p_t/p \rho_t/\rho ');set(gca,'ycolor','black','fontsize',fsz);
    title('Stagnation Values','fontsize',fszt);
    text(0.5,200,'solid - \gamma = 1.4','fontsize',fsz);
    text(0.5,120,'dotdash - \gamma = 1.33','fontsize',fsz);
    text(0.5,70,'dash - \gamma = 1.3','fontsize',fsz);
    text(3.5,160,'T_t/T ','fontsize',fsz);
    text(3.5,15,'\rho_t/\rho ','fontsize',fsz);
    text(3.5,2,'p_t/p','fontsize',fsz);
    
    figure(4)
    plot(M,TbyTs,col,'linewidth',lwd); hold on;
    plot(M,pbyps,col,'linewidth',lwd); hold on;
    plot(M,rbyrs,col,'linewidth',lwd); hold on;
    set(gca,'xlim',[0 Mmax],'xtick',[0:0.5:Mmax],'fontsize',fsz);grid on;
    set(gca,'ylim',[0 2],'ytick',[0:0.2:2],'fontsize',fsz)
    xlabel('Mach Number M');set(gca,'ycolor','black','fontsize',fsz);
    ylabel('T/T_s p/p_s \rho/\rho_s ');set(gca,'ycolor','black','fontsize',fsz);
    title('Sonic Values','fontsize',fszt);
    text(3,1.4,'solid - \gamma = 1.4','fontsize',fsz);
    text(3,1.3,'dotdash - \gamma = 1.33','fontsize',fsz);
    text(3,1.2,'dash - \gamma = 1.3','fontsize',fsz);
    text(3,0.54,'T/T_s','fontsize',fsz);
    text(2.3,0.3,'\rho/\rho_s','fontsize',fsz);
    text(1.7,0.2,'p/p_s','fontsize',fsz);
    
% ------ Generate Table of Values ------
    
    Table=1;
    if (Table==1)
        A=[M; AbyAs; MFP; TtbyT; ptbyp; rtbyr; TbyTs; pbyps; rbyrs];
        fprintf('\n\n%38s %4.2f',' gamma =',gam);
        fprintf('\n\n%4s %9s %16s %9s %12s %14s %9s %12s %14s\n\n', ...
            'M','A/A*','MFP*sqrt(R)','Tt/T','pt/p','rhot/rho','T/Ts','p/ps','rho/rhos');
        fprintf('%5.2f %12.5e %12.5e %12.5e %12.5e %12.5e %12.5e %12.5e %12.5e\n',A)
        fprintf('\n%4s %9s %16s %9s %12s %14s %9s %12s %14s\n', ...
            'M','A/A*','MFP*sqrt(R)','Tt/T','pt/p','rhot/rho','T/Ts','p/ps','rho/rhos');
    end
end
function [  ] = WingAnalysisFunction( Cl,Cd,RC,TC,TS,RPM,Dia,P,S,Span,M,g,p,KV,OptFS,CR)
%Used to find the stall and optimal flightspeed
%Input in order, Span, Tip Span, Root Chord, Tip Chord, Take off Weight,
%Constant for gravity, Air density, and Kinematic Viscocity.
if OptFS>0 %Given an optimal flight speed
    x=0;
    y=0;
    for Span=0.1:0.05:10;
        y=y+1;
        for MAC=0.01:0.01:0.5
            x=x+1;
            S=Span*MAC;
            V1=sqrt(2*M*g./(p*S.*Cl));
            AR=Span^2/S;
            Cd0=min(Cl.^2./(pi*.7*AR));
            Cd=Cd0+Cid;
            D=Cd*1/2*p.*V1.^2*S;
            [MinD,I]=min(D);
            V2(x,y)=V1(I);
            SA(x,y)=S;
            SP(x,y)=Span;
        end
        x=0;
    end
    dif=abs(V2-OptFS);
    [mindif,I]=min(dif(:));
    [I_row,I_col]=ind2sub(size(dif),I);
    S=SA(I_row,I_col);
    Span=SP(I_row,I_col);
    MAC=S/Span;
    ReOpt=OptFS*MAC/KV;
    fprintf('Reynolds number \nat optimal flight speed= %.2f\n\n',ReOpt)
    fprintf('Span = %.2f m and Mean Aerodynamic Chord = %.2f m\n\n', Span,MAC)
else %Given Dimensions of aircraft
    if RC>0
        S=Span/2*RC+(RC+TC)*TS %Finds surface area when given correct parameters
    end
    MAC=S/Span; %Finds mean aerodynamic cord
    fprintf('Mean aerodynamic chord = %.2f m\n\n', MAC)
    
    AR=Span^2/S; %Finds the aspect ratio
    fprintf('Aspect ratio = %.2f m^4\n\n',AR)
    
    V=sqrt(2*M*g./(p*S.*Cl));
    D=Cd*1/2*p.*V.^2*S; %Total Drag
    [MinD,I]=min(D); %Selects minimum drag
    OptFS=V(I);
    OptFSMPH=OptFS*2.23694;
    fprintf('Optimal flight speed =%.2f m/s or %.2f MPH\n\n',OptFS,OptFSMPH)
    
    ReOpt=OptFS*MAC/KV;
    fprintf('Reynolds number \nat optimal speed = %.02f\n\n', ReOpt)
end
[ClMax,I1]=max(Cl); %Finds highest coefficient of lift

Stall=sqrt(2*M*g/(p*S*ClMax));%Finds stall speed
StallMPH=Stall*2.23694;
fprintf('Stall/Takeoff speed = %.2f m/s or %.2f MPH\n\n', Stall,StallMPH)

ReStall=Stall*MAC/KV; %Finds reynolds number at stall
fprintf('Reynolds number \nat stall speed = %.02f\n\n', ReStall)

RPMOpt=sqrt(OptFS+MinD)/(Dia^1.75*sqrt(.00000004392399)*sqrt(.000423333)*P^.25);
fprintf('RPM required for optimal flight speed =%.2f RPM\n\n',RPMOpt)

CdMax=Cd(I1); %Finds Cid at stall speeds

Ratio= CdMax/abs((ClMax^(3/2)));

PR=(CdMax*.5*p*S*OptFS^3+2/(pi*p*.7)*(M*g/Span)^2*1/OptFS)/.8/.75+CR*M*g; %Finds power required at take off /.8 for prop eff amd /.75 for 75% throttle
PRHP=PR/746; %Converts Watts to HP
fprintf('Power Required to takeoff = %.2f Watts or %.5f HP\n\n', PR, PRHP)

D=CdMax/.7*1/2*p*Stall^2;
fprintf('Drag force at takeoff = %.2f N\n\n', D)
if RPM>0
    F=.00000004392399*RPM*(Dia^3.5/sqrt(P))*(.000423333*RPM*P-Stall)-D;
    fprintf('Excess Thrust at takeoff = %.2f N\n\n', F)
    
    Dist=Stall^2/(2*F/M);
    fprintf('Takeoff Distance = %.2f m\n\n', Dist)
    
    MaxV=OptFS;
end
end
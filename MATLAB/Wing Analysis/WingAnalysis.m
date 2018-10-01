clear,clc
FileInput=dlmread('Cl and Cd.txt','\t');
Cl=FileInput(:,1);
Cd=FileInput(:,2);

RootChord=0; %m
TipChord=0; %m
TipSpan=0; %m

Area=0.8; %m^2 .8
Span=2.122; %m 2.122

OptimalFlightSpeed=0; %m/s 12.54

Mass=5; %kg
g=9.81; %m/s^2
p=1.225; %kg/m^3
KV=15.11*10^-6;
RPM=18000;
Diameter=12;
Pitch=6;
ClimbRate=4; %m/s

WingAnalysisFunction(Cl,Cd,RootChord,TipChord,TipSpan,RPM,Diameter,Pitch,Area,Span,Mass,g,p,KV,OptimalFlightSpeed,ClimbRate)
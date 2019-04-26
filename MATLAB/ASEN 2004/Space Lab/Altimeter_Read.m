clear,clc,close all

Data = xlsread('Altimeter Data.csv');

Time = Data(:,1);
Pres = Data(:,2);
Temp = Data(:,3);

alt = atmospalt(100*Pres);

maxAlt = max(alt)-min(alt);

plot(Time,alt-min(alt))
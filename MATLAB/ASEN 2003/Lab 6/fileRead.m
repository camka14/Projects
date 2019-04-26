function [x,t,vIn,tipDif] = fileRead(filename)
data = xlsread(filename);
t = data(:,1);
x = data(:,2);
tipDif = data(:,3);
vIn = data(:,7);
% HubOmega = data(4);
% tipV = data(5);
end
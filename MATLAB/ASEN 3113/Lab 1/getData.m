function [time,pres,TT,TB,BT,BB,I,opto] = getData(filename)
%getData gets the data from the given filename
data = xlsread(filename);

time = data(:,1);
pres = data(:,2)*6894.76+82.6e3;
TT = data(:,3);
BT = data(:,4);
TB = data(:,5);
BB = data(:,6);
I = data(:,7);
opto = data(:,8);
end


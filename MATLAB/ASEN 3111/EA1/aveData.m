function [y,delU,U1,U2,rho2] = aveData(yUp,yDo,VUp,VDo,rho)
% aveData Finds the average between the data sets, a lot of redundant steps
% since I changed some things but don't want anything to break

% Delta u at every point
delUTot = mean(VUp(1:10000))-VDo(1:10000);
count = length(delUTot)/500;
yTot = yDo;

% Averaging for each discrete step
for i = 1:count
    y(i) = mean(yTot(1+500*(i-1):500*i));
    delU(i) = mean(delUTot(i+500*(i-1):500*i));
    U2(i) = mean(VDo(i+500*(i-1):500*i));
    rho2(i) = mean(rho(i+500*(i-1):500*i));
end

% Cleaning up the data
Umax = max(delU(y<3 & y>-5));
y = y(delU<=Umax);
U2 = U2(delU<=Umax);
rho2 = rho2(delU<=Umax);
delU = delU(delU<=Umax);
rho2 = mean(rho2);
U1 = mean(VUp(1:10000));
end
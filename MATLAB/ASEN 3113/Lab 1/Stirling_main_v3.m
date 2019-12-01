clear,clc,close all

names = ["stirling8deg.csv","stirling10deg.csv","stirling12deg.csv"];
vertDisp = ["smallbottomfacedisp8deg.xlsx","smallbottomfacedisp10deg.xlsx","smallbottomfacedisp12deg.xlsx"];
holeDisp = ["holeangulardisp8deg.xlsx","holeangulardisp10deg.xlsx","holeangulardisp12deg.xlsx"];
titlename = {'8 deg','10 deg','12 deg'};

for j = 1:3
    clear time pres TT TB BT BB I opto
   [time,pres,TT,BT, TB,BB,I,opto] = getData(names(j));
   index = find(opto == 1,1);
   
   zeros = false;
   found = false;
   hole = 0;
   for i = index:numel(opto)
       if zeros == false
           if opto(i) == 0
               zeros = true;
           end
       else
           if opto(i) == 1
               hole = hole + 1;
               ind = i;
               found = true;
           elseif found == true && opto(i) == 0
               break
           end
       end
   end
   
   hole = ind - ceil(hole/2);
   
   area = 298.65;
   
   vertData = xlsread(vertDisp(j));
   holeData = xlsread(holeDisp(j));
   
%    time = vertData(:,2);
   dis = vertData(:,3);
   dis = dis-min(dis);
   disVol = dis*area*1e-9+1.73e-4;
   volTime = vertData(:,2);
   
   angle = holeData(:,3);
   angle = angle-min(angle); % degrees
   
   first = find(angle == 0,1);
   second = find(angle(first+1:end) < 8,1);
   time = time(index:hole);
   pres = pres(index:hole);
   volTime = volTime(first:first+second+1);
   volTime = volTime-min(volTime);
   volInter = interp1(volTime,disVol(first:first+second+1),time-min(time));
   
   name = titlename{j};
   figure
   plot(flipud(volInter),pres)
   xlabel('Volume [m^3]')
   ylabel('Pressure [Pa]')
   title(sprintf('Volume vs. Pressure %s',name))
   
   % net work
   Wnet(j) = polyarea(flipud(volInter),pres); %J
   % heat flow in
   power = I(index:hole) *  48; %W
   figure
   plot(time, power)
   xlabel('Time [sec]')
   ylabel('Power [W]')
   title(sprintf('Power vs. Time %s',name))
   Qin(j) = trapz(time, power); %J
   Qout(j) = Qin(j) - Wnet(j);
   
   %efficiency
   eff(j) = Wnet(j)/Qin(j) * 100;
   
  
end
TH = max(BT) + 273.15; %K
TL = min(TB) + 273.15; %K
minvol = min(volInter);
maxvol = max(volInter);
R = .287 ; %J/kg K

idealvol = [minvol; maxvol; maxvol; minvol; minvol];
idealpres = [ R * TH / minvol; R * TH / maxvol; R * TL / maxvol;  R * TL / minvol; R * TH / minvol];
figure
plot(idealvol, idealpres)
hold on
plot(flipud(volInter),pres)
xlabel('Volume [m^3]')
ylabel('Pressure [Pa]')
title('PV Diagram for Ideal vs Actual')






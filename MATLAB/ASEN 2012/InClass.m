clear,clc,close all

L = 0.1;
D = 0.01;
F = 1000;
E = 200e9;

Number = 10000;

SD_Force = 25;

Force = F + SD_Force*randn(1,Number);

radius = D/2;
secondMomArea = pi*radius^4/4;

deflection = Force.*L.^3./(3.*E.*secondMomArea);
deflection_mm = 1000*deflection;

SD_deflection = std(deflection_mm);
best_est = mean(deflection_mm);

figure
hist(deflection_mm,30)
xlabel('deflection(mm)');ylabel(['Frequency of ',num2str(Number),' sims'])
hold on; plot(best_est*[1 1], [0 Number/8], 'g'); ylim([0 Number/8])
text(min(deflection_mm),Number/10,['deflection=',num2str(best_est,'%1.2f'),'+/-', num2str(SD_deflection,'%1.2f')])
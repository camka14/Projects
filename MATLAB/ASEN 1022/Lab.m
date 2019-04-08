%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Group Names:
% 1. Samuel Razumovskiy
% 
% Group 12-01
% Author(s):
% Date written:
% Date modified:
% 
% Purpose:
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

set(groot, 'defaulttextinterpreter', 'latex');  
set(groot, 'defaultAxesTickLabelInterpreter', 'latex');  
set(groot, 'defaultLegendInterpreter', 'latex');

clear,clc,close all

[load1,strain1] = getData('Data1.csv');
[load2,strain2] = getData('brittleOriginal.csv');

cross1 = 0.1835*0.492;
cross2 =  0.1645*0.4975;

stress1 = load1./cross1;
stress2 = load2./cross2;

Ymod1 = stress1(133)/strain1(133)
Ymod2 = stress2(430)/strain2(430)

YstrengthLine1 = Ymod1.*(strain1-.002);
YstrengthLine2 = Ymod2.*(strain2-.002);

[~,I] = min(abs(YstrengthLine1 - stress1));
Ystrength1 = stress1(I)
[~,I] = min(abs(YstrengthLine2 - stress2));
Ystrength2 = stress2(I)

Tstrength1 = max(stress1)
Tstrength2 = max(stress2)
Fstress1 = stress1(end)
Fstress2 = stress2(end)

subplot(2,1,1);
grid on
scatter(strain1,stress1,15,'filled')
ylim([0 50000])
title('Specimen 1')
xlabel('Strain (\%)')
ylabel('Stress (psi)')
subplot(2,1,2);
grid on
scatter(strain2,stress2,15,'filled')
title('Specimen 2')
xlabel('Strain (\%)')
ylabel('Stress (psi)')
ylim([0 3e4])
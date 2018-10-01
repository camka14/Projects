clear,clc
Load=[0,2000,4000,6000,8000,10000]'; %lbf
area=pi*(.505)^2/4; %in^2
Length=[2.0000,2.0024,2.0047,2.0070,2.0128,2.0750]'; %in
strain=(Length-2.0000)./2.0000; %in/in
stress=Load./area; %psi
table(strain,stress)
plot(strain,stress)
title('Stress vs. Strain')
xlabel('Strain(in/in)')
ylabel('Stress(psi)')
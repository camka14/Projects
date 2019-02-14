%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Group Names:
% 1. Joey Derks
% 2. Michael Martinson
% 3. Harrison Methratta
% 4. Samuel Razumovskiy
% 5. Ian Thomas
% 6. Ruben Hinojosa Torres

% Group 12-01
% Author(s):
% Date written: 1/18/2019
% Date modified:
% 
% Purpose:
%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%LiftCurves.m

function [alpha, CL, Cl, Cd, a] = LiftCurves(filename,e,AR, ... 
    alphaCFD,CLCFD,CDCFD); 
%%
%Process Table 1 2D airfoil data: 
[Table1mat, txt, raw] = xlsread(filename); 

%2D angles of attack:
alpha = Table1mat(:,1);

%2D Cl values: 
Cl = Table1mat(:,2); 

%2D Cd values: 
Cd = Table1mat(:,3);

%%
%2D airfoil alpha vs Cl plotting: 
%Plot Cl and alpha to determine the best linear section to use for
%determining a: 

figure(1); 
plot(alpha,Cl,'LineWidth', 1.5);  
grid on; 
xticks([-5:15]); 
title('Lift Curve Comparison'); 
xlabel('$\alpha$'); 
ylabel('Coefficient of Lift'); 

%Fit a linear regression to determine the a0 value: 
p = polyfit(alpha(1:57),Cl(1:57),1);

%Plot the regression (Commented out):
% regCl = polyval(p,alpha(1:57)); 
% hold on;
% plot(alpha(1:57),regCl);

%Assign the lift curve slope for the 2D airfoil: 
a0 = p(1); 

%%
a = aEquation(a0, AR, e); 

%%
%CL calculation: 

%Determine the index for alpha at zero lift: 
 [~, IminabsCl]= min(abs(Cl)); 
 
 %Assign the alpha for zero lift: 
 alpha0L = alpha(IminabsCl); 
 
 
%Calculate CL for the 3D airfoil:
CL = a.*(alpha - alpha0L); 
 

%Plot Cl vs alpha on the same plot:  
hold on
plot(alpha,CL,'LineWidth', 1.5); 

%Plot Cl vs alpha from the CFD Data:
hold on

plot(alphaCFD, CLCFD,'LineWidth', 1.5); 

legend('2D Airfoil $C_l$','3D Wing $C_L$','CFD Data $C_L$'); 




end 


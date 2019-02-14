%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Group Names:
% 1. Joey Derks
% 2. Michael Martinson
% 3. Harrison Methratta
% 4. Samuel Razumovskiy
% 5. Ian Thomas
% 6. Ruben Hinojosa Torrez
% 
% Group 12-01
% Author(s): Ian Thomas, harrison Methratta
% Date written: 1/18/19
% Date modified: 1/18/19
% 
% Purpose:
% Drag Polar Comparison (CD vs. CL): Calculate and plot on the same figure 
% the estimated 3-D finite wing drag polar, whole aircraft drag polar and 
% the drag polar from the CFD data.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%dragPolarwithLD

function [CDarr, LDmax] = dragPolarwithLD(alpha, CLarr, Cl, Cdarr, a,... 
    Swet,Sref,Cfe,e,e0,AR,CFDalpha,CFDCL, CFDCD, k);

%% Define Variables

alphaL0 = interp1(CLarr, alpha, 0); % angle of attack at lift = 0 (degrees)

CDmin = Cfe * Swet / Sref;

% Calculations/Plotting
%% Wing Drag Polar

% Equation definition (3.3)
CDwingFunc = @(Cd, CL) Cd + (CL .^ 2) / (pi * e * AR);


CDwing = CDwingFunc(Cdarr, CLarr);
figure(2);
plot(CLarr, CDwing, 'LineWidth', 1.5);
title('Drag Polar Curves');
xlabel('$C_L$');
ylabel('$C_D$');
grid on;
hold on;

% Calculation of alphaWingMinD
[~, minIndex] = min(CDwing);
alphaWingMinD = alpha(minIndex);

% Calculation of CLminD
CLminD = a * (alphaWingMinD - alphaL0);

%% Whole aircraft drag polar

% Equation definition (3.4a)
CDFunc = @(CL) CDmin + k * (CL - CLminD).^2;

CDarr = CDFunc(CLarr);
plot(CLarr, CDarr, 'LineWidth', 1.5);

%% Plotting CFD Data

plot(CFDCL, CFDCD, 'LineWidth', 1.5);

legend('$C_{D_{wing}}$', '$C_D$ (whole aircraft)', '$C_D$ (CFD)');

%% Plot percent error
CLarrTemp = CLarr(CLarr <= 1);
CDarrTemp = CDarr(CLarr <= 1);

CFDCDtemp = interp1(CFDCL, CFDCD, CLarrTemp, 'PCHIP');
perDifArr = (CFDCDtemp - CDarrTemp)./CFDCDtemp * 100;
[~, uniqueIndices] = unique(CLarrTemp);
CLarrTemp = CLarrTemp(uniqueIndices);
perDifArr = perDifArr(uniqueIndices);

figure(3);
plot(CLarrTemp, perDifArr, 'LineWidth', 1.5);
xlabel('$C_L$');
ylabel('$\%$ Difference in $C_D$');
grid on;

%% L/D plot

figure(4);
LD_CFD = CFDCL./CFDCD;
LD_Temp = CLarr./CDarr;

LDmax = max(LD_Temp);

hold on;
grid on;

plot(CFDalpha, LD_CFD, 'Linewidth', 1.5);

plot(alpha,LD_Temp, 'Linewidth', 1.5);


xlabel('$\alpha$ [$^{\circ}$]');
ylabel('$\frac{C_L}{C_D}$');
title('Lift to Drag Ratio vs Angle of Attack')

legend('CFD', 'Calculations',...
    'Location', 'northwest')


end

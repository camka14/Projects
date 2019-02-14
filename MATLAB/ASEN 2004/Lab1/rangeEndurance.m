%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Group Names:
% 1. Joey Derks
% 2. Michael Martinson
% 3. Harrison Methratta
% 4. Samuel 
% 5. Ian Thomas
% 6. Ruben Hinojosa Torrez
% 
% Group 12-01
% Author(s): Ian Thomas
% Date written: 1/23/19
% Date modified: 1/23/19
% 
% Purpose:
% Calculation of max range and endurance
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [] = rangeEndurance(GTOW, altitude, alphas, CLarr, CDarr, ...
    CFDalphas, CFDCL, CFDCD, k, S)
%% Declaration of Variables
[~, ~, ~, rho] = atmoscoesa(altitude); % kg/m^3 from standard atmosphere

velFunc = @(C_L) sqrt((2 * GTOW * 9.81) ./ (C_L * rho * S));


CD0 = interp1(CLarr, CDarr, 0, 'PCHIP');
CFDCD0 = interp1(CFDCL, CFDCD, 0, 'PCHIP');

%% Max Range Calculation
% rangeCond = CD0 - k * CLarr.^2;
% [~, uniqueIndices] = unique(rangeCond);
% rangeCond = rangeCond(uniqueIndices);
% tempA = alphas(uniqueIndices);
% alphaMaxRange = interp1(rangeCond, tempA, 0);
% 
% vMaxRange = velFunc(interp1(alphas, CLarr, alphaMaxRange));
% 
% figure(5);
% plot(tempA, rangeCond, 'LineWidth', 1.5);
% hold on;
% rangeCondCFD = CFDCD0 - k * CFDCL.^2;
% plot(CFDalphas, rangeCondCFD, 'LineWidth', 1.5);
% 
% title('Max Range Calculations');
% xlabel('$\alpha$ [degrees]');
% ylabel('$C_{D_0} - k C_L^2$');
% legend('Calculations', 'CFD');
% grid on;
% 
% CFDalphaMaxRange = interp1(rangeCondCFD, CFDalphas, 0);
% CFDvMaxRange = velFunc(interp1(CFDalphas, CFDCL, CFDalphaMaxRange));

[~, maxIndex] = max(CLarr ./ CDarr);
alphaMaxRange = alphas(maxIndex)
vMaxRange = velFunc(CLarr(maxIndex))

[~, maxIndex] = max(CFDCL ./ CFDCD);
CFDalphaMaxRange = CFDalphas(maxIndex)
CFDvMaxRange = velFunc(CFDCL(maxIndex))

%% Max Endurance Calculation

figure(6);
plot(CFDalphas ,(CFDCL .^(3/2)./CFDCD), 'LineWidth', 1.5);
hold on;
plot(alphas, (CLarr .^(3/2)./CDarr), 'LineWidth', 1.5);
xlabel('$\alpha$ [$^{\circ}$]');
ylabel('$\frac{(C_L)^{3/2}}{C_D}$');
legend('CFD', 'Calculated');
grid on;
title('Lift$^{3/2}$ to Drag Ratio vs Angle of Attack');


[~, maxIndex] = max(CLarr .^(3/2)./CDarr);
alphaMaxEndurance = alphas(maxIndex)
vMaxEndurance = velFunc(CLarr(maxIndex))

[~, maxIndex] = max(CFDCL .^(3/2)./CFDCD);
CFDalphaMaxEndurance = CFDalphas(maxIndex)
CFDvMaxEndurance = velFunc(CFDCL(maxIndex))


% enduranceCond = (3 * CD0) - (k * CLarr.^2);
% maxEndurance = CLarr.^(3/2) ./ CDarr;
% [~, maxIndex] = max(maxEndurance);
% alphaMax = alphas(maxIndex);
% [~, uniqueIndices] = unique(enduranceCond);
% enduranceCond = enduranceCond(uniqueIndices);
% tempA = alphas(uniqueIndices);
% alphaMaxEndurance = interp1(enduranceCond, tempA, 0);
% vMaxEndurance = velFunc(interp1(alphas, CLarr, alphaMaxEndurance));
% 
% figure(5);
% plot(tempA, enduranceCond, 'LineWidth', 1.5);
% hold on;
% enduranceCondCFD = 3 * CFDCD0 - k * CFDCL.^2;
% plot(CFDalphas, enduranceCondCFD, 'LineWidth', 1.5);
% 
% title('Max Endurance Calculations');
% xlabel('$\alpha$ [degrees]');
% ylabel('$3 C_{D_0} - k C_L^2$');
% legend('Calculations', 'CFD');
% grid on;
% 
% CFDmaxEndurance = CFDCL.^(3/2) ./ CFDCD;
% [~, maxIndex] = max(CFDmaxEndurance);
% CFDalphaMax = CFDalphas(maxIndex);
% 
% CFDalphaMaxEndurance = interp1(enduranceCondCFD, CFDalphas, 0);
% CFDvMaxEndurance = velFunc(interp1(CFDalphas, CFDCL,...
%     CFDalphaMaxEndurance));


end



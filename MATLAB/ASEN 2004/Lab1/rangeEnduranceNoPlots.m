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

function [] = rangeEnduranceNoPlots(GTOW, altitude, alphas, CLarr, CDarr, ...
    CFDalphas, CFDCL, CFDCD, k, S)
%% Declaration of Variables
[~, ~, ~, rho] = atmoscoesa(altitude); % kg/m^3 from standard atmosphere

velFunc = @(C_L) sqrt((2 * GTOW * 9.81) ./ (C_L * rho * S));


CD0 = interp1(CLarr, CDarr, 0, 'PCHIP');
CFDCD0 = interp1(CFDCL, CFDCD, 0, 'PCHIP');

%% Max Range Calculation
rangeCond = CD0 - k * CLarr.^2;
[~, uniqueIndices] = unique(rangeCond);
rangeCond = rangeCond(uniqueIndices);
tempA = alphas(uniqueIndices);
alphaMaxRange = interp1(rangeCond, tempA, 0);

vMaxRange = velFunc(interp1(alphas, CLarr, alphaMaxRange));

rangeCondCFD = CFDCD0 - k * CFDCL.^2;

CFDalphaMaxRange = interp1(rangeCondCFD, CFDalphas, 0);
CFDvMaxRange = velFunc(interp1(CFDalphas, CFDCL, CFDalphaMaxRange));

%% Max Endurance Calculation
enduranceCond = (3 * CD0) - (k * CLarr.^2);
maxEndurance = CLarr.^(3/2) ./ CDarr;
[~, maxIndex] = max(maxEndurance);
alphaMax = alphas(maxIndex);
[~, uniqueIndices] = unique(enduranceCond);
enduranceCond = enduranceCond(uniqueIndices);
tempA = alphas(uniqueIndices);
alphaMaxEndurance = interp1(enduranceCond, tempA, 0);
vMaxEndurance = velFunc(interp1(alphas, CLarr, alphaMaxEndurance));

enduranceCondCFD = 3 * CFDCD0 - k * CFDCL.^2;

CFDmaxEndurance = CFDCL.^(3/2) ./ CFDCD;
[~, maxIndex] = max(CFDmaxEndurance);
CFDalphaMax = CFDalphas(maxIndex);

CFDalphaMaxEndurance = interp1(enduranceCondCFD, CFDalphas, 0);
CFDvMaxEndurance = velFunc(interp1(CFDalphas, CFDCL,...
    CFDalphaMaxEndurance));


end



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Group Names:
% 1. Joey Derks
% 2. Michael Martinson
% 3. Harrison Methratta
% 4. Samuel Razumovskiy
% 5. Ian Thomas
% 6. Ruben Hinojosa Torres

%main.m
% Group 12-01
% Author(s): Mike Martinson, Ian Thomas
% Date written: 1/18/2019
% Date modified:
% 
% Purpose:
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function [alpha, CL, CD, LDmax] = driverFuncNoPlots(Swet,Sref,Cfe,e,e0,...
    AR,alphaCFD,CLCFD, CDCFD, k, GTOW, altitude, filename)
    
    %Lift curve comparision:
    [alpha, CL, Cl, Cd, a] = LiftCurvesNoPlots(filename,e,AR,... 
        alphaCFD,CLCFD,CDCFD); 

    %Drag polar work: 
    [CD, LDmax] = dragPolarwithLDNoPlots(alpha, CL, Cl, Cd, a,... 
        Swet,Sref,Cfe,e,e0,AR,alphaCFD,CLCFD, CDCFD, k);

    rangeEnduranceNoPlots(GTOW, altitude, alpha, CL, CD, ...
        alphaCFD, CLCFD, CDCFD, k, Sref);

end
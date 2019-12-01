function [y,delU,U1,U2,rho2] = findDelU(UP,DOWN)
% findDelU This function finds the delta u values for each point in a data
% set

% Getting the density, dynamic pressure, and y positions for up stream data
rhoUp = UP(:,3);
q_infUp = UP(:,5);
yUp = UP(:,end);

% Getting the density, dynamic pressure, and y positions for down stream
% data
rhoDo = DOWN(:,3);
q_infDo = DOWN(:,6);
yDo = DOWN(:,end);

% Finding the velocity for each data set
VUp = sqrt(q_infUp.*2./rhoUp);
VDo = sqrt(q_infDo.*2./rhoDo);

% Averaging and finding the difference between the upper and down stream
% velocites
[y,delU,U1,U2,rho2] = aveData(yUp,yDo,VUp,VDo,rhoDo);
end


%% ASEN 3111 - Experimental Lab 1 - Main
%   Explores the structure of the wake behind an aerodynamic body.
%
%   Author: Samuel Razumovskiy
%   Collaborators: None
%   Date: 10/10/2019 (last revised: 10/24/2019)

%%
clear,clc,close all

%% Loading
if exist('Data_EA1_Razumovskiy_Samuel.mat','file') == 0
    getData()
end
load Data_EA1_Razumovskiy_Samuel.mat

%% Data


plotDelV(AirfoilUp,AirfoilDown,0,0.0889)

plotDelV(CylinderUp,CylinderDown,2,0.0127)

%% Functions Called
% The following functions were built and called as part of this assignment.
%
% <include>findDelU.m getData.m plotDelV.m aveData.m</include>
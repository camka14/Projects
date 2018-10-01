% Name: Samuel Razumovskiy
% Section: 108
% sara6569@colorado.edu
clear,clc

tcold = input('Input the cold temperature ');
thot = input('Input the hot temperature ');
eff = carnotFunc(tcold,thot);

fprintf('The carnot efficiency = %.3f/n', eff)
%% ASEN 3113 - Assignment 10 - Main
%
%   Author: Samuel Razumovskiy
%   Collaborators: None
%   Date: 12/2/2019 (last revised: 12/2/2019)

clear,clc
%% 20-30 a)
Q = 8; % W
ep = 0.8;
A = 0.03; % m^2
h = 4.876; % W/m^2
Tinf = 293.15; % K
Ts = 318.15; % K

Tsa = findTemp(Q,ep,A,Ts,Tinf,h) - 273.15;

%% 20-30 b)
h = 6.696; % W/m^2

Tsb = findTemp(Q,ep,A,Ts,Tinf,h) - 273.15;

%% 20-30 c)
h = 3.34; % W/m^2

Tsc = findTemp(Q,ep,A,Ts,Tinf,h) - 273.15;


%% 20-60
Q = 54; % W
ep = 0.9;
A = 4*pi*.04^2; % m^2
h = 7.54; % W/m^2
Tinf = 298.15; % K
Ts = 443.15; % K

Ts = findTemp(Q,ep,A,Ts,Tinf,h) - 273.15;

%% Function
function Ts = findTemp(Q,ep,A,Ts,Tinf,h)
    sigma = 5.67e-8;
    Qguess = 0;
    while abs(Q-Qguess) > 0.001
        if Q-Qguess > 0 && Qguess ~= 0
            Ts = Ts+0.001;
        elseif Q-Qguess < 0 && Qguess ~= 0 
            Ts = Ts-0.001;
        end
        Qguess = sigma*ep*A*(Ts^4-Tinf^4)+h*A*(Ts-Tinf);
    end
end
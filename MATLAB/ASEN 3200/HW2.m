% Samuel Razumovskiy
% 1/29/2020

clear,clc,close all
%% Problem 3
M = 4.4879;
E0 = 3.1288;
e = 0.6609;

En = E0 - (E0-e*cos(E0)-M)/(1-e*cos(E0));
i = 0;

while abs(En - E0)>0.0001
    E0 = En;
    En = E0 - (E0-e*sin(E0)-M)/(1-e*cos(E0));
    i = i+1;
end
fprintf('E = %.3f\n', En)


%% Problem 4
E0 = 2.789;
e = 0.3617;
M = 2.60814;

En = E0 - (E0-e*cos(E0)-M)/(1-e*cos(E0));
i = 0;

while abs(En - E0)>0.0001
    E0 = En;
    En = E0 - (E0-e*sin(E0)-M)/(1-e*cos(E0));
    i = i+1;
end
fprintf('E = %.3f\n', En)
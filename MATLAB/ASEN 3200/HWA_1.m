%%%%% Problem 3
%% Knock Knock, Housekeeping
clear, clc, close all

%% Givens
alpha = 45;
beta = 45;
gamma = 45;

r1 = [1, 0, 0; 0, cosd(alpha), sind(alpha); 0, -sind(alpha), cosd(alpha)];
r2 = [cosd(beta), 0, -sind(beta);0, 1, 0; sind(beta), 0, cosd(beta)];
r3 = [cosd(gamma), sind(gamma), 0; -sind(gamma), cosd(gamma), 0; 0, 0, 1];

%% a) Sequences
Q1 = r3*r2*r1;
Q2 = r1*r2*r3;
Q3 = r3*r1*r3;

disp('Sequence 1')
disp(Q1)
disp('Sequence 2')
disp(Q2)
disp('Sequence 3')
disp(Q3)

%% b) Axis and angle of rotation

[evec1,ev1] = eig(Q1);
[evec2,ev2] = eig(Q2);
[evec3,ev3] = eig(Q3);

[phi1,u1] = get_phi_u(evec1,ev1);
[phi2,u2] = get_phi_u(evec2,ev2);
[phi3,u3] = get_phi_u(evec3,ev3);

fprintf('Angle of rotation for sequence 1 = %.3f\n', phi1)
disp('Axis of rotation for sequence 1')
disp(u1)
fprintf('Angle of rotation for sequence 2 = %.3f\n', phi2)
disp('Axis of rotation for sequence 2')
disp(u2)
fprintf('Angle of rotation for sequence 3 = %.3f\n', phi3)
disp('Axis of rotation for sequence 3')
disp(u3)

disp('The DCMs all have the same values just in different locations. One')
disp('one thing of note is that the eigenvectors of sequences 2 and 3 have')
disp('an equal value. The axes of rotation are all different, and have a wide range')
function [phi,u] = get_phi_u(evec,ev)
    [r,~] = size(ev);
    for i = 1:r
        if(floor(ev(i,i)) == 1)
            u = evec(:,i);
        else
            phi = acosd(real(ev(i,i)));
        end
    end
end
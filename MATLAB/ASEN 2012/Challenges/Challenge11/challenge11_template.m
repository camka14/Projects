%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CODE CHALLENGE 11 - Zero Finding with MATLAB
%
% This challenge is an exercise in finding the zeros of functions in
% MATLAB. There are several functions you can use to do this - use the
% `help` function to learn more. You will find the zeros of the van der
% Waals equation of a gas state for CO2.
%
% Please ZIP and upload your team's script(s) and figures to Canvas to
% complete the challenge.
%
% STUDENT TEAMMATES
% 1. Grant Norman
% 2. Griffin Van Anne
% 3. Samuel Razumovskiy
% 4.
%
% CHALLENGE AUTHORS
% Allison Anderson, John Jackson
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear; close all; clc;

% Given:
% The equation and constants for CO2. a and b are specific to CO2.
a = 3.59; % atm*L^2/mol^2
b = 0.0427; % l/mol
R = 0.082; % L*atm/K*mol
P = 10; % atm
T = 300; % K

vdw = @(V) (P-a./V.^2).*(V-b) - R*T; % The anonymous function you will use.

% Volumes over which to plot/investigate for roots
% 1. Create a volume vector linearly spaced between -1 and 3
V = linspace(-1,3);
% 2. Plot the van der Waals function vs. volume. Change the scale of the
% plot to get a better look around the roots.
hold on
plot(V, vdw(V))
plot(V,zeros(length(V)))
grid on
xlim([-0.5 3])
ylim([-200 200])
title('Van der Waals Func vs. Volume')
xlabel('Volume')
ylabel('Van der Waals Func')
% 3. From looking at the plot, how many roots are there, and what are they
% approximately?
% There are three roots at -0.175 and 0.5
% 4. Find the roots of the polynomial using the `roots` function.
roots_roots = roots([P,-P*b-R*T,-a,a*b]);
roots_roots = sort(roots_roots);
% 5. Find the roots of the polynomial using the `fzero` function.
fzero_roots(1) = fzero(vdw,[-0.5 -0.1]);
fzero_roots(2) = fzero(vdw,[0.01 1]);
fzero_roots(3) = fzero(vdw,[-0.5 3]);
% 6. Find the roots of the polynomial using the `fsolve` function.
fsolve_roots(1) = fsolve(vdw,-0.5);
fsolve_roots(2) = fsolve(vdw,0.01);
fsolve_roots(3) = fsolve(vdw,2);
% 7. Plot the roots that you calculated on the plot created in 2. Just
% choose one set of the roots (4, 5 OR 6)
plot(roots_roots,[0 0 0], '*');
% 8. Calculate the % error between the roots using the different methods.
% Is it an acceptable error?
r_z = abs((roots_roots' - fzero_roots)./fzero_roots);
r_s = abs((roots_roots' - fsolve_roots)./fsolve_roots);
z_s = abs((fzero_roots - fsolve_roots)./fsolve_roots);

% Bonus question: time the functionc alls in 4, 5 and 6 using the `tic` and `toc` methods. Which one is the fastest?

% Bonus question: Go to this website and choose another gas to test:
% http://hyperphysics.phy-astr.gsu.edu/hbase/Kinetic/waal.html
% HINT: Make sure you check your units!

% Bonus question: change the parameters for the CO2 to see how the
% locations of the zeros change. Are there any parameter values that result
% in no zeros for the function?

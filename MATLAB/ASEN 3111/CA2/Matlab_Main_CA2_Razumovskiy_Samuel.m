%% ASEN 3111 - Computational Assignment 02 - Main
% Simulating the airflow over a thin airfoil by plotting the stream lines,
% equipotential lines, and pressure contours
%
%   Author: Samuel Razumovskiy
%   Collaborators: None
%   Date: 9/26/2019 (last revised: 10/10/2019)

%% Estaplishing constants
clear, clc, close all

c = 2; % m
alpha = 12; % degrees
V_inf = 68; % freestream velocity
p_inf = 101.3e3; % freestream pressure
rho_inf = 1.225; % freestream density
plotting = true;
V = zeros(100,100,98);
P = zeros(100,100,98);
N = 1000;
fig = 1;
rows = 1;
row = 0;
%% Visualizing The Flow With Given Values
name = 'Flow with given values';
[Vactual,Pactual,fig] = Plot_Airfoil_Flow(c,alpha,V_inf,p_inf,rho_inf,N,plotting,fig,rows,row,name);

%% Checking the effect of N on the accuracy of velocity and pressure
close all
plotting = false;
for N = 3:100
    [V(:,:,N-2), P(:,:,N)] = Plot_Airfoil_Flow(c,alpha,V_inf,p_inf,rho_inf,N,plotting,rows,row,name);
end

DV = zeros(98,1);
DP = zeros(98,1);
for i = 1:98
    DV(i) = mean(abs(Vactual-V(:,:,i)),'all');
    DP(i) = mean(abs(Pactual-P(:,:,i)),'all');
end
plotting = true;
N = 1000;
rows = 3;
row = 0;
name = 'N = 1000';
Plot_Airfoil_Flow(c,alpha,V_inf,p_inf,rho_inf,N,plotting,fig,rows,row,name);
N = 50;
row = 3;
name = 'N = 50';
Plot_Airfoil_Flow(c,alpha,V_inf,p_inf,rho_inf,N,plotting,fig,rows,row,name);
N = 10;
row = 6;
name = 'N = 10';
[~,~,fig] = Plot_Airfoil_Flow(c,alpha,V_inf,p_inf,rho_inf,N,plotting,fig,rows,row,name);
figure
plot(3:100,DV)
title('Average Velocity Error vs. No. Vorticies')
ylabel('Velocity (m/s)')
xlabel('N Vortices')
figure
plot(5:100,DP(3:end))
title('Average Pressure Error vs. No. Vorticies')
ylabel('Pressure (Pa)')
xlabel('N Vortices')

fprintf(['Figure 2 shows that there is not a significant difference in '...
'the velocity and pressure graphs in between N=50 and N=1000, but '...
'there is a difference in the pressure contours. Figure 2 also shows that '...
'N=10 has a very large difference in all three plots, and does not do a '...
'good job of presenting the data. Figures 3 and 4 show how the average '...
'velocity and pressure errors change with respect to N. As expected the '...
'error decreases with an exponential decay.\n\n'])
%% Studying the Effect of c, alpha, and V_inf
close all
plotting = true;
N = 1000;
c = [1.5,2,2.5];
alpha = [6,12,18];
V_inf = [10,68,120];
rows = 3;
row = 0;
name = sprintf('c = %1.1f',c(row/3+1));
Plot_Airfoil_Flow(c(row/3+1),alpha(2),V_inf(2),p_inf,rho_inf,N,plotting,fig,rows,row,name);
row = 3;
name = sprintf('c = %1.1f',c(row/3+1));
Plot_Airfoil_Flow(c(row/3+1),alpha(2),V_inf(2),p_inf,rho_inf,N,plotting,fig,rows,row,name);
row = 6;
name = sprintf('c = %1.1f',c(row/3+1));
[~,~,fig] = Plot_Airfoil_Flow(c(row/3+1),alpha(2),V_inf(2),p_inf,rho_inf,N,plotting,fig,rows,row,name);

row = 0;
name = sprintf('alpha = %d',alpha(row/3+1));
Plot_Airfoil_Flow(c(2),alpha(row/3+1),V_inf(2),p_inf,rho_inf,N,plotting,fig,rows,row,name);
row = 3;
name = sprintf('alpha = %d',alpha(row/3+1));
Plot_Airfoil_Flow(c(2),alpha(row/3+1),V_inf(2),p_inf,rho_inf,N,plotting,fig,rows,row,name);
row = 6;
name = sprintf('alpha = %d',alpha(row/3+1));
[~,~,fig] = Plot_Airfoil_Flow(c(2),alpha(row/3+1),V_inf(2),p_inf,rho_inf,N,plotting,fig,rows,row,name);

row = 0;
name = sprintf('V_{inf} = %d',V_inf(row/3+1));
Plot_Airfoil_Flow(c(2),alpha(2),V_inf(row/3+1),p_inf,rho_inf,N,plotting,fig,rows,row,name);
row = 3;
name = sprintf('V_{inf} = %d',V_inf(row/3+1));
Plot_Airfoil_Flow(c(2),alpha(2),V_inf(row/3+1),p_inf,rho_inf,N,plotting,fig,rows,row,name);
row = 6;
name = sprintf('V_{inf} = %d',V_inf(row/3+1));
[~,~,fig] = Plot_Airfoil_Flow(c(2),alpha(2),V_inf(row/3+1),p_inf,rho_inf,N,plotting,fig,rows,row,name);

fprintf(['The effects of c are slight but noticeable, There are changes '...
'in all three plots but the most noticeable are in the stream lines and '...
'pressure contours. The stream lines and pressure contours for the longer '...
'chord generally have a little more separation between them.\n\n'])
fprintf(['Angle of attack seems to have the most effect on the plots, '...
'of course the differences in AOA are probably more significant than the '...
'other permutations. Alpha completely changes the plots with an AOA of 18 '...
'the streamlines have significant separation and the pressure contours '...
'mainly change color entirely.\n\n'])
fprintf(['Free stream velocity seems to have the least effect on the '...
'plots. I am not really able to tell the difference between the different '...
'velocities.\n\n'])


%% Functions Called
% The following functions were built and called as part of this assignment.
%
% <include>Plot_Airfoil_Flow.m</include>
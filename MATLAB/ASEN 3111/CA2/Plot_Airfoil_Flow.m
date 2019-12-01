function [V,pressure,fig] = Plot_Airfoil_Flow(c,alpha,V_inf,p_inf,rho_inf,N,plots,fig,rows,row,name)
%Plot_Airfoil_Flow plots the contour lines of a given flow
%   The flow is defined by the cord length(c), angle of attack(alpha), the
%   freestream velocity(V_inf), the freastream pressure(p_inf), the
%   freestream density(rho_inf), and the number of discrete vorticies(N)

%% Define Domain
xmin=-3;
xmax=3;
ymin=-3;
ymax=3;

%% Define Number of Grid Points
nx=100; % steps in the x direction
ny=100; % steps in the y direction

[x,y]=meshgrid(linspace(xmin,xmax,nx),linspace(ymin,ymax,ny));

alpha = alpha*pi/180;

VorP = linspace(0,c,N);
VorP = VorP(2:end-1);
dx = c/N;

gammas = 2*alpha*V_inf*sqrt((1-VorP/c)./(VorP/c));

Gammas = gammas*dx;

%% Stream and Potential Functions

% Uniform Flow
u = V_inf*cos(alpha);
v = V_inf*sin(alpha);
psiU = u*y - v*x;
phiU = u*x + v*y;

% Vortex Flow
radius=@(x,y,x1,y1) sqrt((x-x1).^2+(y-y1).^2);
theta =@(x,y,x1,y1) atan2((y-y1),(x-x1));
psiV = zeros(nx,ny);
phiV = zeros(nx,ny);

for i=1:numel(VorP)
    psiV = psiV + Gammas(i)./(2*pi).*log(radius(x,y,VorP(i),0));
    phiV = phiV - Gammas(i)./(2*pi).*theta(x,y,VorP(i),0);
end

StreamFunction = psiV + psiU;
PotentialFunction = phiV + phiU;
%% Determine color levels for contours
levmin = StreamFunction(1,nx); % defines the color levels -> trial and error to find a good representation
levmax = StreamFunction(ny,nx/2);
levels = linspace(levmin,levmax,80)';

if plots == true
    figure(fig)
    set(gcf, 'Position',  [200, 150, 1200, 250*rows])
    subplot(rows,3,1+row)
    hold on
    contour(x,y,StreamFunction,levels)
    plot([0 c], [0 0])
    xlabel('Stream Lines')
    
    subplot(rows,3,2+row)
    hold on
    contour(x,y,PotentialFunction,levels)
    plot([0 c], [0 0])
    title(name)
    xlabel('Equipotential Lines')
end
%% Velocity Functions


V = gradient(PotentialFunction);
q_inf = 1/2*rho_inf*V_inf^2;
pressure = (1-(V./V_inf).^2)*q_inf+p_inf;

levmin = min(min(pressure)); % defines the color levels -> trial and error to find a good representation
levmax = max(max(pressure));
levels = linspace(levmin,levmax,100)';

if plots == true
    subplot(rows,3,3+row)
    hold on
    contourf(x,y,pressure,levels)
    plot([0 c], [0 0])
    xlabel('Pressure Contours')
    fig = fig+1;
end
end


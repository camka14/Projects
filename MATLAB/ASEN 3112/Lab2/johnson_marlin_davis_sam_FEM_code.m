%% ASEN 3112 Lab 2 FEM Uncertainty Analysis
%
% Authors: Davis Peirce
% Collaborators: Marlin Jacobson, Samuel Razumovskiy
% Original Function Code: Dr. Aaron Johnson
% Date: 3/31/2020

%% Housekeeping
close all
clear
clc

%% Read in the Truss Information
nodetable = xlsread('nodetable.xlsx'); %Describes the nodes of the truss
connecttable = xlsread('connecttable.xlsx'); %Describes the elements of the truss
dof = 3;

%connecttable describes the ELEMENTS
%   1: element number
%   2: node A
%   3: node B
%   4: cross-sectional area
%   5: elastic modulus
%   6: coefficient of thermal expansion (put 0 for all members)
%   7: temperature change (put 0 for all members)
%
%nodetable describes the NODES
%   1: node number
%   2: x-coordinate
%   3: y-coordinate
%   4: z-coodinate
%   5: x-displacement (number if known, NaN if unknown)
%   6: y-displacement (number if known, NaN if unknown)
%   7: z-displacement (number if known, NaN if unknown)
%   8: external force in x-direction (number if known, NaN if unknown)
%   9: external force in y-direction (number if known, NaN if unknown)
%   10: external force in z-direction (number if known, NaN if unknown)

%% Unmodified Results

if exist('uFsigma.mat') == 0
[u,F,sigma] = johnson_FEM(nodetable,connecttable,dof);
save('uFsigma.mat','u','F','sigma')
else
    load('uFsigma.mat')
end

%% Results with Uncertainties

%Imperfect joints/free-play -> Reduced effective stiffness
if exist('freePlay.mat') == 0
    %Column 5 in connecttable corresponds to Young's Modulus
    modConnect = connecttable; %Define a new variable to preserve the original
    modConnect(:,5) = 0.975*modConnect(:,5); %reduce the stiffness of all members by 2.5%
    
    [uFree,FFree,sigmaFree] = johnson_FEM(nodetable,modConnect,dof); %Run the FEM
    save('freePlay.mat','uFree','FFree','sigmaFree')
else
    load('freePlay.mat')
end

%Free-play in the load cell -> Reduced effective stiffness in the bar containing the load cell
if exist('loadCell.mat') == 0
    %Column 5 in connecttable corresponds to Young's Modulus
    %The member in question connects nodes 58 and 59
    modConnect = connecttable; %Redefine a new variable to preserve the original
    modConnect(87,5) = .95*modConnect(87,5); %Reduce the stiffness in the member by 5%

    [uLoad,FLoad,sigmaLoad] = johnson_FEM(nodetable,modConnect,dof); %Run the FEM
    save('loadCell.mat','uLoad','FLoad','sigmaLoad')
else
    load('loadCell.mat')
end

%Friction at supported joints -> change in boundary conditions
if exist('friction.mat') ==0
    %Boundary conditions refer to columns 5:10 in nodetable
    %Friction does not affect the displacements
    %Friction does not affect the pinned joints
    %Friction does affect the roller joints, such that the displacement is
    %zero and the force is unknown. In other words, they can be treated as
    %a pin joint.
    modNode = nodetable; %Redefine a new variable to preserve the original
    %The two roller joints are located at positions 17 and 68.
    modNode(17,5:10) = [0,0,0,NaN,NaN,NaN];
    modNode(68,5:10) = [0,0,0,NaN,NaN,NaN];
    
    [uFriction,FFriction,sigmaFriction] = johnson_FEM(modNode,connecttable,dof); %Run the FEM
    save('friction.mat','uFriction','FFriction','sigmaFriction')
else
   load('friction.mat') 
end

    
%Manufacturing imperfections -> change in cross section of the struts and
%positions of the joints
if exist('imperfection.mat') == 0
    %Column 4 in connecttable corresponds to cross-sectional area of the
    %struts
    %Columns 2:4 in nodetable correspond to positions of each joint
    modConnect = connecttable; %Redefine a new variable to preserve the original
    modConnect(:,4) = modConnect(:,4) + (.05*rand(length(modConnect),1)-.025).*modConnect(:,4); %Allow for random errors of +/- 2.5%
    modNode = nodetable; %Redefine a new variable to preserve the original
    modNode(:,2:4) = modNode(:,2:4) + (.05*rand(length(modNode),1)-.025).*modNode(:,2:4); %Allow for random errors of +/- 2.5%
    
    [uPerf,FPerf,sigmaPerf] = johnson_FEM(modNode,modConnect,dof); %Run the FEM 
    save('imperfection.mat','uPerf','FPerf','sigmaPerf')
else
    load('imperfection.mat')
end


%Joints aren't pinned -> allow for moments due to the nodes
%This uncertainty is not explored in this code.

%% Uncertainty Analysis

%Displacement Analysis
[r,c] = size(u); %determine the size of the u-matrix
uErr = zeros(r,c,4); %define a matrix of the same size as u and with a page for each uncertainty
%Assign each uncertainty to a page
uErr(:,:,1) = uFree; 
uErr(:,:,2) = uLoad; 
uErr(:,:,3) = uFriction; 
uErr(:,:,4) = uPerf; 
uErr = 100 * (u-uErr)./u; %Convert the uncertainties to percent
%Note: the supports must be removed from this calculation due to dividing
%by zero
% uErr(68,:,:) = [];
% uErr(52,:,:) = [];
% uErr(17,:,:) = [];
% uErr(1,:,:) = [];
node = nodetable(:,1);
% node(node == 1 | node == 17 | node == 52 | node == 68) = [];

figure
hold on
plot(node,uErr(:,1,1))
plot(node,uErr(:,1,2))
plot(node,uErr(:,1,3))
plot(node,uErr(:,1,4))
xlabel('Node Number')
ylabel('X-Position Percent Error')
legend('Joint Free-Play','Load Cell Free-Play','Support Friction','Manufacturing Imperfections')
title('X-Uncertainty in Displacements')

figure
hold on
plot(node,uErr(:,2,1))
plot(node,uErr(:,2,2))
plot(node,uErr(:,2,3))
plot(node,uErr(:,2,4))
xlabel('Node Number')
ylabel('Y-Position Percent Error')
legend('Joint Free-Play','Load Cell Free-Play','Support Friction','Manufacturing Imperfections')
title('Y-Uncertainty in Displacements')

figure
hold on
plot(node,uErr(:,3,1))
plot(node,uErr(:,3,2))
plot(node,uErr(:,3,3))
plot(node,uErr(:,3,4))
xlabel('Node Number')
ylabel('Z-Position Percent Error')
legend('Joint Free-Play','Load Cell Free-Play','Support Friction','Manufacturing Imperfections')
title('Z-Uncertainty in Displacements')



%Force Analysis
[r,c] = size(u); %determine the size of the F-matrix
FErr = zeros(r,c,4); %define a matrix of the same size as F and with a page for each uncertainty
%Assign each uncertainty to a page
FErr(:,:,1) = FFree; 
FErr(:,:,2) = FLoad; 
FErr(:,:,3) = FFriction; 
FErr(:,:,4) = FPerf; 
FErr = 100 * (F-FErr)./F; %Convert the uncertainties to percent
%Note: the supports must be removed from this calculation due to dividing
%by zero
% uErr(68,:,:) = [];
% uErr(52,:,:) = [];
% uErr(17,:,:) = [];
% uErr(1,:,:) = [];
node = nodetable(:,1);
% node(node == 1 | node == 17 | node == 52 | node == 68) = [];

figure
hold on
plot(node,FErr(:,1,1))
plot(node,FErr(:,1,2))
plot(node,FErr(:,1,3))
plot(node,FErr(:,1,4))
xlabel('Node Number')
ylabel('X-Force Percent Error')
legend('Joint Free-Play','Load Cell Free-Play','Support Friction','Manufacturing Imperfections')
title('X-Uncertainty in Forces')

figure
hold on
plot(node,uErr(:,2,1))
plot(node,uErr(:,2,2))
plot(node,uErr(:,2,3))
plot(node,uErr(:,2,4))
xlabel('Node Number')
ylabel('Y-Force Percent Error')
legend('Joint Free-Play','Load Cell Free-Play','Support Friction','Manufacturing Imperfections')
title('Y-Uncertainty in Forces')

figure
hold on
plot(node,uErr(:,3,1))
plot(node,uErr(:,3,2))
plot(node,uErr(:,3,3))
plot(node,uErr(:,3,4))
xlabel('Node Number')
ylabel('Z-Force Percent Error')
legend('Joint Free-Play','Load Cell Free-Play','Support Friction','Manufacturing Imperfections')
title('Z-Uncertainty in Forces')


%Stress Analysis
[r,c] = size(sigma); %determine the size of the F-matrix
sigErr = zeros(r,c,4); %define a matrix of the same size as F and with a page for each uncertainty
%Assign each uncertainty to a page
sigErr(:,:,1) = sigmaFree; 
sigErr(:,:,2) = sigmaLoad; 
sigErr(:,:,3) = sigmaFriction; 
sigErr(:,:,4) = sigmaPerf; 
sigErr = 100 * (sigma-sigErr)./sigma; %Convert the uncertainties to percent
%Note: the supports must be removed from this calculation due to dividing
%by zero
% uErr(68,:,:) = [];
% uErr(52,:,:) = [];
% uErr(17,:,:) = [];
% uErr(1,:,:) = [];
bar = connecttable(:,1);
% node(node == 1 | node == 17 | node == 52 | node == 68) = [];

figure
hold on
plot(bar,sigErr(:,1,1))
plot(bar,sigErr(:,1,2))
plot(bar,sigErr(:,1,3))
plot(bar,sigErr(:,1,4))
xlabel('Node Number')
ylabel('Stress Percent Error')
legend('Joint Free-Play','Load Cell Free-Play','Support Friction','Manufacturing Imperfections')
title('Uncertainty in Stress')



%% Dr. Johnson's FEM Function
function [u,F,sigma] = johnson_FEM(nodetable,connecttable,dof)

%Dr. Johnson's FEM Code
%Author: Aaron Johnson
%
%FUNCTION INPUTS
%
%connecttable describes the ELEMENTS
%   1: element number
%   2: node A
%   3: node B
%   4: cross-sectional area
%   5: elastic modulus
%   6: coefficient of thermal expansion (put 0 for all members)
%   7: temperature change (put 0 for all members)
%
%nodetable describes the NODES
%   1: node number
%   2: x-coordinate
%   3: y-coordinate
%   4: z-coodinate
%   5: x-displacement (number if known, NaN if unknown)
%   6: y-displacement (number if known, NaN if unknown)
%   7: z-displacement (number if known, NaN if unknown)
%   8: external force in x-direction (number if known, NaN if unknown)
%   9: external force in y-direction (number if known, NaN if unknown)
%   10: external force in z-direction (number if known, NaN if unknown)
%
%dof is the number of degrees of freedom in the truss (put 3 for ASEN 3112)
%
%
%FUNCTION OUTPUTS
%u = matrix of displacements for each node (size n x dof, where n is the number of nodes and dof is the number of degress of freedom)
%   For row n:
%   Column 1: x-displacement of node n
%   Column 2: y-displacement of node n
%   Column 3: z-displacement of node n
%
%F = matrix of external force on each node (size n x dof)
%   For row n:
%   Column 1: x-component of external force on node n
%   Column 2: y-component of external force on node n
%   Column 3: z-component of external force on node n
%
%sigma = vector of axial stress in each element (size m x 1, where m is the number of elements)
%   For row m:
%   Column 1: axial stress in element m

tic
%%%%%%%%%%%%PREPROCESSING%%%%%%%%%%%

connecttable(15:end,1) = connecttable(15:end,1)-4;
connecttable(6:end,1) = connecttable(6:end,1)-1;
dof = 3;
lbf = 0.2248089431;
in = 0.0393700787;
psi = 0.0001450377;

% coordinate matrix for each node with the specified dof
co = nodetable(:,2:dof+1);

% external force matrix for each node with the specified dof
F = nodetable(:,8:dof+7);

% displacement matrix for each node with the specified dof
u = nodetable(:,5:dof+4);

Nel = size(connecttable,1); % number of elements
Nnodes = size(co,1);        % number of nodes

%%% initialize global stiffness matrix 'K' and force vector 'F'
K = zeros(Nnodes*dof,Nnodes*dof);
%Ftemp = zeros(Nnodes*dof,1);    % Column vector
%Fthermal = Ftemp;               % Column vector
Ftemp = reshape(F',Nnodes*dof,1);   % Column vector
Fthermal = zeros(Nnodes*dof,1);     % Column vector
sigma = nan(Nel,1);

%%% Assemble global K
% For each ELEMENT
for A = 1:Nel                   % for each element
    n = (co(connecttable(A,3),:) - co(connecttable(A,2),:));  % vector from node 2 to node 1
    L = norm(n);                % length of element
    n = n./L;                   % unit vector        
    Area = connecttable(A,4);   % area of element
    E = connecttable(A,5);      % elastic modulus of element
    alpha = connecttable(A,6);  % coefficient of thermal expansion
    delT = connecttable(A,7);   % temperature change
 
    k11 = (E*Area/L)*(n'*n);    % khat matrix, always 3x3
     
    % local stiffness matrix and force vector
    % localstiffness = [k11 -k11;-k11 k11];
   
    n1end = connecttable(A,2)*dof;    % Node 1 index end
    n1start = n1end-dof+1;            % Node 1 index start
    n2end = connecttable(A,3)*dof;    % Node 2 index end
    n2start = n2end-dof+1;            % Node 2 index start

    K(n1start:n1end, n1start:n1end) = K(n1start:n1end, n1start:n1end) + k11;
    K(n2start:n2end, n2start:n2end) = K(n2start:n2end, n2start:n2end) + k11;
    K(n1start:n1end, n2start:n2end) = K(n1start:n1end, n2start:n2end) - k11;
    K(n2start:n2end, n1start:n1end) = K(n2start:n2end, n1start:n1end) - k11;
    
    Fthermal(n1start:n1end) = Fthermal(n1start:n1end) + alpha*delT*E*Area*n';
    Fthermal(n2start:n2end) = Fthermal(n2start:n2end) - alpha*delT*E*Area*n';
end

Kfull = K;

%%% Incorporate boundary conditions
% For each NODE
for A=Nnodes:-1:1               % Work backwards so as to not mess up indexing
    nend = A*dof;               % Last index for this node
    for B=dof:-1:1              % Check each dof
        if isnan(F(A,B))        % If the force is NaN (unknown) at this node in this dof
            K(nend-dof+B,:) = [];               % remove row of K
            Ftemp(nend-dof+B,:) = [];           % remove row of Ftemp
            Kcolumn = K(:,nend-dof+B).*u(A,B);  % store column of K multiplied by known displacement     W19
            K(:,nend-dof+B) = [];               % remove column of K
            Ftemp = Ftemp - Kcolumn;            % modify Ftemp by the column of K x displacement         W19
        else                    % if the force is known at this node in this dof
            Ftemp(nend-dof+B) = Ftemp(nend-dof+B) - Fthermal(nend-dof+B); % add thermal effects
        end
    end
end
%     
%     if isnan(F(A,1))                % Nodes where force is Nan (unknown)
%         K(nstart:nend,:) =[];           % remove rows of K
%         K(:,nstart:nend) =[];           % remove columns of K
%         Ftemp(nstart:nend,:) = [];      % remove rows of Ftemp
%     else                            % Nodes where force is known
%         Ftemp(nstart:nend) = F(A,:)';   % populate rows of Ftemp
%     end
% end

% Solve for unknown displacements u
% utemp = K\Ftemp;
utemp = K^(-1)*Ftemp;

% Reassemble u vector
index = 1;                          % Start an index to pick off elements of the utemp vector
for A=1:Nnodes                      % For each node
    for B=1:dof
        if isnan(u(A,B))            % If the displacement of this node is unknown
            u(A,B) = utemp(index);  % Pick off the next elements of the utemp vector
            index = index+1;        % Advance the index
        end
    end
end

% Calculate reaction forces
u2 = u'; u2 = u2(:);                        % Reshape the u vector back into a column vector
Ftemp2 = Kfull*u2 + Fthermal;               % Calculate the column vector of all external forces
F = reshape(Ftemp2,[dof,Nnodes]); F = F';   % Reshape the F vector

% Calculate internal forces
for A = 1:Nel                   % for each element
    n = (co(connecttable(A,3),:) - co(connecttable(A,2),:));    % vector from node 2 to node 1
    delta = u(connecttable(A,3),:) - u(connecttable(A,2),:);   % elongation of bar (node 2 - node 1)
    L = norm(n);                % length of element
    n = n./L;                   % unit vector        
    Area = connecttable(A,4);   % area of element
    E = connecttable(A,5);      % elastic modulus of element
    alpha = connecttable(A,6);  % coefficient of thermal expansion
    delT = connecttable(A,7);   % temperature change
    P = (E*Area/L)*dot(delta,n) - alpha*delT*E*Area;
    sigma(A) = P/Area;
end

u = u.*10^3; %mm
u = u.*in; %in
sigma = sigma.*psi; %psi
F = F.*lbf; %lbf
toc

end



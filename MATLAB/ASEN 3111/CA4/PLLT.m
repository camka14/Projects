function [e,c_L,c_Di] = PLLT(b,a0_t,a0_r,c_t,c_r,aero_t,aero_r,geo_t,geo_r,N)
% PLLT uses prandtl lifting line theorem to caclulate the span efficiency,
% the coefficient of lift and the coefficient of drag. Inputs are the span,
% lift curve slope at the root and tip, the chord at the root and tip, the
% AoA when lift = 0 at the root and tip, the geometric AoA at the root and
% tip, and finally the number of odd terms to use in the prandtl lifting
% line theorem equation

%% Problem 1

% A linspace of theta values
theta = linspace(pi/2,pi/(N*2),N)';

% Creating vectors of the lift curve slope, chord, alpha L = 0, and
% geometric alpha for a given theta value
a0 = (a0_r+(a0_t-a0_r)*cos(theta))*180/pi;
c = c_r+(c_t-c_r)*cos(theta);
alphaL0 = (aero_r+(aero_t-aero_r)*cos(theta))*pi/180;
alpha = (geo_r+(geo_t-geo_r)*cos(theta))*pi/180;

% Creating the A matrix and the B vector
B = alpha-alphaL0;
A = zeros(N);
n = (1:2:2*N)';
for i = 1:N
    for j = 1:N
        % PLLT
        p1 = 4*b*(sin(n(j)*theta(i)))/(a0(i)*c(i));
        p2= n(j)*sin(n(j)*theta(i))/sin(theta(i));
        A(i,j) = p1+p2;
    end
end
% Finding the A coefficients
x = A\B;

% Finding the value of delta
delta = sum(n(2:end).*(x(2:end)./x(1)).^2);

% Finding the span efficiency
e = 1/(1+delta);

% Aspect ratio
AR = b/((c_r+c_t)/2);

% Coefficient of lift and drag
c_L = x(1)*pi*AR;
c_Di = c_L^2/(pi*e*AR);
end
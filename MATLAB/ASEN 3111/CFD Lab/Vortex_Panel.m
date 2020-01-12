function [cl,xc,yc] = Vortex_Panel(alpha,v_inf,c,x,y,M)
% Vortex_Panel uses vortex method to calculate the coefficient of lift
% around a given airfoil provided the AoA, V infinity, chord length, x and
% y locations of the airfoil, total number of points M, and a boolean value
% for whether or not to plot

MP1    = M+1;
xc     = zeros(1,M);
yc     = zeros(1,M);
S      = zeros(1,M);
theta  = zeros(1,M);
sine   = zeros(1,M);
cosine = zeros(1,M);
RHS    = zeros(1,M);
Cp     = zeros(1,M);
V      = zeros(1,M);
CN1    = zeros(M,M);
CN2    = zeros(M,M);
CT1    = zeros(M,M);
CT2    = zeros(M,M);
AN     = zeros(M,M);
AT     = zeros(M,M);

for i = 1:M
    ip1       = i+1;
    xc(i)     = 0.5*(x(i)+x(ip1));
    yc(i)     = 0.5*(y(i)+y(ip1));
    S(i)      = sqrt((x(ip1)-x(i))^2 + (y(ip1)-y(i))^2);
    theta(i)  = atan2((y(ip1)-y(i)),(x(ip1)-x(i)));
    sine(i)   = sin(theta(i));
    cosine(i) = cos(theta(i));
    RHS(i)    = sin(theta(i)-alpha);
end

for i = 1:M
    for j = 1:M
        if i == j
            CN1(i,j) = -1;
            CN2(i,j) = 1;
            CT1(i,j) = 0.5*pi;
            CT2(i,j) = 0.5*pi;
            
        else
            A = -(xc(i)-x(j))*cosine(j)-(yc(i)-y(j))*sine(j);
            B = (xc(i)-x(j))^2+(yc(i)-y(j))^2;
            C = sin(theta(i)-theta(j));
            D = cos(theta(i)-theta(j));
            E = (xc(i)-x(j))*sine(j)-(yc(i)-y(j))*cosine(j);
            F = log(1+S(j)*(S(j)+2*A)/B);
            G = atan2(E*S(j),B+A*S(j));
            P = (xc(i)-x(j))*sin(theta(i)-2*theta(j))+...
                (yc(i)-y(j))*cos(theta(i)-2*theta(j));
            Q = (xc(i)-x(j))*cos(theta(i)-2*theta(j))-...
                (yc(i)-y(j))*sin(theta(i)-2*theta(j));
            CN2(i,j) = D+.5*Q*F/S(j)-(A*C+D*E)*G/S(j);
            CN1(i,j) = .5*D*F+C*G-CN2(i,j);
            CT2(i,j) = C+.5*P*F/S(j)+(A*D-C*E)*G/S(j);
            CT1(i,j) = .5*C*F-D*G-CT2(i,j);
        end
    end
end

for i=1:M
    AN(i,1) = CN1(i,1);
    AN(i,MP1) = CN2(i,M);
    AT(i,1) = CT1(i,1);
    AT(i,MP1) = CT2(i,M);
    for j=2:M
        AN(i,j) = CN1(i,j)+CN2(i,j-1);
        AT(i,j) = CT1(i,j)+CT2(i,j-1);
    end
end
AN(MP1,1)   = 1;
AN(MP1,MP1) = 1;
for j = 2:M
    AN(MP1,j) = 0;
end
RHS(MP1) = 0;
gamma = AN\RHS';
for i=1:M
    V(i) = cos(theta(i)-alpha);
    for j=1:MP1
        V(i) = V(i)+AT(i,j)*gamma(j);
    end
    Cp(i) = 1-V(i)^2;
end

% Calclating Gamma
rho = 1.225;
pinf = 101325;
Qinf = .5 * rho * v_inf^2;
S = [S,S(1)];
Gamma = sum(2*pi*v_inf*(gamma'.*S));
cl = 2*Gamma/(v_inf*c);

end
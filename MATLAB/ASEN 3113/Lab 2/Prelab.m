clear,clc,close all

T = [18.53,22.47,26.87,30.05,35.87,38.56,41.50,46.26];
x0 = 1+3/8;
dx = 0.5;
x = [x0,x0+dx,x0+2*dx,x0+3*dx,x0+4*dx,x0+5*dx,x0+6*dx,x0+7*dx].*0.0254;

figure
plot(x,T)

p = polyfit(x,T,1);
H = p(1);
line = p(2)+p(1).*x;
hold on
plot(x,line)

T0 = p(2);
alpha = 4.82e-5;
L = 5*0.0254;
X = x(end);

Te = T - line;
bn = @(n) 8.*L.*H./((2.*(1:n)-1).^2.*pi.^2).*(-1).^(1:n);
lam = @(n) (2*(1:n)-1)*pi/(2*L);
t = 1;
N = 1:10;
u = zeros(size(N));

for n = N
    u(n) = T0 + H*X + sum(bn(n).*sin(lam(n).*X).*exp((-lam(n).^2.*alpha.*t)));
end

figure
plot(N,u)
xlabel('n')
ylabel('T(x) C')
title('Temperature at t=1')

t = 1000;

for n = N
    u(n) = T0 + H*X + sum(bn(n).*sin(lam(n).*X).*exp((-lam(n).^2.*alpha.*t)));
end

figure
plot(N,u)
xlabel('n')
ylabel('T(x) C')
title('Temperature at t=1000')

n = 1;
alpha1 = 4.05e-6;
alpha2 = 3.56e-5;
alpha3 = alpha;
alpha4 = 6e-5;

t = linspace(0,500,1000);
u1 = T0 + H*X + bn(n).*sin(lam(n).*X).*exp((-lam(n).^2.*alpha1.*t));
u2 = T0 + H*X + bn(n).*sin(lam(n).*X).*exp((-lam(n).^2.*alpha2.*t));
u3 = T0 + H*X + bn(n).*sin(lam(n).*X).*exp((-lam(n).^2.*alpha3.*t));
u4 = T0 + H*X + bn(n).*sin(lam(n).*X).*exp((-lam(n).^2.*alpha4.*t));

figure
hold on
plot(t,u1)
plot(t,u2)
plot(t,u3)
plot(t,u4)
xlabel('T (C)')
ylabel('t (s)')
title('Temperature Over Time')
legend(sprintf('a=%f',alpha1),sprintf('a=%f',alpha2),sprintf('a=%f',alpha3),sprintf('a=%f',alpha4),'location','southeast')

function Kuse = CheckEig(A,B,u0)
% PlotEig is used to generate the eigen values of a bunch of K values

tspan = [0 100];

pos_N = 0; pos_E = 0; pos_D = 0; % m E frame
u = 0; v = 10; w = 0; % m/s B frame
y_trans = [pos_N; pos_E; pos_D; u; v; w];

psi = 0; theta = 0.1; phi = 0; % rad
p = -0.14; q = 0; r = 0.05; % rad/s B frame
y_rot = [psi; theta; phi; p; q; r];


yin = [y_trans;y_rot];
opt = odeset('maxstep',0.01);

k =0:0.01:5;
K = zeros(2,6);
j = 1;
for i = 1:numel(k)
    K(2,3) = k(i);
    Acl = A+B*K;
    [~,D] = eig(Acl);
    eigen = [D(1,1),D(2,2),D(3,3),D(4,4),D(5,5),D(6,6)];
    
    omegaN = sqrt(real(eigen).^2+imag(eigen).^2);
    zeta = -real(eigen)./omegaN;
    omegaN(omegaN == 0) = [];
    imaginary = imag(eigen);
    imaginary(imaginary == 0) = [];
    zeta = rmmissing(zeta);
    tau = 1./(zeta.*omegaN);
    
    if (25 >= tau) & (0.35 <= zeta) & numel(imaginary) == 2
        [~,pos] = ode45(@(t,y)linearized_Aircraft_ODE(t,y,u0,Acl,B,K),tspan,yin,opt);
        Vover = min(pos(:,5));
        delRud = k(i)*max(pos(:,12));
        maxpsi = max(pos(:,7));
        if Vover > -6 && delRud <10 && maxpsi < 5
            Kuse(j) = k(i);
            lam1(j) = D(1,1);
            lam2(j) = D(2,2);
            lam3(j) = D(3,3);
            lam4(j) = D(4,4);
            lam5(j) = D(5,5);
            lam6(j) = D(6,6);
            j = j+1;
        end
    end
    
end

tauD = 40;
tauS = 25;

nDmax = -1/tauD;
nD = [-1,nDmax];
iD = sqrt(nD.^2./0.35^2-nD.^2);
nSmax = -1/tauS;

figure
hold on
ar1 = area(nD,iD,0);
ar2 = area(nD,-iD,0);
ar1.FaceColor = 'g';
ar2.FaceColor = 'g';
p = plot([nSmax,nSmax],[-5,5],'r','LineWidth',2);

maxX = max(real([lam1,lam2,lam3,lam4,lam5,lam6]));
minX = min(real([lam1,lam2,lam3,lam4,lam5,lam6]));
maxY = max(imag([lam1,lam2,lam3,lam4,lam5,lam6]));
minY = min(imag([lam1,lam2,lam3,lam4,lam5,lam6]));
c = linspace(1,10,length(Kuse));
s(1) = scatter(real(lam1),imag(lam1),7,c,'filled');
s(2) = scatter(real(lam2),imag(lam2),7,c,'filled');
s(3) = scatter(real(lam3),imag(lam3),7,c,'filled');
s(4) = scatter(real(lam4),imag(lam4),7,c,'filled');
s(5) = scatter(real(lam5),imag(lam5),7,c,'filled');
s(6) = scatter(real(lam6),imag(lam6),7,c,'filled');
colorbar('Ticks',[1,10],'TickLabels',{sprintf('k = %.0f',min(Kuse)),sprintf('k = %.0f',max(Kuse))});
title('Eigenvalue Locus in Useable Range')
xlabel('Re')
ylabel('Im')
xlim([minX,maxX])
ylim([minY,maxY])
legend([ar1,p],'Dutch Roll Range','Max Spiral Value')
end


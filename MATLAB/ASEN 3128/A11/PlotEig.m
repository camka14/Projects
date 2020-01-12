function PlotEig(A,B,Kin,name)
% PlotEig is used to generate the eigen values of a bunch of K values

% Creates the K matrix that will be used for math
K = zeros(size(Kin));
[r,c] = size(Kin);

% This loop finds the index of the changing K value
for i = 1:r
    for j = 1:c
        if numel(Kin{i,j}) > 1
            k = Kin{i,j};
            x = j;
            y = i;
            break
        end
    end
end
lam1 = zeros(size(k));
lam2 = zeros(size(k));
lam3 = zeros(size(k));
lam4 = zeros(size(k));
lam5 = zeros(size(k));
lam6 = zeros(size(k));

% This loop calculates the eigen values by iterating through each k value
% and creates a new K everytime to calculate the closed loop A matrix
for i = 1:numel(k)
    K(y,x) = k(i);
    Acl = A+B*K;
    [~,D]   = eig(Acl);
    lam1(i) = D(1,1);
    lam2(i) = D(2,2);
    lam3(i) = D(3,3);
    lam4(i) = D(4,4);
    lam5(i) = D(5,5);
    lam6(i) = D(6,6);
end

%% Plotting
maxX = max(real([lam1,lam2,lam3,lam4,lam5,lam6]));
minX = min(real([lam1,lam2,lam3,lam4,lam5,lam6]));
maxY = max(imag([lam1,lam2,lam3,lam4,lam5,lam6]));
minY = min(imag([lam1,lam2,lam3,lam4,lam5,lam6]));
figure
hold on
c = linspace(1,10,length(k));
s(1) = plot(real([lam3(1),lam4(1)]),imag([lam3(1),lam4(1)]),'ro');
s(2) = plot(real(lam5(1)),imag(lam5(1)),'go');
s(3) = plot(real(lam6(1)),imag(lam6(1)),'ko');
s(4) = plot([20,-20],[0,0],'k');
s(4) = plot([0,0],[20,-20],'k');
s(4) = scatter(real(lam1),imag(lam1),5,c,'filled');
s(5) = scatter(real(lam2),imag(lam2),5,c,'filled');
s(6) = scatter(real(lam3),imag(lam3),5,c,'filled');
s(7) = scatter(real(lam4),imag(lam4),5,c,'filled');
s(8) = scatter(real(lam5),imag(lam5),5,c,'filled');
s(9) = scatter(real(lam6),imag(lam6),5,c,'filled');
colorbar('Ticks',[1,10],'TickLabels',{sprintf('k = %.0f',min(k)),sprintf('k = %.0f',max(k))});
title(name)
xlabel('Re')
ylabel('Im')
title(['Lateral Eigen Values ',name])
legend(s([1, 2, 3]),'Dutch Roll','Spiral','Roll')
xlim([minX,maxX])
ylim([minY,maxY])
end


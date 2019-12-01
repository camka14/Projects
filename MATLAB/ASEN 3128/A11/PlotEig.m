function PlotEig(A,B,Kin,name)

K = zeros(size(Kin));
[r,c] = size(Kin);
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
for i = 1:numel(k)
    K(y,x) = k(i);
    Acl = A-B*K;
    [~,D]   = eig(Acl);
    lam1(i) = D(1,1);
    lam2(i) = D(2,2);
    lam3(i) = D(3,3);
    lam4(i) = D(4,4);
    lam5(i) = D(5,5);
    lam6(i) = D(6,6);
end
% init = [lam1(1),lam2(1),lam3(1),lam4(1),lam5(1),lam6(1)];
% initc = zeros(size(init));
figure
hold on
c = linspace(1,10,length(k));
% scatter(real(init),imag(init),5,initc,'filled')
scatter(real(lam1),imag(lam1),5,c,'filled')
scatter(real(lam2),imag(lam2),5,c,'filled')
scatter(real(lam3),imag(lam3),5,c,'filled')
scatter(real(lam4),imag(lam4),5,c,'filled')
scatter(real(lam5),imag(lam5),5,c,'filled')
scatter(real(lam6),imag(lam6),5,c,'filled')
colorbar('Ticks',[1,10],'TickLabels',{sprintf('k = %.0f',min(k)),sprintf('k = %.0f',max(k))});
title(name)
xlabel('Re')
ylabel('Im')
title('Short Period Eigen Values')
end


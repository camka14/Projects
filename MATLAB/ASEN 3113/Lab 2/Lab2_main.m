clear,clc,close all

files = ["Aluminum_20V_190mA.txt","Brass_25V_230mA.txt","Brass_30V_285mA.txt","Aluminum_25V_240mA.txt","Steel_20V_185mA.txt"];
k = [130,115,115,130,16.2];
cp = [960,380,380,960,500];
rho = [2810,8500,8500,2810,8000];
T0 = zeros(1,5);
H = zeros(1,5);
Hana = zeros(1,5);

for j = 1:numel(files)
    [time,temp] = getData(files(j));
    [r,c] = size(temp);
    [t,T] = cleanData(time,temp(:,end));
    name = regexprep(files(j),'_',' ');
    name = regexp(name,'\w+\s\d+\w\s\d+\w+','match');
    Volt = regexp(name,'(\d+)V','tokens');
    Volt = str2double(Volt{1});
    I = regexp(name,'(\d+)mA','tokens');
    I = str2double(I{1})/1000;
    Qd = Volt*I;
    A = pi*(.5*.0254)^2;
    
    Tch = temp(end-5,:);
    
    x0 = 1+3/8;
    dx = 0.5;
    x = [x0,x0+dx,x0+2*dx,x0+3*dx,x0+4*dx,x0+5*dx,x0+6*dx,x0+7*dx].*0.0254;
    
    p = polyfit(x,Tch,1);
    H(j) = p(1);
    Hana(j) = Qd/(k(j)*A);
    T0(j) = p(2);
    line = T0(j)+H(j).*x;
    
    alpha = k(j)./(cp(j).*rho(j));
    L = 5*0.0254;
    bn = @(n) 8.*L.*H(j)./((2.*(1:n)-1).^2.*pi.^2).*(-1).^(1:n);
    lam = @(n) (2*(1:n)-1)*pi/(2*L);
    
    u = zeros(size(t));
    X = x(end);
    n = 10;
    
    for i = 1:numel(t)
        u(i) = T0(j) + H(j)*X + sum(bn(n).*sin(lam(n).*X).*exp((-lam(n).^2.*alpha.*t(i))));
    end
    
    figure
    hold on
    plot(x,T0(j)+Hana(j).*x)
    plot(x,T0(j)+H(j).*x)
    legend('Analytical','Experimental','location','southeast')
    xlabel('Distance [m]')
    ylabel(['Temperature [',char(176),'C]'])
    title([name,' Steady States'])
end
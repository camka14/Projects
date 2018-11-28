clear,clc,close all
data = dlmread('Sample_A.txt');
% Separation of data file into variables
time = data(:,1);
waterTemp = data(:,2);
sampleTemp1 = data(:,3);
sampleTemp2 = data(:,4);

% Averaging of the temperature in three of the sections
first1 = sampleTemp1(120:220);
first2 = sampleTemp2(120:220);
firstAve = (first1+first2)./2;

second1 = sampleTemp1(240:270);
second2 = sampleTemp2(240:270);
secondAve = (second1+second2)./2;

third1 = sampleTemp1(400:500);
third2 = sampleTemp2(400:500);
thirdAve = (third1+third2)./2;

clear first1 first2 second1 second2 third1 third2

% Solving for m and d using linear algebra
Afirst = [time(120:220),ones(length(firstAve),1)];
Asecond = [time(240:270),ones(length(secondAve),1)];
Athird = [time(400:500),ones(length(thirdAve),1)];
xfirst = Afirst\firstAve;
xsecond = Asecond\secondAve;
xthird = Athird\thirdAve;

% Solving system of equation for intercepts
solveStart = [ones(2,1), [-xfirst(1);-xsecond(1)]]\[xfirst(2);xsecond(2)];
solveEnd = [ones(2,1), [-xsecond(1);-xthird(1)]]\[xsecond(2);xthird(2)];

% Values for finding specific heat and error propogation
T0 = solveStart(1); % °C
T2 = solveEnd(1); % °C
T1 = mean(waterTemp); % °C
T1std = std(waterTemp); % °C
shc = 0.214*4.184004619136; % J/(g°C)
massC = 318.3; % g
massCerror = 0.05; % g
massS = 91.767; % g
massSerror = 0.001; % g

shs = (massC*shc*(T2-T0))/(massS*(T1-T2)); % J/(g°C)

% Calculation of error in specific heat of sample
sigmaSH = sqrt(((shc*(T2-T0))/(massS*(T1-T2))*massCerror)^2+...
    (-(shc*(T2-T0))/(massS^2*(T1-T2))*massSerror)^2+...
    (-(shc*(T2-T0))/(massS*(T1-T2)^2)*T1std)^2); % J/(g°C)

% Solving for sigma y
sigmaFirst = sqrt((1/(length(firstAve)-2))*sum(firstAve-xfirst(1).*time(120:220)-xfirst(2)));
sigmaSecond = sqrt((1/(length(secondAve)-2))*sum(secondAve-xsecond(1).*time(240:270)-xsecond(2)));
sigmaThird= sqrt((1/(length(thirdAve)-2))*sum(thirdAve-xthird(1).*time(400:500)-xthird(2)));

% Equations of the lines
f1 = @(x) xfirst(1)*x+xfirst(2);
f2 = @(x) xsecond(1)*x+xsecond(2);
f3 = @(x) xthird(1)*x+xthird(2);

% Plotting of data
hold on
fplot(f1)
fplot(f2)
fplot(f3)
plot(solveStart(2),solveStart(1),'*','linewidth', 2)
plot(solveEnd(2),solveEnd(1),'*','linewidth', 2)
plot(time,(sampleTemp2+sampleTemp1)./2)
xlim([0 500])
ylim([20 30])
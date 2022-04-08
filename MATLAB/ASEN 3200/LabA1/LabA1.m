clear,clc,close all

names = ["AM_UNIT06_RWHEEL_RUN01.csv","AM_UNIT06_RWHEEL_RUN02.csv","AM_UNIT06_RWHEEL_RUN03.csv",...
    "AM_UNIT06_RWHEEL_RUN04.csv"];

I = zeros(size(names));

figure
hold on
for i = 1:numel(names)
    I(i) = findMoment(names(i));
end
legend('Rate 1','Fit 1','Rate 2','Fit 2','Rate 3','Fit 3','Rate 4','Fit 4','location','northwest')
xlabel('time [s]')
ylabel('\omega [rad/s]')

standard = std(I);

Iave = mean(I);

function I = findMoment(name)

[data,names] = xlsread(name);

Tc = 33.5e-3; % mNm/A

T = data(:,4)*Tc; % Torque times the torque constant
w = data(:,3)*2*pi/60; % Angular velocity
comT = data(50,2); % Commanded torque
time = data(:,1);

% Finding the first and last point that is in the commanded range
startI = find(T>comT*1e-3,1);
endI = find(T>comT*1e-3,1,'last');
T = T(startI:endI);
w = w(startI:endI);
time = time(startI:endI);
time = (time-min(time))*1e-3;

T = mean(T); % Average torque

alpha = diff(w); % Finding the angular acceleration

alpha = mean(alpha); % Average angular acceleration

p = polyfit(time,w,1);

I = T/p(1); % Moment of inertia

alphaLine = p(1)*time+p(2);
plot(time,w)
plot(time,alphaLine)
end















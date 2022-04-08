clear,clc,close all

names = "Kp_100_small_disturbance.csv";

I = zeros(size(names));

figure
hold on
for i = 1:numel(names)
    I(i) = findMoment(names(i));
end
legend({'Position','Force'},'Location', 'NorthEast')
xlabel('time [s]')
ylabel('\theta [rad/s]')

standard = std(I);

Iave = mean(I);

function I = findMoment(name)

[data,names] = xlsread(name);

Tc = 33.5e-3; % mNm/A

T = data(:,4)*Tc; % Torque times the torque constant
theta = data(:,3); % Angular velocity
comT = data(50,2); % Commanded torque
time = data(:,1);

% Finding the first and last point that is in the commanded range
startI = find(T>comT*1e-3,1);
endI = find(T>comT*1e-3,1,'last');
T = T(startI:endI);
theta = theta(startI:endI);
time = time(startI:endI);
time = (time-min(time))*1e-3;

Tave = mean(T); % Average torque

p = polyfit(time,theta,1);

I = Tave/p(1); % Moment of inertia
plot(time,theta)
plot(time,T)
end















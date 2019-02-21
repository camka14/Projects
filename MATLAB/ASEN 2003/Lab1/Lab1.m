%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Group Names:
% 1. Samuel Razumovskiy
% 2. Ryan Prince
% 3. Robert Refern
% 4. Aryan Regmi
% 
% Author: Samuel Razumovskiy
%
% Purpose: To calculate the velocity and the force exerted on a roller 
% coaster cart as a function of the distance along the track.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

set(groot, 'defaulttextinterpreter', 'latex');  
set(groot, 'defaultAxesTickLabelInterpreter', 'latex');  
set(groot, 'defaultLegendInterpreter', 'latex');

clear, clc, close all

%% Givens
H = 125;
g = 9.81;
s_vec = [0:.5:1200,0];
c = 0;
c2 = 0;
y = zeros(1201,1);
%% Variables
theta = sqrt(2)/2;  % Launch angle
h0 = 50-50*sin(theta); % Launch height
hf = h0;            % Final Height
r = 50;             % Radius

%% Start
Start1 = 2*pi*r/4;
Start2 = Start1+25;
Start3 = Start2+2*pi*r*3/8;

%% Element 1 - Zero G section

% Initial Velocity
syms t
v = sqrt(2*g*(H-h0));

% Parameterization of x and y
y_fun(t) = -.5*g.*t.^2+v*sin(theta).*t;
x_fun(t) = v*cos(theta).*t;

% Velocity components
y_dif = diff(y_fun);
x_dif = diff(x_fun);

% Velocity magnitude
v_fun = sqrt(y_dif^2+x_dif^2);

% Vectors of x,y, and v
tE1 = linspace(0,6.5,300);
xE1 = double(x_fun(tE1));
yE1 = double(y_fun(tE1));
yE1 = yE1(yE1>=0);
v_vec = double(v_fun(tE1));
v_vec = v_vec(1:length(yE1));

% Vector for distance along track
sE1 = zeros(size(yE1));
ds = zeros(size(yE1));

for i=1:length(yE1)-1
    ds(i) = sqrt((xE1(i+1)-xE1(i))^2+(yE1(i+1)-yE1(i))^2);
    sE1(i+1) = sE1(i) + ds(i);
end

% End conditions for zero g section and landing
Element11 = Start3 + sE1(end);
Element12 = Element11 + 2*pi*r/8;

%% Element 2
Element21 = Element12 + 10;
Element22 = Element21 + 2*pi*r/2;
Element23 = Element22 + 10;
 
%% Element 3
Element31 = Element23+pi*r/2;
Element32 = Element31+pi*r;
Element33 = Element32+pi*r/2;

%% End
s_brake = Element33 + 32.03;
v_brake = 0;

%% Calculations

% Solving for y along s for each section except for zero-g section
for s=s_vec
    c = c+1;
    if s<=Start1
        y(c) = 75+r*cos(s/(r));
    elseif Start1<s&&s<=Start2
        y(c) = Start1+75-s;
    elseif Start2<s&&s<=Start3
        y(c) = 50-r*sin((s-Start2)/r);
    elseif Start3<s&&s<=Element11
        y(c) = 0;
    elseif Element11<s&&s<=Element12
        y(c) = 50-50*sin((s-Element11)/50+pi/4);
    elseif Element12<s&&s<Element23
        y(c) = 0;
    elseif Element23<s&&s<Element33
        y(c) = 50 - 50*cos((s-Element23)/50);
    end
end

% Final Velocity Vector
v_fin = sqrt(2*g.*(H-y));
v1 = v_fin(1:443);
v2 = v_fin(914:1974);
v_fin = [v1;.6+v_vec';v2;v_brake];

% Final Distance Vector
s1 = s_vec(1:443);
s2 = s_vec(914:1974);
s_fin = [s1';s1(end)+sE1';s2';s_brake];

% G-Forces magnitude in each direction

Fy = zeros(size(s_fin));
Fx = zeros(size(s_fin));
Fz = zeros(size(s_fin));
zero_g_switch = false;
c = 0;

for i=1:length(s_fin)
    c = c+1;
    if s_fin(i)<=Start1
        if zero_g_switch == false
            Fy(c) = v_fin(c)^2/(50*g)-cos(s_fin(i)/50);
            if Fy(c) < 0.01
                zero_g_switch = true;
            end
        else
            Fy(c) = v_fin(c)^2/(50*g)-cos(s_fin(i)/50);
        end
        Fx(c) = 0;
        Fz(c) = 0;
    elseif Start1<s_fin(i)&&s_fin(i)<=Start2
        Fy(c) = 0;
        Fx(c) = 0;
        Fz(c) = 0;
    elseif Start2<s_fin(i)&&s_fin(i)<=Start3
        Fy(c) = v_fin(c)^2/(50*g)+sin((s_fin(i)-Start2)/50);
        Fx(c) = 0;
        Fz(c) = 0;
        c1 = c;
    elseif Start3<s_fin(i)&&s_fin(i)<=Element11
        Fy(c) = 0;
        Fx(c) = 0;
        Fz(c) = 0;
    elseif Element11<s_fin(i)&&s_fin(i)<=Element12
        Fy(c) = v_fin(c)^2/(50*g)+sin((s_fin(i)-Element11)/50+pi/4);
        Fx(c) = 0;
        Fz(c) = 0;
    elseif Element12<s_fin(i)&&s_fin(i)<=Element21
        Fy(c) = 1-(s_fin(i)-Element12)/10;
        Fx(c) = 0;
        Fz(c) = (s_fin(i)-Element12)/10;
        c2 = c+1;
    elseif Element21<s_fin(i)&&s_fin(i)<=Element22
        Fy(c) = (v_fin(c)^2/50)/g;
        Fx(c) = 0;
        Fz(c) = 1;
    elseif Element22<s_fin(i)&&s_fin(i)<=Element23
        Fy(c) = (s_fin(i)-Element22)/10;
        Fx(c) = 0;
        Fz(c) = 1-(s_fin(i)-Element22)/10;
        c3 = c+1;
    elseif (Element23<s_fin(i)&&s_fin(i)<=Element31) || (Element32<s_fin(i)&&s_fin(i)<Element33)
        Fy(c) = v_fin(c)^2/(50*g)+cos((s_fin(i)-Element23)/50);
        Fx(c) = 0;
        Fz(c) = 0;
    elseif Element31<s_fin(i)&&s_fin(i)<=Element32
        Fy(c) = v_fin(c)^2/(50*g)-sin((s_fin(i)-Element31)/50);
        Fx(c) = 0;
        Fz(c) = 0;
    elseif Element33<s_fin(i)&&s_fin(i)<=s_brake
        Fy(c) = 1;
        Fx(c) = -3.9;
        Fz(c) = 0;
        Fx(c-1) = -3.9;
        Fy(c-1) = 1;
    end
end

figure(1)
grid on

subplot(3,1,1)
hold on
plot(s_fin,Fy)
plot(s_fin(c1), Fy(c1), '*')
plot(s_fin(c2), Fy(c2), '*')
plot(s_fin(c3), Fy(c3), '*')
xlabel("Distance (m)")
ylabel("Force Y (N)")
title("Force Y vs. Distance")
legend("Force", "Element 1", "Element 2", "Element 3")

subplot(3,1,2)
hold on
plot(s_fin,Fx)
plot(s_fin(c1), Fx(c1), '*')
plot(s_fin(c2), Fx(c2), '*')
plot(s_fin(c3), Fx(c3), '*')
xlabel("Distance (m)")
ylabel("Force X (N)")
title("Force X vs. Distance")
legend("Force", "Element 1", "Element 2", "Element 3")

subplot(3,1,3)
hold on
plot(s_fin,Fz)
plot(s_fin(c1), Fz(c1), '*')
plot(s_fin(c2), Fz(c2), '*')
plot(s_fin(c3), Fz(c3), '*')
xlabel("Distance (m)")
ylabel("Force Z (N)")
title("Force Z vs. Distance")
legend("Force", "Element 1", "Element 2", "Element 3")

x0 = 10;
y0 = 10;
width = 1100;
height = 700;
set(gcf,'position',[x0,y0,width,height])

figure(2)
grid on
hold on
plot(s_fin,v_fin)
plot(s_fin(c1), v_fin(c1), '*')
plot(s_fin(c2), v_fin(c2), '*')
plot(s_fin(c3), v_fin(c3), '*')
legend("Velocity","Element 1","Element2","Element3")
xlabel("Distance (m)")
ylabel("Velocity (m/s)")
title("Velocity vs. Distance")
set(gcf,'position',[x0,y0,width,height])


%% EXTRA CREDIT - TIME
time = zeros(length(s_fin)-2,1);
for i = 2:length(s_fin)-2
    time(i) = (s_fin(i+1)-s_fin(i))./v_fin(i);
end

t_ave = s_fin(end)/mean(v_fin); % Sanity check value
t_total = sum(time); % Final time
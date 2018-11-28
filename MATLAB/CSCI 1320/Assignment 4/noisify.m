clear,clc,close all
x = 1:20; % Sets the x axis
y1 = sqrt(x); % Makes y values for each x
plot(x,y1)
hold on
y2 = (rand(1,20)-0.5).*0.1+y1; % Adds noise by subtracting .5 to center and multiplying by .1 to set range
plot(x,y2,'r.')
title('X vs Y and X vs Y + Noise')
xlabel('X')
ylabel('Y')
legend('Y original', 'Y Noise','Location','northwest')
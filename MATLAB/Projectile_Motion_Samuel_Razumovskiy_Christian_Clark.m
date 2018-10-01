clear,clc
%Samuel Razumovskiy and Christian Clark
Vo=20; %m/s
g=9.81; %m/s^2
k=1;
for Theta=[0:5:90]; %degrees
Voy=Vo*sind(Theta); %m/s
Vox=Vo*cosd(Theta); %m/s
MaxH(1,k)=Voy^2/(2*g); %m
t=Voy/g*2; %s
Distance(1,k)=Vox*t; %m
k=k+1;
end
Theta=[0:5:90];
plot(Theta,MaxH)
title('Max Height vs Angle');
xlabel('Angle (degrees)');
ylabel('Max Height (m)');
figure
plot(Theta,Distance)
title('Distance vs Angle');
xlabel('Angle (degrees)');
ylabel('Distance (m)');
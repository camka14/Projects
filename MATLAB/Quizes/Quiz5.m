clear,clc
%Samuel Razumovskiy
meter=[.13,.245,.830,1.65,4.25,8.9];
s=[.8,1.28,1.86,2.55,4,5.5];
M=log(meter); %Finding log of both sides
S=log(s);
EQ=polyfit(M,S,1); %b and m of linear graph
m=(EQ(1,1)); %Finding b and m of equation
b=exp(EQ(1,2));
f=@(x) b*x^m; %Making the function
fplot(f,[.13 8.9],'--'); %plotting as a function
hold on
plot(meter,s,'*')
title('Period of a Simple Pendulum')
xlabel('Length')
ylabel('Period')
legend('Trendlin','Data','location','southeast')
disp('Equation=2.1002*x^0.4378') %Displaying equation of line
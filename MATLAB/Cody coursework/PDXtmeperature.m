clear,clc
Matrix=xlsread('PDXtemp.xlsx','C2:C1792');
Max=Matrix(1:2:1789); %Maxs and Mins split up
Min=Matrix(2:2:1790);
n=4;
b=15;
c=1;
for a=1941:2014
    YearMax(1:12,c)=Max(n:b); %The years are split into columns
    YearMin(1:12,c)=Min(n:b);
    n=b+1;
    b=b+12;
    c=c+1;
end
for n=1:74
    MaxFinal(1,n)=mean(YearMax(:,n)); %The average temperature each in year to look for a trend
    MinFinal(1,n)=mean(YearMin(:,n));
end
plot(1941:2014,MaxFinal,'r',1941:2014,MinFinal,'b')
grid on
figure(1)
title('Yearly Average Temperatures of Portland')
xlabel('Year')
ylabel('Temperature')
legend('Max','Min','location','northwest')
figure(2)
plot(1941:2014,(MaxFinal+MinFinal)/74)
title('Overal Average Temperature')
xlabel('Year')
ylabel('Temperature')
Delta=YearMax-YearMin; %The total change between max's and min's
[MaxDelta,Ix]=max(Delta(:)); %finds the Max and Min and their indice
[MinDelta,In]=min(Delta(:));
[MonthMax,YearMax]=ind2sub(size(Delta),Ix); %Uses the indiceds to find the row and column of Max and Min
[MonthMin,YearMin]=ind2sub(size(Delta),In);
YearMax=YearMax+1940
MonthMax
YearMin=YearMin+1940
MonthMin
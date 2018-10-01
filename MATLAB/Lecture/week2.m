clear,clc
width=[1 3 5];
length=[2 4 6 8];
[L,W]=meshgrid(length, width);
area=L.*W

rad=[1,3,5];
height=[2,4,6,8];
[R,H]=meshgrid(rad,height);
volume=(pi.*R.^2).*H;

Pressure=[0:10:100];
g=9.81;
mercury=13.56
water=1.0
alcohol=.789
Density=[mercury,water,alcohol]
[P,D]=meshgrid(Pressure,Density)
H=P./(D.*g)

hist(x,n)


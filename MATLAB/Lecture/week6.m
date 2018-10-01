clear,clc
temp=[0 20 60 68 77 110]
time=0:5
temp1=interp1(time,temp,2.6)
temp2=interp1(time,temp,4.9)
temp3=interp1(time,temp,4.9,'linear')
temp4=interp1(time,temp,2.6,'spline')
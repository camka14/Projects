clear,clc
A=[80,0,16,4;0,80,20,0;30,10,60,0;10,10,8,72];
Dia=diag(A);
Sum=sum((A),2);
G=Sum-Dia;
P=all(Dia>G) %Proves that it is diagonally dominant
tol=1e-8;
format shortG
p=[.25,.25,.25,.25];
i=0;
Y1=1;
Y2=.25;
Y3=.25;
Y4=.25;
while abs(Y1-p(1)) > tol
    p=[Y1,Y2,Y3,Y4];
    Y1=(39-30*p(3)-10*p(4))/80;
    Y2=(27-10*p(3)-10*p(4))/80;
    Y3=(25.2-16*Y1-20*Y2-8*p(4))/60;
    Y4=(8.8-4*Y1)/72;
    i=i+1;
end
i
p
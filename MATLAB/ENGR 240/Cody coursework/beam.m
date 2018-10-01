function [x,y_calc,y_exact] = beam(T,q,L,E,I)
error=1e-3;
ymid=1;
xmid=1;
n=5;
f=@(x) 0.375.*x.^2-28.125.*x+(3.75e5)-1.775656266e5.*exp(.0014142.*x)-1.974343774e5.*exp(-.0014142.*x);
while abs(ymid-f(L/2))>error
    delta=L/(n-1); %gives me delta x
    x=[0:delta:L]'; %gives me the position on the beam
    m=zeros(n,n); %creates an nxn matrix
    m(1,1)=1; %places a 1 in the first position
    m(end:end)=1; %places a 1 in the last position
    t=zeros(n,1); %creates a zero matix for the matrix on the right
    k=1;
    for i=2:n-1
        m(i,k)=1/delta^2; %finds values for the first y-value in the row
        m(i,k+1)=-2/delta^2-2e-6; %finds values for the middle y-value in the row
        m(i,k+2)=1/delta^2 %finds values for the final y-value in the row 
        t(i,1)=(7.5e-7)*(k*delta)*(L-k*delta); %finds values for the right side of the equation
        k=k+1;
    end
    y_calc=m\t;
    y_exact=f(x);
    ymid=min(y_calc);
    n=n+2;
end
end
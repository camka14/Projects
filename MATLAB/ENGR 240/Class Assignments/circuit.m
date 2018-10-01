function [I] = circuit(increment)
n=1;
format long
for v1=0:increment:120
    r=[65 -20 -10;-20 65 -20;-10 -20 70];
    v=[v1 50 200]';
    [L,U]=lu(r);
    y=L\v;
    x=U\y;
    I(n,:)=x;
    n=n+1;
end
end
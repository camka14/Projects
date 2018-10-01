clear,clc
n=1;
format longG
for A=5:1:9 %Given Alphas
    f=@(O) besselj(A,O);
    ans(n,1)=fzero(f,10);
    n=n+1;
end
ans
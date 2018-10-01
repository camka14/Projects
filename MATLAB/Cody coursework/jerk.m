function [method1, method2] = jerk(n)
time=0:0.5:20;
y=[1.1598 0.4475 -0.4118 -0.8763 -1.1162 -1.3032 -1.0846 -0.9286 -0.6847 -0.3565...
    0.1492 0.3196 0.4174 0.6239 0.3741 0.4941 0.3753 0.1869 -0.0604 -0.0509...
    -0.2230 -0.3186 -0.3044 -0.0780 -0.2808 -0.1727 -0.1700 -0.0001 -0.0872 0.2039...
    0.0036 -0.0320 0.0162 0.0378 -0.0943 0.1494 -0.0698 -0.0941 -0.1715 -0.1009 -0.1712]';
G=gradient(y(1:n),.5)';
for x=1:1:n
    if x<=2
        f(x)=(-y(x+2)+4*y(x+1)-3*y(x));
    elseif x>n-2
        f(x)=(y(x-2)-4*y(x-1)+3*y(x));
    else
        f(x)=(y(x-2)-8*y(x-1)-y(x+2)+8*y(x+1))/6;
    end
end
method1=G'
method2=f'
% t=0:.5:20
% plot(t,method1,'--',t,method2)
% legend('Gradient','Difference Method')
% title('Jerk')
% xlabel('Acceleration(m/s)')
% ylabel('Time(s)')
end
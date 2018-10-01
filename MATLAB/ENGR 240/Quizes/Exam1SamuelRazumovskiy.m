clear,clc
%question 1
disp('Samuel Razumovskiy')
disp('Exam 1')
disp('10/19/2016')
v1=Rocket(-5:40)
v2=Rocket(5:.5:30)
plot(-5:40,v1,'--',5:.5:30,v2,'-')
legend('v1','v2','location','northwest')
xlabel('Time(s)')
ylabel('Velocity(m/s)')

%question 2
R=[2.5:.1:3.5];
tol=1e-5;
Hl=1;
Hu=6;
n=0;
for R=R
    while abs(30-pi*Hu^2*((3*R-Hu)/3))>tol
        if pi*Hl^2*((3*R-Hl)/3)<30 && pi*Hu^2*((3*R-Hu)/3)>30
            Hm=(Hl+Hu)/2;
            if pi*Hm^2*((3*R-Hm)/3)>30
                Hu=Hm;
            else
                Hl=Hm;
            end
        else
            Hu=Hu+1;
        end
    end
    n=n+1;
    H(n,1)=Hu;
    Hl=1;
    Hu=6;
end
H
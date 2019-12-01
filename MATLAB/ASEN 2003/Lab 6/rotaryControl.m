%%% Closed Loop System (Stiff Bar)
clc
clear
close all

[thetaEx,tEx,vInExp] = fileRead('Kp_18.csv');
tEx = (tEx - min(tEx))./ 1000;
ind1 = find(thetaEx(5000:6000)<-.2, 1, 'last')+5000;
ind2 = find(tEx<0.3,1,'last') + ind1;
thetaEx = thetaEx(ind1:ind2);
tEx = tEx(ind1:ind2) - tEx(ind1);

KpArr = linspace(15,50,36);
KdArr = linspace(-1.5,1.5);
thetad = 0.2;
i = 0;

% for Kp=KpArr
%     for Kd=KdArr
%         [t,theta] = getStepRigid(Kp,Kd,thetad);
%         if(max(theta) > thetad*(1+0.05))
%             setTRigid = t(find(theta < thetad*(1+0.05),1,'last'));
%         else
%             setTRigid = t(find(theta < thetad*(1-0.05),1,'last'));
%         end
%         overshoot = max(theta);
%         vIn = Kp*(thetad-theta)-Kd*gradient(theta)./gradient(t);
%         maxV = max(vIn);
%         
%         if setTRigid < .15 && overshoot < thetad*(1+0.05) && maxV < 10
%             i = i+1;
%     
%             goodKp(i) = Kp;
%             goodKd(i) = Kd;
%             goodTime(i) = setTRigid;
%         end
%     end
% end

% [minT,Index] = min(goodTime);
% [maxT,Index2] = max(goodTime);
% KpDesired = goodKp(Index)
% KdDesired = goodKd(Index)
% KpTest = goodKp(Index2)
% KdTest = goodKd(Index2)

[MaxOver, MaxInd] = max(thetaEx);
MaxTime = tEx(MaxInd);


[t1,thetaDesired] = getStepRigid(24,-.05,thetad);
[t2,thetaTest] = getStepRigid(18,-.17,thetad);

figure(1)
hold on

plot(t2,thetaTest)
plot(tEx,thetaEx)
plot(MaxTime,MaxOver,'*','linewidth',5)
plot(.235,.227,'*','linewidth',5)
title('Model vs. Experiment, Kp=18, Kd=-0.17')
legend('Model','Experiment','Settling Time','Max Overshoot','location','southeast')
xlabel('Time(s)');ylabel('Theta (rad)');

%%% Closed Loop System (Flexible Bar)

K1 = 12;
K2 = 0;
K3 = 1.2;
K4 = 1.2;

[tDif,Dif,tDis,Dis] = getStepFlexy(K1,K2,K3,K4,thetad);

[xF,tF,~,tip] = fileRead('Flexy_second.csv');
tF = (tF - min(tF))./ 1000;
ind1 = find(xF(3000:5000)<-.2, 1, 'last')+3000;
ind2 = find(tF<1.2,1,'last') + ind1;
xF = xF(ind1:ind2);
tF = tF(ind1:ind2) - tF(ind1);

indSet = find(Dif < thetad*(1-0.05),1,'last');
[maxOvershoot,OverI] = max(Dif);
setT = tDif(indSet);
setTheta = Dif(indSet);

indSet = find(xF < thetad*(1-0.05),1,'last');
% indSet = indSet(1);
setTEx = tF(indSet);
setThetaEx = xF(indSet);

figure(2)
hold on
plot(tDif,Dif);
plot(tF,xF)
plot(setT,setTheta,'*')
plot(setTEx,setThetaEx,'*')
plot(tDif(OverI),maxOvershoot,'*')
title('Model 2 vs. Experimental')
legend(sprintf('K1=%d,K2=%d,K3=%1.1f,K4=%1.1f',K1,K2,K3,K4),'Experiment 1','Model Settle Time','Experiment Settle Time','Model Max Overshoot','location','southeast')
ylabel('Theta (Rad)')
xlabel('Time (s)')


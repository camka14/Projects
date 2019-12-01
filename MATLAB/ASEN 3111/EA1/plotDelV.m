function plotDelV(dataUp,dataDo,No,C)
% plotDelV does all the plotting and printing.

velPat = 'V\d+';
posPat = 'x\d+';

% Not plotting these
ignore = {'V15_x018_r1','V15_x018_r2','V15_x023_r3','V15_x033_r3',...
    'V15_x038_r2','V15_x038_r3','V25_x018_r1','V25_x018_r2','V25_x023_r2',...
    'V25_x033_r1','V25_x038_r1','V25_x038_r2','V25_x240_r1','V25_x210_r3',...
    'V25_x180_r1','V25_x150_r1','V25_x120_r2','V25_x090_r2','V25_x090_r1',...
    'V15_x210_r1','V15_x180_r4','V15_x120_r1','V15_x120_r2','V15_x090_r2',...
    'V15_x090_r1','V25_x120_r3'};
i = 1;
m =1;
o = 1;
n = 1;

% For every set of data from the upper portion
for j = 1:length(dataUp)
    name1 =  dataUp{2,j};
    
    % Useing regular expresions I find the velocity and positions
    vel = regexp(dataUp{2,j},velPat,'match');
    pos = regexp(dataUp{2,j},posPat,'match');
    
    % For every set of data from the down portion
    for k = 1:length(dataDo)
        name2 = dataDo{2,k};
        if strcmp(name1,name2) && strcmp(vel{1},'V15')
            
            % Calculates Delta u
            [y,delU,U1,U2,rho2] = findDelU(dataUp{1,j},dataDo{1,k});
            
            % Fixing some broken data
            if strcmp(name1,'V15_x043_r2')
                y(1:7) = fliplr(y(1:7));
                delU(1:7) = fliplr(delU(1:7));
            end
            if strcmp(name1,'V15_x090_r2')
                y = fliplr(y);
                delU = fliplr(delU);
            end
            
            % Plots the points gets the half width and delta u max
            if ~any(strcmp(ignore,name1))
                [maxDelU15(i),I] = max(delU);
                halfWidthlow = interp1(delU(1:I),y(1:I),maxDelU15(i)/2);
                halfWidthup = interp1(delU(I:end),y(I:end),maxDelU15(i)/2);
                halfWidth1(i) = (halfWidthup-halfWidthlow)/2;
                
                figure(6)
                subplot(2,2,1+No)
                hold on
                plot(delU/maxDelU15(i),y/halfWidth1(i))
                x1(i) = str2double(pos{1}(2:end));
                
                figure(1+No)
                hold on
                plot(delU,y)
                legname = regexp(dataUp{2,j},posPat,'match');
                legNames15(i) = {['x = ',legname{1}(2:end)]};
                i = i+1;
                
                CD15(n) = trapz(y*0.001,rho2.*U2.*delU)./(.5*rho2.*U1.^2*C);
                n = n+1;
            end
        end
        
        % Same as previous but for 25 m/s
        if strcmp(name1,name2) && strcmp(vel{1},'V25')
            [y,delU,U1,U2,rho2] = findDelU(dataUp{1,j},dataDo{1,k});
            
            if strcmp(name1,'V25_x090_r2')
                y = fliplr(y);
                delU = fliplr(delU);
            end
            
            if ~any(strcmp(ignore,name1))
                [maxDelU25(m),I] = max(delU);
                halfWidthlow = interp1(delU(1:I),y(1:I),maxDelU25(m)/2);
                halfWidthup = interp1(delU(I:end),y(I:end),maxDelU25(m)/2);
                halfWidth2(m) = (halfWidthup-halfWidthlow);
                
                figure(6)
                subplot(2,2,2+No)
                hold on
                plot(delU/maxDelU25(m),y/halfWidth2(m))
                x2(m) = str2double(pos{1}(2:end));
                
                figure(2+No)
                hold on
                plot(delU,y)
                legname = regexp(dataUp{2,j},posPat,'match');
                legNames25(m) = {['x = ',legname{1}(2:end)]};
                m = m+1;
                
                CD25(o) = trapz(y*0.001,rho2.*U2.*delU)./(.5*rho2*U1.^2*C);
                o = o+1;
            end
        end
    end
end

% Plotting logic for the titles
if No == 0
    uppery = 15;
    lowery = -15;
    upperx = 10;
    name = 'Airfoil';
else
    uppery = 30;
    lowery = -30;
    upperx = 15;
    name = 'Cylinder';
end
figure(1+No)
title(sprintf([name,' Velocity Deficit V = 15']))
legend(legNames15)
xlabel('Velocity Deficit (m/s)')
ylabel('Y Position (mm)')
xlim([0,upperx])
ylim([lowery,uppery])

figure(2+No)
title(sprintf([name,' Velocity Deficit V = 25']))
legend(legNames25)
xlabel('Velocity Deficit (m/s)')
ylabel('Y Position (mm)')
xlim([0,upperx])
ylim([lowery,uppery])

figure(5)
sgtitle('Wake Half Width vs. Position')
subplot(2,2,1+No)
plot(x1,halfWidth1)
title(sprintf([name,' V = 15']))
xlabel('x (mm)')
ylabel('\delta y (mm)')

figure(5)
subplot(2,2,2+No)
plot(x2,halfWidth2)
title(sprintf([name,' V = 15']))
xlabel('x (mm)')
ylabel('\delta y (mm)')

figure(6)
sgtitle('Non-Dimensional Velocity Deficit')
subplot(2,2,1+No)
title(sprintf([name,' V = 25']))
xlabel('Velocity Deficit (m/s)')
ylabel('Y Position (mm)')

figure(6)
subplot(2,2,2+No)
title(sprintf([name,' V = 25']))
xlabel('Normalized Velocity Deficit')
ylabel('Normalized Y Position')

fprintf('Cd at 15m/s %s = \n',name)
disp(CD15')
fprintf('Cd at 25m/s %s = \n',name)
disp(CD25')
fprintf('Cd average at 15m/s for %s = %1.3f\n',name,mean(CD15))
fprintf('Cd average at 25m/s for %s = %1.3f\n\n',name,mean(CD25))

figure(7)
sgtitle('Max \delta u vs. Position')
subplot(2,2,1+No)
plot(x1,maxDelU15)
title(sprintf([name,' V =15']))
xlabel('x position (mm)')
ylabel('Max \delta u (m/s)')

figure(7)
subplot(2,2,2+No)
plot(x1,maxDelU25)
title(sprintf([name,' V =25']))
xlabel('x position (mm)')
ylabel('Max \delta u (m/s)')

figure(8)
sgtitle('Wake Half Width vs. Position')
subplot(2,2,1+No)
plot(x1,maxDelU15)
title(sprintf([name,' V =15']))
xlabel('x position (mm)')
ylabel('Wake Half Width (mm)')

figure(8)
sgtitle('Wake Half Width vs. Position')
subplot(2,2,2+No)
plot(x1,maxDelU25)
title(sprintf([name,' V =25']))
xlabel('x position (mm)')
ylabel('Wake Half Width (mm)')
end


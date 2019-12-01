function Plotting(As,Eb,Ebs,Girs,Qamb,Gsol,name)
% Function for plotting the temperature, heat power, and solar flux

% IR bacload in eclipse
GirE = 11;

% Emmisivity  and absorptivity for IR and Solar radiation
epir = 0.85;
alphair = 0.85;
alphasol = .2;
sigma = 5.67e-8;

% Incident angle of the space craft throughout the orbit
theta = linspace(0,2*pi,150);
inc = sin(theta);
ecang = 0.151849;

% Solar incident radiation and IR backload throughout the orbit
for i=1:numel(theta)
    if theta(i) < (pi-ecang) && theta(i) >= 0
        Gi(i) = alphasol*Gsol*inc(i);
        Gir(i) = Girs;
        Jir(i) = epir*Eb+(1-alphair)*Girs;
        Jirs(i) = epir*Ebs+(1-alphair)*Girs;
    elseif theta(i) > pi+ecang
        Gi(i) = 0;
        Gir(i) = Girs;
        Jir(i) = epir*Eb+(1-alphair)*Girs;
        Jirs(i) = epir*Ebs+(1-alphair)*Girs;
    else
        Gi(i) = 0;
        Gir(i) = GirE;
        Jir(i) = epir*Eb+(1-alphair)*GirE;
        Jirs(i) = epir*Ebs+(1-alphair)*GirE;
    end
end

% Power of the heater with negative values using the equation 
% Qin = Qir-Qsol-Qamb where Qin = 0 and Qir = As*(Jir-Gir) and Qsol = As*Gi
Qh = As*(Jir-Gir-Gi)-Qamb;
% Survival heater
Qhsur = As*(Jirs-Gir-Gi);
for i = 1:numel(Qh)
    if Qhsur(i) > 0
        Qheatsur(i) = Qhsur(i);
    else
        Qheatsur(i) = 0;
    end
end
for i = 1:numel(Qh)
    if Qh(i) > 0
        Qheat(i) = Qh(i);
    else
        Qheat(i) = 0;
    end
end

% The temperature without the heater using the equation from above and
% solving for T
T = ((((Qamb)/As)+Gir+Gi-(1-alphair)*Gir)/(epir*sigma)).^(1/4)-273.15;

% The temperature with the heater, not needed really
Theat = ((((Qamb+Qheat)/As)+Gir+Gi-(1-alphair)*Gir)/(epir*sigma)).^(1/4)-273.15;

% Temperature for survival
Tsur = ((((Qamb+Qheatsur)/As)+Gir+Gi-(1-alphair)*Gir)/(epir*sigma)).^(1/4)-273.15;


figure
plot(theta*180/pi,Theat)
title(['Temperature w/Heater During ',name])
xlabel('Incident Angle (deg)')
ylabel('Temperature (C)')

figure
plot(theta*180/pi,T)
title(['Temperature w/o Heater During ',name])
xlabel('Incident Angle (deg)')
ylabel('Temperature (C)')

figure
plot(theta*180/pi,Qheat)
title(['Operational Heater Power During ',name])
xlabel('Incident Angle (deg)')
ylabel('Power (W)')

figure
plot(theta*180/pi,Qheatsur)
title(['Survival Heater Power During ',name])
xlabel('Incident Angle (deg)')
ylabel('Power (W)')

figure
plot(theta*180/pi,Gi)
title(['Solar Flux During ',name])
xlabel('Incident Angle (deg)')
ylabel('Flux (W)')

end


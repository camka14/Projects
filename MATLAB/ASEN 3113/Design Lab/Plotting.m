function Plotting(As,ecang,Eb,Ebsur,Girs,Qamb,Gsol,name)
% Function for plotting the temperature, heat power, and solar flux

% IR backload in eclipse
GirE = 11;

% Emmisivity  and absorptivity for IR and Solar radiation
epir = 0.85;
alphair = 0.85;
alphasol = .2;
sigma = 5.67e-8;

% Incident angle of the space craft throughout the orbit
theta = linspace(0,2*pi,150);
inc = sin(theta);

% Solar incident radiation and IR backload throughout the orbit
for i=1:numel(theta)
    if theta(i) < (pi-ecang) && theta(i) >= 0
        Gi(i) = alphasol*Gsol*inc(i);
        Gir(i) = Girs;
    elseif theta(i) > pi+ecang || ecang==0
        Gi(i) = 0;
        Gir(i) = Girs;
    else
        Gi(i) = 0;
        Gir(i) = GirE;
    end
end


% The temperature without the heater
T = ((((Qamb)/As)+Gir+Gi-(1-alphair)*Gir)/(epir*sigma)).^(1/4);
Tsur = ((Gir+Gi-(1-alphair)*Gir)/(epir*sigma)).^(1/4);

for i=1:numel(T)
    Jir = epir*Eb+(1-alphair)*Gir(i);
    Jirsur = epir*Ebsur+(1-alphair)*Gir(i);
    if T(i) <= 293.15
        Qh(i) = As*(Jir-Gir(i)-Gi(i))-Qamb;
    else
        Qh(i) = 0;
    end
    if Tsur(i) <= 273.15-40
        QhSur(i) = As*(Jirsur-Gir(i)-Gi(i));
    else
        QhSur(i) = 0;
    end
end
time = linspace(0,24,150);
figure
plot(time,T-273.15)
title(['Temperature w/o Heater During ',name])
xlabel('Time (Hr)')
ylabel('Temperature (C)')

figure
plot(time,Qh)
title(['Operational Heater Power During ',name])
xlabel('Time (Hr)')
ylabel('Power (W)')

figure
plot(time,QhSur)
title(['Survival Heater Power During ',name])
xlabel('Time (Hr)')
ylabel('Power (W)')

figure
plot(time,Gi)
title(['Solar Flux During ',name])
xlabel('Time (Hr)')
ylabel('Flux (W/m^2)')

end


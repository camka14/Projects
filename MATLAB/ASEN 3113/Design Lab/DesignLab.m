clear,clc,close all

GirW= 88; % Solar IR backload in winter solstice
GirS= 63; % Solar IR backload in summer solstice
Gireq = (GirS+GirW)/2; % Solar IR backload in equinox
Gsol = 1373*cosd(23.5); % Solar radiation in summer and winter solstice
GsolE = 1373; % Solar radiation in equinox
GirE = 11; % IR backload in eclipse
Qamb = 20; % Operational power zero for survival
epir = 0.85; % IR emmisivity 
alphair = 0.85; % IR absoptivity
alphasol = .2; % Solar radiation absorptivity
Tmax = 30+273.15; % Max operational temperature
Tmin = 20+273.15; % Min operational temperature
Ts = -40+273.15; % Survival temperature
sigma = 5.67e-8; % Boltzman's constant

Ebmax = sigma*Tmax^4; % Radiation of a black body at max temperature
Ebmin = sigma*Tmin^4; % Radiation of a black body at min temperature
Ebs = sigma*Ts^4; % Radiation of a black body at survival temperature
Jirmax = epir*Ebmax+(1-alphair)*Gireq; % Total radiation from the surface

As = Qamb/(Jirmax-Gireq-alphasol*GsolE); % Minimum surface area required

name = {'Equinox','Summer Solstice','Winter Solstice'};
Plotting(As,Ebmin,Ebs,Gireq,Qamb,GsolE,name{1})
Plotting(As,Ebmin,Ebs,GirS,Qamb,Gsol,name{2})
Plotting(As,Ebmin,Ebs,GirW,Qamb,Gsol,name{3})


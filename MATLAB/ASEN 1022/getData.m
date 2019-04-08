function [load,exten] = getData(filename)
data = xlsread(filename);

load = data(:,2);
exten = data(:,4);

[~,Imax] = max(exten);

load = load(1:Imax);
exten = exten(1:Imax);

Lmin = min(load);
load = load-Lmin;

Emin = min(exten);
exten = exten-Emin;

end


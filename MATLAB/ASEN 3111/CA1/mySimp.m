function [Out] = mySimp(N,pres)
%mySimp Uses the composite Simpson's rule to integrate around a circle
% Takes an input of the number of panels and a pressure distribution, then
% uses a composite Simpson's rule for a line integral over a circle
tot = zeros(length(pres),1);
h = 2*pi/N;
for k=2:2:N
   tot = pres(k-1)+4*pres(k)+pres(k+1);
end
Out = sum(tot)*h/3*.5;
end


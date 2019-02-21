function V = LCSMODEL(r,d,l,theta,w)

beta = asin((d-r.*sin(theta))./l);

V = -w.*r.*(tan(beta).*cos(theta)+sin(theta));

end


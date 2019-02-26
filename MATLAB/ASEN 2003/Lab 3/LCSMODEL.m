function V = LCSMODEL(r,d,l,theta,w)

% Input: r = mm, d = mm, l = mm, theta = radians, w = radians/s
% Output: V = mm/s

beta = asin((d-r.*sin(theta))./l);

V = -w.*r.*(tan(beta).*cos(theta)+sin(theta));

end


clear,clc
r = [-3559.9;-266.08;-11152];
v = [0.55525;-0.057462;-1.1038];
h = cross(r,v);
n = cross([0;0;1],h);
RAAN = -acosd(dot(n,[1;0;0])/norm(n));
i = acosd(h(3)/norm(h));
e = cross(v,h)/22030-r/norm(r);
emag = norm(e);
Ap = acosd(dot(n,e)/(norm(n)*emag));
tr = acosd(dot(r,e)/(norm(r)*emag));
C = [cosd(RAAN)*cosd(tr+Ap)-sind(RAAN)*cosd(i)*sind(tr+Ap),-cosd(RAAN)*sind(tr+Ap)-sind(RAAN)*cosd(i)*cos(tr+Ap),sind(RAAN)*sind(i);...
    sind(RAAN)*cosd(tr+Ap)+cosd(RAAN)*cosd(i)*sind(tr+Ap),-sind(RAAN)*sind(tr+Ap)+cosd(RAAN)*cosd(i)*cosd(tr+Ap),-cosd(RAAN)*sind(i);...
    sind(i)*sind(tr+Ap), sind(i)*cosd(tr+Ap), cosd(i)];
rt = C'*r;
vt = C'*v;

pqw = [cosd(tr),sind(tr),0;-sind(tr),cosd(tr),0;0,0,1]';
rpqw = pqw*rt
vpqw = pqw*vt
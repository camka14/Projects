function [theta_exp,w_exp,v_exp] = LCSDATA(filename)

% Output: theta_exp = radians, w_exp = radians/s, v_exp = mm/s

data = csvread(filename,1,0);
theta = data(:,2);
theta_exp = (theta-theta(1)+mod(theta(1),360))*pi/180;
w_exp = data(:,4).*pi/180;
v_exp = data(:,5);

end
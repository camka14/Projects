function [v,v_exp,theta,errorcalc,diff] = getDataOut(r,d,l,theta,w,v_exp)

% Input: r = mm, d = mm, l = mm, theta = radians, w = radians/s, v_exp =
% mm/s

% Output: v = cm/s, v_exp = mm/s, theta = radians/s, errorcalc = cm/s,
% diff = cm/s


v = LCSMODEL(r,d,l,theta,w);
v = v*.1;
v_exp = v_exp*.1;

diff = abs((v-v_exp)./v_exp);

% noOutliers1 = diff<10;

% diff = diff(noOutliers1);
% theta = theta(noOutliers1);
% v = v(noOutliers1);
% v_exp = v_exp(noOutliers1);

errorcalc(1) = std(diff);
errorcalc(2,1) = mean(diff);

end
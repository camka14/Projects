function out = displayTime(h,m,s,form,am_pm)
% Name: Samuel Razumovskiy
% ID: 109343605
% Course: CSCI 1320-100
% Recitation: 108
% Lab: 2
% prints the time
if form == 12
    fprintf('Time in %d hour format is: %d:%d:%d',24,h,m,s)
    out = sprintf('Time in %d hour format is: %d:%d:%d',24,h,m,s);
else
    fprintf('Time in %d hour format is: %d:%d:%d %s',12,h,m,s,am_pm)
    out = sprintf('Time in %d hour format is: %d:%d:%d %s',12,h,m,s,am_pm);
end
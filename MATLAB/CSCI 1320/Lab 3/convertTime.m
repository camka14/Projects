function converted = convertTime(h,m,s,form,am_pm)
% Name: Samuel Razumovskiy
% ID: 109343605
% Course: CSCI 1320-100
% Recitation: 108
% Lab: 2
% Converts from 12 to 24 hr format or vice-versa
if form == 12
    if am_pm == 'pm'
        h=h+12; % adds 12 hrs to a value that is in 12 hr format and pm
    end    
end

if form == 24
    am_pm = 'AM';
    if h>12
        h = h-12; % Removes 12 hrs from 24 hour format if the time is past 12 hrs
        am_pm = 'PM';
    end
end
converted = printTime(h,m,s,form,am_pm);
end
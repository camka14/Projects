function time = getInputs()
% Name: Samuel Razumovskiy
% ID: 109343605
% Course: CSCI 1320-100
% Recitation: 108
% Lab: 2
% An interactive time convertion function
hour = input('Enter Hour: ');
minutes = input('Enter Minutes: ');
seconds = input('Enter Seconds: ');

format = input('Enter Time Format(12/24): ');
if format~= 12 && format ~= 24 % Checks if the format input is correct
    error('Format value is invalid!')
end
if format == 12
    if hour>12 || hour<1 % Checks if the hours are in range
        error('Hour value is invalid!')
    end
    am_pm = input('Enter if AM or PM (am/pm): ','s');
else
    if hour>24 || hour<1 % Checks if the hours are in range
        error('Hour value is invalid!')
    end
    am_pm = 24;
end

if minutes>59 || minutes<0 % Checks if the minutes are in range
    error('Minute value is invalid!')
elseif seconds>59 || seconds<0 % Checks if the minutes are in range
    error('Seconds value is invalid!')
end

time = convert(hour,minutes,seconds,format,am_pm);
end


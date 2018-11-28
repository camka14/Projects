function out = repvec(vec,x)
% Name: Samuel Razumovskiy
% ID: 109343605
% Course: CSCI 1320-100
% Recitation: 108
% Lab: 2
% Duplicates each element of a row vector by a given amount

out = zeros(1,length(vec)*x); % Preallocating vector
count=0;
if x==0
    out=[];
end
for i = 1:length(vec)
    for x=1:x
        count=count+1;
        out(count) = vec(i); % Inputs each element x amount of times into the new vector
    end
end
end
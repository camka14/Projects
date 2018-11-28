function out = smallest(vec)
% Name: Samuel Razumovskiy
% ID: 109343605
% Course: CSCI 1320-100
% Recitation: 108
% Lab: 2
% Duplicates each element of a row vector by a given amount

out = min(vec(find(vec==0)-1));
if isempty(out)
    out = [];
end
end
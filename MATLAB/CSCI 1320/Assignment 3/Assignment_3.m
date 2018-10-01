% Name: Samuel Razumovskiy
% Section: 108
% Course: CSCI 1320
% Assignment: 3
% sara6569@colorado.edu

clear,clc
% Task 1
colvec1 = [-18:-12]; %a
colvec1 = linspace(-18,-12,7); %b

colvec2 = [8:4:16]; %a
colvec2 = linspace(8,16,3); %b

colvec3 = [16:-6:4]; %a
colvec3 = [16,4,3]; %b

% Task 2
first = [13,1,30,5]; % first column in matrix
last = [7,9,10,25]; % last column in matrix
for i = [1:length(last)]
    M(i,:) = [linspace(first(i),last(i),3)]; % creates rows 
end
% A
m1 = M(end);
% B
m2 = M(:,end);
% C
m3 = M(2:3,:);
    
% Task 3
vec = [-11 5 3 2 -18 4 -5 5 -66];

% a
vec1 = vec(find(vec>0));

% b
vec2 = vec(vec>0);
clear,clc
% Name: Samuel Razumovskiy
% Assignment: Midterm Practicum
% Recitation: 108

vec1 = 10:10:60;
vec2 = 80:-20:20;
vec3 = [-4:1:-1,-5]; % Created all the vectors using colon operators, and added a -5 to the end of vec3
mycell = {vec1,vec2,vec3}; % Puts all the values into a cell
for i = 1:length(mycell)
   rotateRight(mycell{i}); % Loops through the cell and runs the function
end
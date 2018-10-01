clear,clc
% Name: Samuel Razumovskiy
% Section: 108
% Course: CSCI 1320
% Assignment: 3
% sara6569@colorado.edu

% Task 5
y = input('Please enter the year: ');
a = mod(y,19);
b = floor(y/100);
c = mod(y,100);
d = floor(b/4);
e = mod(b,4);
g = floor((8*b+13)/25);
h = mod(19*a+b-d-g+15,30);
j = floor(c/4);
k = mod(c,4);
m = floor((a+11*h)/319);
r = mod(2*e+2*j-k-h+m+32,7);
n = floor((h-m+r+90)/25);
p = mod(h-m+r+n+19,32);
fprintf('In %d, Easter Sunday fell on %d/%d\n', y,n,p)
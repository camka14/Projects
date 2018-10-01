% Name: Samuel Razumovskiy
% Section: 108
% sara6569@colorado.edu
% Calculates the addition, subtraction, multiplication, division, and power
% of two numbers
clear,clc

input1 = input('first number '); %asks for user input
input2 = input('second number ');

a = addfunc(input1,input2);
s = subtractFunc(input1,input2);
d = divbyFunc(input1,input2);
m = multFunc(input1,input2);
p = divintoFunc(input1,input2);
z = quotientInBoundsFunc(input1,input2);
% Name: Samuel Razumovskiy
% Section: 108
% sara6569@colorado.edu
% Calculates the addition, subtraction, multiplication, division, and power
% of two numbers
clear,clc

input1 = input('first number '); %asks for user input
input2 = input('second number ');

a = input1+input2; % adds both values
fprintf('%d + %d = %d\n',input1,input2,a)

s = input1-input2; % subtracts both values
fprintf('%d - %d = %d\n',input1,input2,s)

m = input1*input2; % multiplies both values
fprintf('%d * %d = %d\n',input1,input2,m)

d = input1/input2; % divides both values
fprintf('%d / %d = %d\n',input1,input2,d)

p = input1^input2; % puts one to the power of the other
fprintf('%d ^ %d = %d\n',input1,input2,p)

z = input1/input2;
if input1<z && z<input2
    out=true;
else
    out=false;
end
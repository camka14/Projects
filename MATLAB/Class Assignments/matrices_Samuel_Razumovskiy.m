clear,clc
a=[1,2,3;4,5,6;7,8,9]
b=rot90(a) %rotated 90degrees
c=rot90(a,2) %rotated 180degrees
d=fliplr(a) %flip horizontally
e=flipud(a) %flip vertically
f=diag(a) %gives the diagonal numbers
g=triu(a) %gives  the numbers above the diagonal
h=triu(a,1) %gives the numbers one above the diagonal
m=tril(a) %gives the numbers below the diagonal
n=tril(a,-1) %gives the numbers one below the diagonal
p=a' %makes all the rows into columns

B=[4 1 3]
C=[-2 5 2]
A=[1 2 3;4 5 6;7 8 9]
D=[1 0 2;-1 4 -2;5 2 1]
X=[2 1;4 3]
E=dot(B,C) %gives the dot product
F=sum(B.*C) %gives the dot product
G=A*D %multiplies the column of D to the rows of A then adding them together
H=D.^2 %sqares every value in D
M=D^2 %multiplies the column of D to the rows of D then adding them together
W=inv(X) %gives the inverse of X
Y=W*X %gives an identity matrix
Z=X*W %gives an identity matrix
N=det(X) %gives the value of the determinant
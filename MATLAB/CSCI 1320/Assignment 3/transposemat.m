function Y = transposemat(your_matrix)
% Name: Samuel Razumovskiy
% Section: 108
% Course: CSCI 1320
% Assignment: 3
% sara6569@colorado.edu
% returns the transpose of matrix x
[r,c]=size(your_matrix);
for col = 1:r
    for row = 1:c
        Y(row,col) = your_matrix(col,row);
    end
end
end
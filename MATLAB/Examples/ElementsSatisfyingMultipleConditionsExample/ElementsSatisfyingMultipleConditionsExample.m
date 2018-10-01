%% Elements Satisfying Multiple Conditions
% Find the first three elements in a 4-by-4 matrix that are greater than
% |0| and less than |10|. Specify two outputs to return the row and column
% subscripts to the elements.

% Copyright 2015 The MathWorks, Inc.

X = [18 3 1 11; 8 10 11 3; 9 14 6 1; 4 3 15 21]

%%
%
[row,col] = find(X>0 & X<10,3)

%%
% The first instance is |X(2,1)|, which is |8|.
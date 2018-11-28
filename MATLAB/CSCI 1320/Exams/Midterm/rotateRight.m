function vecOut = rotateRight(vecIn)
% Function shifts all the values to the right except for the last one which
% is pushed to the front
% Name: Samuel Razumovskiy
% Assignment: Midterm Practicum
% Recitation: 108

[r c] = size(vecIn);
if r == 1 % Checks if there is only one row
    count = 1;
    vecOut = zeros(1, length(vecIn)); % Pre allocating the final vector
    for v = vecIn(1:end-1)
        count = count + 1;
        vecOut(count) = v; % Loops through all the values in the input vector except for the last
    end
    vecOut(1) = vecIn(end); % Places the last value in the input vector
else                        % into the first position of the output vector
    error('Vector must be a row vector')
end
end
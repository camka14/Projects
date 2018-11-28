function [ diff_prod,r_vec,c_vec ] = unique_elements( X, Y)

count = 0;
r = 1;
c = 1;
[r,c] = size(X);
for r = 1:r
    for c = 1:c
        if X(r,c) ~= Y(r,c)
            count = count + 1;
            diff_prod(count) = X(r,c)*Y(r,c);
            r_vec(count) = r;
            c_vec(count) = c;
        end
    end
end
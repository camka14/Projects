function vector = concatPositive(vec1,vec2)
% Concatinates two vectors and concatinates them as a positive column
% vector
i = 0;
vec1 = reshape(vec1,[length(vec1),1]);
vec2 = reshape(vec2,[length(vec2),1]);
vec = [vec1;vec2];
vector = vec(vec>=0);
end
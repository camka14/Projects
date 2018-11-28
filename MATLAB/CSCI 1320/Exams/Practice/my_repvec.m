function vec = my_repvec(inVec, m)
count = 0;
for i = 1:m
    for v = inVec
        count = count + 1;
        vec(count) = v;
    end
end
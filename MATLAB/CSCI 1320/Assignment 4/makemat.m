function out = makemat(vec1,vec2)
%Concatenates two vectors and returns an nx2 matrix
vl1=length(vec1);
vl2=length(vec2); %Stores the lengths of vec 1 and 2 as variables

[r1,c1]=size(vec1);
[r2,c2]=size(vec2);
if (r1 > 1 && c1 > 1) || (r2 > 1 && c2 > 1%Checks if any input is a matrix
    error("Function does not accept matrix as argument, please input vectors")
end
if c1 > 1
    vec1 = transposemat(vec1); %My function that transposes vectors and matrices
end
if c2 > 1
    vec2 = transposemat(vec2);
end

if vl1>vl2
    for i = vl2+1:vl1
        vec2(i) = 0; %Adds zeros to the end of a vector if it is longer than the other
    end
elseif vl2>vl1
    for i = vl1+1:vl2
        vec1(i) = 0;
    end
end
    
out = [vec1,vec2];

end
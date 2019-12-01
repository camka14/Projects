function [Out] = myTrapz(base,height)
%myTrapz Use the composite trapazoidal rule to integrate anything
%   Given the width between each point and a vector of heights the function
%   uses the trapazoidal rule to give an approximate solution to the 
%   integral of the given values

out = zeros(size(height));
for i=1:length(height)-1
    out(i) = base/2*(height(i)+height(i+1));
end

Out = sum(out);
end


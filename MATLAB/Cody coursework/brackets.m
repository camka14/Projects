function [output] = brackets(alpha, x, numroot)
% Inputs and outputs are outlined in the problem descriptions.
% Remember that you can change the names of variables, but not the order.
% Do not change the name of the function (brackets).
for n=1:1:numroot
    while besselj(alpha,x)*besselj(alpha,x+1)>0
        x=x+1
    end
    output(n,1)=x
    output(n,2)=x+1
    x=x+1
end
end
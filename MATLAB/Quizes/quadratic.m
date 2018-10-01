function [ Zero ] = quadratic( a,b,c )
%function used to find zeros using quadratic formula
if a==0;
    if b==0;
        Zero=[999,999];
    else ;
        Zero=[0,-c/b];
    end
else
    if b^2-4*a*c>=0;
        Zero=[(-b-sqrt(b^2-4*a*c))/(2*a),(-b+sqrt(b^2-4*a*c))/(2*a)];
    else
        Zero=[333,333];
    end
end
end


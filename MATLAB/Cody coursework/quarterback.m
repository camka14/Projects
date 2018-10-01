function [theta] = quarterback(v0, h, D, y, theta)
    % Inputs and outputs are outlined in the problem descriptions.
    % Remember that you can change the names of variables, but not the order.
    % Do not change the name of the function (quarterback).
    g=32.2;
    n=0;
    for v0=v0;
    n=n+1;
    Zero=@(theta) D*tand(theta)-(1/2)*(D^2*g)/(v0^2)*(1/cosd(theta)^2)+h-y;
    Angle(n,1)=fzero(Zero,theta);
    end
    theta=Angle
end
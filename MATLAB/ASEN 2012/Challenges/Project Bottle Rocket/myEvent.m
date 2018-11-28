function [value, isterminal, direction] = myEvent(t, X)
value      = (X(1) > 0.002)-0.5;
isterminal = 1;   % Stop the integration
direction  = 0;
end
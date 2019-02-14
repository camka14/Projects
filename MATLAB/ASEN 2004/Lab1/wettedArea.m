function [S_Total] = wettedArea()

%% Fuselage:
a = 0.78;
b = 0.08;
c = b;
S_Fuselage = 4*pi*(((a*b)^(1.6) + (a*c)^(1.6) + (b*c)^(1.6))/(3))^(1/1.6);
%% Vertical Stab.:
L = 0.312;
W = 0.025;
h = 0.4;
S_VS = 2*(L*W + W*h + L*h);
%% Wings:
L = 3.06;
W = 0.23;
h = 0.02001;
S_Wings = 2*(L*W + W*h + L*h);
%% Tail:
L = 0.13;
W = 0.13*0.087;
h = 0.75;
S_Tail = 2*(L*W + W*h + L*h);
%% Prop.:
L = 19*0.0254;
W = 1*0.0254;
S_Prop = L*W*2;
%% Total:
S_Total = S_Fuselage + S_VS + S_Wings + S_Tail + S_Prop;
end
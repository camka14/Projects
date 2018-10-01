function [ yield ] = HallPetch( Usigma0,UK,Ud )
%HallPetch equation
yield=Usigma0+UK.*Ud.^(-1/2);


end


function dy_dt = fun(t,j,mu)
    y = j(1);
    dy = j(2);
    ddy = mu*(1-y^2)*dy-y;
    
    dy_dt = [dy;ddy];
end
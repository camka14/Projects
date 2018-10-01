function rate = reaction(increments)
    % increments is an input, representing the increments in temperature from 273K to 353K
    % rate is an output, representing the reaction rate calculated using the equation.
    % Names of variables (output & increments) can be changed.  The name of function (reaction) and the order of the variables cannot.
    R=8.314 %J/mol*K
    E1=1*10^5 %J/mol
    A1=7*10^16 %1/s
    T=[273:increments:353]
    k1=A1*exp(-E1./(R.*T))
    E2=1.5*10^5
    A2=8*10^16
    k2=A2*exp(-E2./(R.*T))
    k3=k1./k2
    format shortEng
    rate=[k1',k2',k3']
    table(rate)
    subplot(1,2,1)
    semilogy(T,k1,'-x')
    title('Reaction of chemical')
    xlabel('Temperature(K)')
    ylabel('Rate of reaction')
    subplot(1,2,2)
    plot(1./T,k1,'-o')
    title('Reaction of chemcial with inverse time')
    xlabel('Temperature(K)')
    ylabel('Rate of reaction')
end
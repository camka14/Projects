clear,clc,close all

C1 = 0.01e-6;
C2 = 100e-12;
R1 = 1/(4.8e3*2*pi*sqrt(C1*C2));

[wo, Q] = plotSK(R1,C1,C2);

C1 = 16e-6;
C2 = 0.01e-6;
R = 1/(4.8e3*2*pi*sqrt(C1*C2));


[w02, Q2] = plotSK(R,C1,C2);


function [wo, Q] = plotSK(R,C1,C2)
    w = 0:60000;
    w = w.*2*pi;
    wo = 1/(R*sqrt(C1*C2));
    Q = 1/2*sqrt(C1/C2);
    P = 20*log10(wo^2./sqrt((wo^2-w.^2).^2+wo^2.*w.^2./Q^2));
    phi = -atand(w/wo);
    wo = wo/(2*pi);
    w = w./(2*pi);
    
    figure(1)
    hold on
    plot(w,P);
    title('Bode Plot')
    xlabel('Frequency (Hz)')
    ylabel('Power (dB)')
    figure(2)
    hold on
    plot(w,phi);
    title('Phase diagram')
    xlabel('Frequency (Hz)')
    ylabel('Phase Shift (deg)')
end
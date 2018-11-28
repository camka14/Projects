function echo = soundEcho(soundVec, Fs, delay, echoGain)
% This function adds an echo to a sound vector

delaySamples = Fs * delay;
echoeffect = soundVec;
for i = delaySamples+1:length(soundVec)
    echoeffect(i) = soundVec(i)+soundVec(i-delaySamples)*echoGain;
end
sound(echoeffect, Fs, 16)
echo = echoeffect;
end
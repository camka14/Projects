% Name: Samuel Razumovskiy
% ID: 109343605
% Course: CSCI 1320-100
% Recitation: 108
% Lab: 5

clear,clc,close all

choice = menu('What do you want to do?','Select audio file','Play audio vector','Add echo effect','Compress file','Plot frequency domain');

while choice ~= 0
    switch choice
        case 1
            filename = inputdlg('Input the file name');
            [soundVec, Fs] = audioread(filename{1}); % Opens the selected file name
        case 2
            sound(soundVec, Fs, 16) % Plays selected file name
        case 3
            echosetting = inputdlg({'Input delay', 'Input echo gain'},'Settings for echo effect');
            delay = str2double(echosetting{1});
            echoGain = str2double(echosetting{2});
            sounVecEcho = soundEcho(soundVec, Fs, delay, echoGain); % Sets the echo
        case 4
            compratio = inputdlg('Input the compression ratio');
            compratio = str2double(compratio{1});
            compSoundVec = compress(soundVec, compratio); % Compresses the file
        case 5
            fftbar(soundVec,Fs) % Plots the frequencies

    end
    choice = menu('What do you want to do?','Select audio file','Play audio vector','Add echo effect','Compress file','Plot frequency domain');
end
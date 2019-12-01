function name = getName(filename)

rep = regexp(filename,'_r\d+','match');
rep = ['_r',rep{1}(end)];
dist = regexp(filename,'_x\d+','match');
if dist{1}(3) == 0
    dist = ['_x',dist{1}(end:end-1)];
else
    dist = dist{1};
end
vel = regexp(filename,'V\d+','match');
vel = vel{1};
name = [vel,dist,rep];

end
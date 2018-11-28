function comp = compress(soundVec, compratio)
% This function compress a sound vector by removing every nth value
comp = zeros(uint64(fix(length(soundVec)/compratio)),1);
count = 0;
for i = 1:compratio:length(soundVec)
    count = count + 1;
    comp(count) = soundVec(i);
end
end
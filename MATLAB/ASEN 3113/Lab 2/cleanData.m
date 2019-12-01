function [time,temp] = cleanData(time,temp)

dTdt = zeros(1,numel(temp)-26);
for i = 1:numel(temp)-26
    dTdt(i) = (temp(i+26)-temp(i+25))/(time(i+26)-time(i+25));
end
I = find(dTdt>0.01);
temp = temp(I+25:end-5);
time = time(1:end-I-25-4);

end
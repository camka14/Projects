function [time,temp] = getData(filename)

data = load(filename);

time = data(:,1);
temp = data(:,2:end);

end
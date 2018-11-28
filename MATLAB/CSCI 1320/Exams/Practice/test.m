clear,clc
limit = -2;
sent = 'go';
s = 0;
while ~strcmp(sent,'bail')
fprintf('*\n')
if s < limit
sent = 'bail';
fprintf(' bailed \n')
end
s = s - 1;
end
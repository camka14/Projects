clear,clc

[~,~,data] = xlsread('Section9_data.xlsx');
data = data(1:103,1:end); % Cuts off NaNs

column_names = {data(1,1:end)}; % All the column names
sections = {data(1:end,5)}; % Student section No.
[rows,cols] = size(data);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Pre Allocations
multiple_choice = cell(rows-2,cols-7); % Students' answers
essay = cell(rows-2,1); % Students' essay grade
names = cell(rows-2,1); % Student id's
key = cell(1,cols-7); % Key
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for r = 1:rows-2
    multiple_choice(r,:) = data(r+2,7:end-1); % Separates the students' answers into an array
    essay{r} = data{r+2,5}; % Separates the students' essay scores into an array
    names{r} = data{r+2,2}; % Separates the students' id's into an array
end
for i = 1:cols-7
    key{i} = data{2,i+6}; % Stores the key into an array
end
save('Cleaned_Data','multiple_choice','essay','names','key')
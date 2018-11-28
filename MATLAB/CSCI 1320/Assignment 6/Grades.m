clear,clc

load('Cleaned_Data.mat')

[r,c] = size(names);
student_mc_grade = zeros(r,c); % Preallocation of grades
for i = 1:r
    mc_grade = 0;
    for k = 1:length(key)
        if key{k} == multiple_choice{i,k} % Comparison of answers to key
            mc_grade = mc_grade + 1;
        end
    end
    if mc_grade > 0
        student_mc_grade(i) = mc_grade / 17* 100; % Converts grade to out of 100
    else
        student_mc_grade(i) = 0;
    end
end

student_grade = zeros(r,1);
for i = 1:r
    if essay{i}>0
        essay_score = essay{i} / 15 * 100; % Converts essay grades to out of 100
    else
        essay_score = 0;
    end
    student_grade(i) = 0.6 * student_mc_grade(i) + 0.4 * essay_score; % Adds both grades with weight
end

for i = 1:r
    if student_grade(i) >= 93
        grade = 'A';
    elseif student_grade(i) >= 90
        grade = 'A-';
    elseif student_grade(i) >= 87
        grade = 'B+';
    elseif student_grade(i) >= 83
        grade = 'B';
    elseif student_grade(i) >= 80
        grade = 'B-';
    elseif student_grade(i) >= 77
        grade = 'C+';
    elseif student_grade(i) >= 73
        grade = 'C';
    elseif student_grade(i) >= 70
        grade = 'C-';
    elseif student_grade(i) >= 67
        grade = 'D+';
    elseif student_grade(i) >= 63
        grade = 'D';
    elseif student_grade(i) >= 60
        grade = 'D-';
    else
        grade = 'F';
    end
    fprintf('student: %s\n Grade: %s %f\n', names{i}, grade, student_grade(i)) % Prints out grade
end
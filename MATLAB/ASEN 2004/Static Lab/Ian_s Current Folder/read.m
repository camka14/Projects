
function [Isp, FMax, FAvg] = read(filename, frequency)
    
    file = fopen(filename);
    C = textscan(file, '%f %f %f', 'CommentStyle', '%');
    fclose(file);
    
    FArr = C{3};
    FArr = FArr * 4.44822;
    clear C;
    
    times = (1:length(FArr))';
    
    [~, maxIndex] = max(FArr);
    shift = 30;
    FArr = FArr(maxIndex - shift: end);
    times = times(maxIndex - shift:end);
    times = times - times(1);
    
    times = times/frequency;
    
    indices = find(times <= 0.50);
    FArr = FArr(indices);
    times = times(indices);     
    
    indices = find(times > 0.275);
    startIndex = indices(1);
    [~, minIndex] = min(times(indices));
    minIndex = minIndex + startIndex;
    times = times(1:minIndex);
    FArr = FArr(1:minIndex);
    
    slope = FArr(end)/times(end);
    
    func = @(t) t * slope;
    FArr = FArr - (func(times));
    
    FAvg = mean(FArr);
    FMax = max(FArr);
    
    Isp = trapz(times, FArr) / 9.81;
    
    plot(times, FArr, 'LineWidth', 0.5);
   
end
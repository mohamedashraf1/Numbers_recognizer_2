function [max,minIndex] = getMax_Min(distances)

minIndex = 1;
if iscell(distances(1)) == 1
    distances = cell2mat(distances);
end
max = distances(1);
min = distances(1);
[~,col] = size(distances);
%disp(col);
%distances = [1,73]
for i = 2:col
    if distances(i) > max
        max = distances(1,i);
    end
    if distances(i) < min
        min = distances(1,i);
        minIndex = i;
    end
end
end


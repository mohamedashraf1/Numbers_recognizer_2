function [x,y] = getStartingPoint(img)

[row ,col] = size(img);
check =1;
for i = 1:row
    for j = 1:col
        if img(i,j) == 1
            x = i;
            y = j;
            check = 0;
            break;
        end
    end
    if check == 0
        break;
    end
end

end


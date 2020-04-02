function [distances] = getdistances(boundaries,xc,yc)

[d1,d2,~] = size(boundaries);

%d2 = 2
%d3 = 1
distances = {};
sum = 0;
for i = 1:d1
    for j =1:d2
        if j == 1
            sum = sum + (xc-boundaries(i,1,1))^2;
        elseif j == 2
            sum = sum + (yc-boundaries(i,2,1))^2;
        end
    end
    %disp(sum);
    distances = [distances, sqrt(sum)];
    sum = 0;
end

end
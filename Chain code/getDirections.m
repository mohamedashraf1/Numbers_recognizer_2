function [directions] = getDirections(boundaries)

[d1,~,~] = size(boundaries);
%[d1,2,1]
directions = {};
for i = 1:d1-1
    if boundaries(i, 1, 1) == boundaries(i+1, 1, 1) && boundaries(i+1,2,1) == (boundaries(i, 2, 1)+1)
        directions = [directions, 'E'];%x1 = x2 ---- y2 = y1+1
    elseif boundaries(i+1, 1, 1) == (boundaries(i, 1, 1)+1) && boundaries(i+1,2,1) == (boundaries(i, 2, 1)+1)
        directions = [directions, 'SE'];%x2 = x1+1 ----- y2 = y1+1
    elseif boundaries(i+1, 1, 1) == (boundaries(i, 1, 1)+1) && boundaries(i,2,1) == boundaries(i+1, 2, 1)
        directions = [directions, 'S'];%x2 = x1+1 ---- y2 = y1
    elseif boundaries(i+1, 1, 1) == (boundaries(i, 1, 1)+1) && boundaries(i+1,2,1) == (boundaries(i, 2, 1)-1)
        directions = [directions, 'SW'];%x2 = x1+1 ---- y2 = y1-1
    elseif boundaries(i, 1, 1) == boundaries(i+1, 1, 1) && boundaries(i+1,2,1) == (boundaries(i, 2, 1)-1)
        directions = [directions, 'W'];%x2 = x1 ---- y2 = y1-1
    elseif boundaries(i+1, 1, 1) == (boundaries(i, 1, 1)-1) && boundaries(i+1,2,1) == (boundaries(i, 2, 1)-1)
        directions = [directions, 'NW'];%x2 = x1-1 ---- y2 = y1-1
    elseif boundaries(i+1, 1, 1) == (boundaries(i, 1, 1)-1) && boundaries(i,2,1) == boundaries(i+1, 2, 1)
        directions = [directions, 'N'];%x2 = x1-1 ---- y2 = y1
    elseif boundaries(i+1, 1, 1) == (boundaries(i, 1, 1)-1) && boundaries(i+1,2,1) == (boundaries(i, 2, 1)+1)
        directions = [directions, 'NE'];%x2 = x1-1 ---- y2 = y1+1
    end
end

end


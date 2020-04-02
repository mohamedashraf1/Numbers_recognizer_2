function [direction] = getStartingDir(x,y,img)
direction = '';
    
if img(x,y+1) == 1 
    direction = 'E';
elseif img(x+1,y+1) == 1
    direction = 'SE';
elseif img(x+1,y) == 1
    direction = 'S';
elseif img(x+1,y-1) == 1
    direction = 'SW';
    
end

end
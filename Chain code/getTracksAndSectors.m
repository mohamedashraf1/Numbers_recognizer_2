function [output] = getTracksAndSectors(boundaries, distances, R, T, S, xc, yc)
%boundaries(end,:,:) = [];
%boundaries = S;

distances = cell2mat(distances);

[~,rows] = size(distances);
output = zeros(rows,2);

for i = 1:rows
    
    tmp = ceil((distances(1,i)/R)*T);
    if tmp == 0
        output(i,1) = 1;
    else
        output(i,1) = tmp;
    end
    
    
    y = boundaries(i, 1, 1) - xc;%x - xc  use x because it represent rows
    x = boundaries(i, 2, 1) - yc;%y - yc  use y because it represent cols
    cita = atan2d(y,x);
    
    if cita < 0
        cita = cita + 360;
    end
    
    tmp = ceil((cita/360)*S);
    if tmp == 0
        output(i,2) = 1;
    else
        output(i,2) = tmp;
    end
    
    
end


end


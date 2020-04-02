function [finalVector] = fillVectors(directions, Tracks_Sectors, nTracks, nSectors)

%Tracks_Sectors size = n, 2
%directions size = 1, n

finalVector = zeros(nTracks*nSectors, 8);
tmpVector = zeros(nSectors, 8, nTracks);
%E W N S NE SE SW NW

[rows,~] = size(Tracks_Sectors);

for i = 1:rows
    tmpdir = cell2mat(directions(1,i));
    tmpTrack = Tracks_Sectors(i,1);
    tmpSector = Tracks_Sectors(i,2);
    
    if strcmp(tmpdir, 'E') == 1
        tmpVector(tmpSector, 1, tmpTrack) = tmpVector(tmpSector, 1, tmpTrack) +1;
    elseif strcmp(tmpdir, 'W') == 1
        tmpVector(tmpSector, 2, tmpTrack) = tmpVector(tmpSector, 2, tmpTrack) +1;
    elseif strcmp(tmpdir, 'N') == 1
        tmpVector(tmpSector, 3, tmpTrack) = tmpVector(tmpSector, 3, tmpTrack) +1;
    elseif strcmp(tmpdir, 'S') == 1
        tmpVector(tmpSector, 4, tmpTrack) = tmpVector(tmpSector, 4, tmpTrack) +1;
    elseif strcmp(tmpdir, 'NE') == 1
        tmpVector(tmpSector, 5, tmpTrack) = tmpVector(tmpSector, 5, tmpTrack) +1;
    elseif strcmp(tmpdir, 'SE') == 1
        tmpVector(tmpSector, 6, tmpTrack) = tmpVector(tmpSector, 6, tmpTrack) +1;
    elseif strcmp(tmpdir, 'SW') == 1
        tmpVector(tmpSector, 7, tmpTrack) = tmpVector(tmpSector, 7, tmpTrack) +1;
    elseif strcmp(tmpdir, 'NW') == 1
        tmpVector(tmpSector, 8, tmpTrack) = tmpVector(tmpSector, 8, tmpTrack) +1;
    end
    
    
end

counterT = 1;
counterS = 1;
check = 0;

finalVector(1,:) = tmpVector(counterS, :, counterT);

for i = 2:nTracks*nSectors
    
    
    
    if (i/nSectors) ~= floor(i/nSectors) %i != 6 12 18 24
        counterT = floor(i/nSectors) + 1;
    end
    
    if mod(i,nSectors) == 0
        counterS = 6;
        check = 1;
    else
        if check == 1
            counterS = 1;
            check = 0;
        else
            counterS = mod(i,nSectors);
        end
    end
  
    finalVector(i,:) = tmpVector(counterS, :, counterT);
    
end



end


function [output] = train(nTracks,nSectors)

path = 'F:\college\third year\second term\Pattern recognition\Assignments\Data Set (0-9)-2';

output = zeros(nTracks*nSectors, 8,100);
counter = 1;
for i = 0:9
    for j = 1:10
        img = imread(strcat(path,'\',int2str(i),'_',int2str(j),'.bmp'));
        img = ~img;
        img =  crop(img);
        [row,column] = size(img);
        xc = row/2;
        yc = column/2;
        [xs,ys] = getStartingPoint(img);
        dir = getStartingDir(xs,ys,img);
        boundaries = bwtraceboundary(img,[xs ys],dir);
        
        distances = getdistances(boundaries,xc,yc);
        distances(:,end) = [];
        [R,~] = getMax_Min(distances);
        directions = getDirections(boundaries);
        
        Tracks_Sectors = getTracksAndSectors(boundaries, distances, R, nTracks, nSectors, xc, yc);
        
        tmpvector = fillVectors(directions, Tracks_Sectors, nTracks, nSectors);
        
        output(:,:,counter) = tmpvector;
        counter = counter + 1;
        
    end
end


end


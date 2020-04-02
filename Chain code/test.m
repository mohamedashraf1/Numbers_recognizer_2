function [num] = test(path, trainingData, nTracks, nSectors)

img = imread(path);

if ~islogical(img)
    img = im2bw(img,0.5);
end
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

vector = fillVectors(directions, Tracks_Sectors, nTracks, nSectors);

[d1, d2, d3] = size(trainingData);%d1 = 24 , d2 = 8 , d3 = 100
differences = zeros(1,d3);
sum = 0;
for i = 1:d3
    for j = 1:d1
        for k = 1:d2
            sum = sum + (trainingData(j,k,i) - vector(j,k)).^2;
        end
    end
    differences(i) = sqrt(sum);
    sum = 0;
end

[~,minIndex] = getMax_Min(differences);

num = floor(minIndex/10);
end


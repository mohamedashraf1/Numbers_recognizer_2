function [newimg] = crop(img)

[rows, columns] = find(img);
topRow = min(rows);
bottomRow = max(rows);
leftColumn = min(columns);
rightColumn = max(columns);
newimg = img(topRow:bottomRow, leftColumn:rightColumn);

[row ,column] = size(newimg);

row = ceil(row/10)*10;
column = ceil(column/10)*10;
newimg = imresize(newimg, [row column]);


end


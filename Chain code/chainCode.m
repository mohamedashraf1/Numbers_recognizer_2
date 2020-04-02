clc;
nTracks = 4;
nSectors = 6;

path = 'F:\college\third year\second term\Pattern recognition\Assignments\Data Set (0-9)-2\4_9.bmp';
path2 = 'F:\college\third year\second term\Pattern recognition\Assignments\test\';
path3 = 'C:\Users\Mohamed Ashraf\Desktop\2.png';



try
    load db;
    output = db;
catch
    output = train(nTracks,nSectors);
    db = output;
    save db.mat db
end

for i = 0:9
    num = test(strcat(path2,int2str(i),'.jpg'),output, nTracks, nSectors);
    disp(num);
end

%{
num = test(path,db, nTracks, nSectors);
disp(num);
%}
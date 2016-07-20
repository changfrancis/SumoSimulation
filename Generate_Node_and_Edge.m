%% Generate Node for simulation
%clear;
%clc;

%Setting
num_of_lanes = 3;
spacing_gap = 50;

%%Write Node
fileID = fopen('basicnode.nod.xml','w');
fprintf(fileID,'<?xml version="1.0" encoding="UTF-8"?>\n');
fprintf(fileID,'<nodes>\n');
for x=1:grid_size+1
    for y=1:grid_size+1
        %XXXYYYtoXXXYYY Coordinate system
        fprintf(fileID,'\t<node id="%03d%03d" x="%0.1f" y="%0.1f" />\n',x,y,(x*spacing_gap)+10,(y*spacing_gap)+10);
    end
end
fprintf(fileID,'</nodes>');
fclose(fileID);

%%Write Edge
fileID = fopen('basicnode.edg.xml','w');
fprintf(fileID,'<?xml version="1.0" encoding="UTF-8"?>\n');
fprintf(fileID,'<edges>\n');
for x=1:grid_size+1 %x grid need + 1, upwards
    for y=1:grid_size
        %XXXYYYtoXXXYYY Coordinate system
        fprintf(fileID,'\t<edge id="%03d%03dto%03d%03d" from="%03d%03d" to="%03d%03d" numLanes="%d" />\n',x,y,x,y+1,x,y,x,y+1,num_of_lanes);
        fprintf(fileID,'\t<edge id="%03d%03dto%03d%03d" from="%03d%03d" to="%03d%03d" numLanes="%d" />\n',x,y+1,x,y,x,y+1,x,y,num_of_lanes);
    end
end
for x=1:grid_size
    for y=1:grid_size+1 %y grid need + 1
        fprintf(fileID,'\t<edge id="%03d%03dto%03d%03d" from="%03d%03d" to="%03d%03d" numLanes="%d" />\n',x,y,x+1,y,x,y,x+1,y,num_of_lanes);
        fprintf(fileID,'\t<edge id="%03d%03dto%03d%03d" from="%03d%03d" to="%03d%03d" numLanes="%d" />\n',x+1,y,x,y,x+1,y,x,y,num_of_lanes);
    end
end
% fprintf(fileID,'\t<edge from="1" id="1to2" to="2" numLanes="3" />\n');
fprintf(fileID,'</edges>');
fclose(fileID);
display('Generate Node and Edge - Done')
clear fileID x y num_of_lanes spacing_gap; %clear variables


%% Generate Node for simulation
clear;
clc;
fileID = fopen('basicnode.nod.xml','w');
fprintf(fileID,'<?xml version="1.0" encoding="UTF-8"?>\n');
fprintf(fileID,'<nodes>\n');
grid_size = 10; %size
num_of_lanes = 3;
nodeID = 1;
spacing_gap = 50;

%%Write Node
for x=0:grid_size
    for y=0:grid_size
        fprintf(fileID,'\t<node id="%d" x="%0.1f" y="%0.1f" />\n',nodeID,(x*spacing_gap)+10,(y*spacing_gap)+10);
        nodeID = nodeID + 1;
    end
end
fprintf(fileID,'</nodes>');
fclose(fileID);

%%Write Edge
fileID = fopen('basicnode.edg.xml','w');
fprintf(fileID,'<?xml version="1.0" encoding="UTF-8"?>\n');
fprintf(fileID,'<edges>\n');
offset = 0;
for j=1:grid_size+1
    for i=1:grid_size
        node = offset+i;
        fprintf(fileID,'\t<edge id="%dto%d" from="%d" to="%d" numLanes="%d" />\n',node,node+1,node,node+1,num_of_lanes);
        fprintf(fileID,'\t<edge id="%dto%d" from="%d" to="%d" numLanes="%d" />\n',node+1,node,node+1,node,num_of_lanes);
    end
    offset = offset + (grid_size+1);
end
offset = 0;
for i=1:grid_size
    for j=1:grid_size+1
        index = grid_size + 1;
        node = offset+j;
        fprintf(fileID,'\t<edge id="%dto%d" from="%d" to="%d" numLanes="%d" />\n',node,node+index,node,node+index,num_of_lanes);
        fprintf(fileID,'\t<edge id="%dto%d" from="%d" to="%d" numLanes="%d" />\n',node+index,node,node+index,node,num_of_lanes);
    end
    offset = offset + (grid_size+1);
end
% fprintf(fileID,'\t<edge from="1" id="1to2" to="2" numLanes="3" />\n');
fprintf(fileID,'</edges>');
fclose(fileID);
display('Matlab Done')

display('Run Netconvert')
system('netconvert --node-files=basicnode.nod.xml --edge-files=basicnode.edg.xml --output-file=basicnode.net.xml');
display('Run Sumo')
system('sumo-gui -c runSimulation.sumocfg --full-output fulloutput.xml'); 
%system('sumo -c runSimulation.sumocfg --full-output fulloutput.xml'); 
clear;
clc;
fileID = fopen('basicnode.rou.xml','w');
fprintf(fileID,'<?xml version="1.0" encoding="UTF-8"?>\n');
fprintf(fileID,'<routes>\n');
grid_size = 10; %size
num_of_lanes = 3;
nodeID = 1;
spacing_gap = 50;


fprintf(fileID,'</routes>');
fclose(fileID);
display('Matlab Done')
% <routes>
%     <vType accel="1.0" decel="5.0" id="Car" length="2.0" maxSpeed="100.0" sigma="0.0" guiShape="bicycle"/>
%     <route id="route0" edges="1to2 2to13 13to14 14to15"/>
%     <vehicle depart="1" id="veh0" route="route0" type="Car" color="1,0,0" personNumber="2" personCapacity="1"/>
%     <vehicle depart="1" id="veh1" route="route0" type="Car" color="0,1,0" />
%     <vehicle depart="1" id="veh2" route="route0" type="Car" color="0,0,1" />
% </routes>

% <routes>
%    <vType id="type1" accel="0.8" decel="4.5" sigma="0.5" length="5" maxSpeed="70"/>
%    <vehicle id="0" type="type1" depart="0" color="1,0,0">
%       <route edges="beg middle end rend"/>
%    </vehicle>
% </routes>
clear;
clc;
fileID = fopen('basicnode.rou.xml','w');
fprintf(fileID,'<?xml version="1.0" encoding="UTF-8"?>');
fprintf(fileID,'<routes>\n');
grid_size = 10; %size
num_of_lanes = 3;
nodeID = 1;
spacing_gap = 50;


fprintf(fileID,'</routes>');
fclose(fileID);
display('Matlab Done')
% <routes>
%     <vType accel="1.0" decel="5.0" id="Car" length="2.0" maxSpeed="100.0" sigma="0.0" />
%     <route id="route0" edges="1to2 2to13 13to14 14to15"/>
%     <vehicle depart="1" id="veh0" route="route0" type="Car" />
% </routes>

% <routes>
%    <vType id="type1" accel="0.8" decel="4.5" sigma="0.5" length="5" maxSpeed="70"/>
%    <vehicle id="0" type="type1" depart="0" color="1,0,0">
%       <route edges="beg middle end rend"/>
%    </vehicle>
% </routes>
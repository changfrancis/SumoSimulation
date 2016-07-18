clear;
clc;
fileID = fopen('GUIPassegerRequest.poly.xml','w');
fprintf(fileID,'<?xml version="1.0" encoding="UTF-8"?>');
fprintf(fileID,'<additional xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="http://sumo.dlr.de/xsd/additional_file.xsd">\n');
fprintf(fileID,'<poi id="test2ingid" type="testing" color="255,0,0" layer="10.0" x="0.0" y="0.0"/>');
fprintf(fileID,'</additional>');
fclose(fileID);
display('Done')
% <routes>
%     <vType accel="1.0" decel="5.0" id="Car" length="2.0" maxSpeed="100.0" sigma="0.0" />
%     <route id="route0" edges="1to2 2to13 13to14 14to15"/>
%     <vehicle depart="1" id="veh0" route="route0" type="Car" />
% </routes>
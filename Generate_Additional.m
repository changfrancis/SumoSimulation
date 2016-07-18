clear;
clc;
fileID = fopen('AdditionalFile.add.xml','w');
fprintf(fileID,'<?xml version="1.0" encoding="UTF-8"?>\n');
fprintf(fileID,'<additional xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="http://sumo.dlr.de/xsd/additional_file.xsd">\n');
fprintf(fileID,'\t<poi id="test2ingid" type="testing" color="255,0,0" layer="10.0" x="0.0" y="0.0"/>\n');
fprintf(fileID,'\t<vTypeProbe id="probe1" type="Car" freq="1" file="outputprobe.xml"/>\n');
fprintf(fileID,'</additional>');
fclose(fileID);
display('Done')
% <?xml version="1.0" encoding="UTF-8"?>
% <additional xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="http://sumo.dlr.de/xsd/additional_file.xsd">
% 	<poi id="test2ingid" type="testing" color="255,0,0" layer="10.0" x="0.0" y="0.0"/>
% 	<vTypeProbe id="probe1" type="Car" freq="1" file="outputprobe.xml"/>
%     <busStop id="busstop1" lane="2to1_0" startPos="0" endPos="20" lines="100 101 102"/>
%     <busStop id="busstop2" lane="3to2_0" startPos="0" endPos="20" lines="100 101 102"/>
%     <busStop id="busstop3" lane="1to2_0" startPos="0" endPos="20" lines="100 101 102"/>
% </additional>
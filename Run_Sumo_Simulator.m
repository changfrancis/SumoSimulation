%cd C:\Program Files (x86)\DLR\Sumo\bin
%Make sure files are in the sumo directory, copy and paste
%netconvert --node-files=basicnode.nod.xml --edge-files=basicnode.edg.xml --output-file=basicnode.net.xml
%You will get "basicnode.net.xml" 
%ensure the routing and setting files in the same directory and run simulation
%sumo-gui -c runSimulation.sumocfg --full-output fulloutput.xml
%sumo -c runSimulation.sumocfg --full-output fulloutput.xml

%% Start running simulation
display('Run Netconvert')
system('netconvert --node-files=basicnode.nod.xml --edge-files=basicnode.edg.xml --output-file=basicnode.net.xml');
display('Run Sumo')
system('sumo-gui -c runSimulation.sumocfg --full-output fulloutput.xml'); %GUI version
%system('sumo -c runSimulation.sumocfg --full-output fulloutput.xml'); %Console version
%clear; %clear variable
clc;
disp('Program Start');
disp('--------------');
%load run_step_data.mat;
%save run_step_data.mat;

% Global Variable and Daily Index
%Setup test running parameters
grid_size = 10; %size

day_time_index = 001; %current index of run
taxi_population_size = 100; %number of taxi in the list
passenger_request_size = 30000;
% whentoend = 1440; %num of time step before program stops simulation
% last_passenger_request_read_index = 1; %index to manage new request input
% day_of_simulation = 1; %1 = monday, 2 = tuesday ...
% current_solution = [];
% display_taxi_num = 1; %taxi id = 1, for print screen
% toSave = true; %to save the file or picture
% toDisplay = true; %to display the graph and plot
% archive_for_review = struct([]);

%% Generate content for simulation
generateNewdataSet = true; %false; %true;
if(generateNewdataSet)
    %Generate Sumo Node and Edge, Matlab Nodes and Traffic
    Generate_Node_and_Edge;
    Generate_Matlab_Node_and_Traffic;
    
    %Generate the taxi resources
    Generate_Taxi_Resource;
    
    %Generate the Passenger request
    Generate_Passenger_Request;
end

%% Start running simulation
% display('Run Netconvert')
% system('netconvert --node-files=basicnode.nod.xml --edge-files=basicnode.edg.xml --output-file=basicnode.net.xml');
% display('Run Sumo')
% system('sumo-gui -c runSimulation.sumocfg --full-output fulloutput.xml'); %GUI version
%system('sumo -c runSimulation.sumocfg --full-output fulloutput.xml'); %Console version

%% Manual Method
%cd C:\Program Files (x86)\DLR\Sumo\bin
%Make sure files are in the sumo directory, copy and paste
%netconvert --node-files=basicnode.nod.xml --edge-files=basicnode.edg.xml --output-file=basicnode.net.xml
%You will get "basicnode.net.xml" 
%ensure the routing and setting files in the same directory and run simulation
%sumo-gui -c runSimulation.sumocfg --full-output fulloutput.xml
%sumo -c runSimulation.sumocfg --full-output fulloutput.xml
%% This Code create a bi-directional square map for simulation.
%clear all;
%clc;

display('Step 1: Create a bi-directional square map for simulation');

% Setup the map profile
n = grid_size; %n = set map size
A = delsq(numgrid('S',n+2)); %Create a square n x n graph matrix

% Set the label for Row and Column
nodeLabels = {};
for i=1:1:(n) %Column
    for j=1:1:(n) %Row
        testrow = strcat(num2str(j),','); %x-axis
        testcolumn= num2str(i); %y-axis
        nodeLabels{end+1} = strcat(testrow,testcolumn); %label row then column
    end
end
clear testrow testcolumn;  

G = graph(A,nodeLabels,'OmitSelfLoops'); %create the graph node and edge

% Create coordinate system
coordx = [];
coordy = [];
for i=1:1:(n) %Create coordinate system
    for j=1:1:(n)
        coordx(end+1) = double(j); % Column
        coordy(end+1) = double(i); % Row
    end
end  

% Random the edge value for path finding
%multipler = traffic_condition_table(day_time_index,1); % (x,y) x is day index and y is monday
for i=1:1:size(G.Edges.Weight,1) %for all edges between nodes
    G.Edges.Weight(i) = randi([1 5]); %testing to delete, make it small
    %G.Edges.Weight(i) = randi([1 10]) + randi([0 10]); %with multipler to emulate traffic condition
    G.Edges.Weight(i) = max(1,G.Edges.Weight(i)); %with multipler to emulate traffic condition
end
clear n A j i multipler;
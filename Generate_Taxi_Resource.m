%% This Code generate the taxi resources.
%clear all;
%clc;
 
display('Step 2: Generate taxi resources');
%taxi_population_size = 100;

% Setup number of resources
taxi = [];
% id 
% seat_capacity 
% internet_service
% trunk space
% gps - current location of taxi
% start - location
% destination - location
% Assigned waypoint
% Total_weight - total score required to complete the route
% individual_weight - cumulative score to destination
% Online - is taxi available for hire
for i=1:1:taxi_population_size
    taxi(i).id = i; %id
    taxi(i).seat_capacity = randi([4 7]); %seat capacity
    taxi(i).internet_service = randi([0 1]); %internet service
    taxi(i).trunk_space = randi([0 4]); % trunk space
    taxi(i).online = randi([0 1]); %Online - is taxi available for hire 1; %Always online; 
    taxi(i).gps = nodeLabels(randi([1 size(nodeLabels,2)])); %current location of taxi
    taxi(i).start = taxi(i).gps; %start location 
    taxi(i).destination = nodeLabels(randi([1 size(nodeLabels,2)])); %end location
    while(strcmp(taxi(i).start,taxi(i).destination)) %check for same start/end and reject them
        taxi(i).start = nodeLabels(randi([1 size(nodeLabels,2)])); %rand again
        taxi(i).destination = nodeLabels(randi([1 size(nodeLabels,2)])); %rand again
        %display('repeat start and destination');
    end
    [pathShortFound, weightCost]  = shortestpath(G,taxi(i).start,taxi(i).destination,'Method','positive'); %postive = Dijkstra algorithm that requires all edge weights to be positive
    taxi(i).assigned_route = pathShortFound; %Assigned waypoint
    taxi(i).total_weight = weightCost;
    taxi(i).individual_weight = [];
    
%     sum = day_time_index; %starting time index
%     for j=1:1:(size(pathShortFound,2)-1)
%         sum = sum + G.Edges.Weight(findedge(G,pathShortFound(j),pathShortFound(j+1)));
%         taxi(i).individual_weight(end+1) = sum;
%     end
%     taxi(i).next_day_time_update = taxi(i).individual_weight(1); %know the next time index to get update
    
    % assign all other values to default
    taxi(i).pass_assigned = []; %list of passenger assigned
    taxi(i).seat_assigned = 0; %seat assigned
    taxi(i).trunk_assigned = 0; %trunk assigned
    taxi(i).internet_assigned = 0; %internet assigned
    taxi(i).waited_at_node = 1; %for moving taxi in map
    taxi(i).pickup_dropoff = {}; %pick up and drop off location for assigned passengers
    taxi(i).pass_history = []; %list of passengers that had been drop-off
end
clear i j taxi_population_size pathShortFound weightCost sum;

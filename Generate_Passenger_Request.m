%% This Code generate the passenger request.
%clear all;
%clc;

display('Step 3: Generate passenger request');
%passenger_request_size = 10000;

% Setup number of resources
passenger = [];
% id 
% seat required
% internet required
% trunk space
% pick up location 
% drop off location
for i=1:1:passenger_request_size
    passenger(i).id = i; %id
    passenger(i).seat_required = randi([1 4]); %seat required
    
    temp = rand();
    if(temp > 0.5) %set this value to the uniform distribution
        passenger(i).internet_required = 1; %internet required
    else
        passenger(i).internet_required = 0; %internet required
    end
    
    temp = rand();
    if(temp > 0.5) %set this value to the uniform distribution
        passenger(i).trunk_required = int64(rand()*2); %internet required
    else
        passenger(i).trunk_required = 0; %internet required
    end
    
    passenger(i).start = nodeLabels(randi([1 size(nodeLabels,2)])); %pick up location 
    passenger(i).destination = nodeLabels(randi([1 size(nodeLabels,2)])); %drop off location
    while(strcmp(passenger(i).start,passenger(i).destination)) %check for same start/end and reject them
        passenger(i).start = nodeLabels(randi([1 size(nodeLabels,2)])); %rand again
        passenger(i).destination = nodeLabels(randi([1 size(nodeLabels,2)])); %rand again
        %display('repeat start and destination');
    end
    passenger(i).activated_req_dayindex = 0; %dayindex in which passenger activate their request for taxi
    passenger(i).pickup_dayindex = 0; %dayindex in which passenger is pickup
    passenger(i).dropoff_dayindex = 0; %dayindex in which passenger is dropoff
    passenger(i).ideal_travel_time = 0; %calculate minimum travelling time required based on initial booking
    passenger(i).actual_travel_time = 0; %actual total travelling time
    
end
clear i passenger_request_size temp;

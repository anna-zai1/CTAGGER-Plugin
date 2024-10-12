function eventStruct = convert_bst_events_to_ctagger(events)
    % Convert Brainstorm events into a structure compatible with CTAGGER
    
    for i = 1:length(events)
        eventStruct(i).eventType = events(i).label;  
        eventStruct(i).times = events(i).times;  
    end
end

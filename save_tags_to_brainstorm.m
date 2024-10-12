function save_tags_to_brainstorm(selectedTags, sMat)
    % This function saves the selected HED tags to the Brainstorm structure (sMat).
    % Inputs:
    %    - selectedTags: The HED tags selected by the user (output of CTAGGER)
    %    - sMat: The Brainstorm structure to which the tags will be added

    % Check if the sMat structure has an 'Events' field, if not, create it
    if ~isfield(sMat, 'Events')
        sMat.Events = struct();
    end
    
    % Assuming selectedTags is a structure or a cell array of tag strings
    % Loop over the selected tags and add them to the sMat.Events structure
    for iTag = 1:length(selectedTags)
        tag = selectedTags{iTag}; % Extract each tag

        % Create an event structure for each tag
        eventName = ['HED_' tag];

        % If the event doesn't exist in sMat.Events, create it
        if ~isfield(sMat.Events, eventName)
            sMat.Events.(eventName) = struct();
            sMat.Events.(eventName).label = tag;
            sMat.Events.(eventName).times = []; 
            sMat.Events.(eventName).epochs = []; 
        end

    end

    % Save or update the modified sMat structure in Brainstorm
    brainstorm('save', sMat.FileName, sMat);  
    disp('Selected HED tags saved to Brainstorm data structure');
end

function events = AddHEDTagsToEvents(events, hedTags)
    if ~isfield(events, 'hedTags')
        [events.hedTags] = deal({});
    end
    for i = 1:numel(events)
        events(i).hedTags = hedTags{i};
    end
end


function OpenCTAGGER(events)
    % Open CTAGGER GUI for HED tag selection and validation
    try
        % Assuming CTAGGER has a command-line interface for MATLAB
        hedTags = runCTAGGERGUI(events);
        % Update the event structure with selected tags
        events = AddHEDTagsToEvents(events, hedTags);
    catch ME
        disp(['Error opening CTAGGER GUI: ' ME.message]);
    end
end

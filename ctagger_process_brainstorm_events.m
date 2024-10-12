function ctagger_process_brainstorm_events()
    if ~brainstorm('status')
        error('Brainstorm is not running.');
    end
    
    % Get the active protocol
    protocol = bst_get('ProtocolInfo');
    
    % Load events from the current dataset
    sFiles = bst_process('CallProcess', 'process_select_files_data', [], [], ...
                         'subjectname', 'All', 'includeintra', 1);
    
    % Check if there are any files loaded
    if isempty(sFiles)
        error('No event files found in the current protocol.');
    end
    
    %rocess the first file
    sMat = in_bst_data(sFiles(1).FileName);
    
    % Extract events from the loaded file
    events = sMat.F.events;
    
    % Prepare event data for CTAGGER
    eventStruct = convert_bst_events_to_ctagger(events);
    
    % Call CTAGGER using Java
    selectedTags = ctagger_wrapper(eventStruct);
    
    % Display the selected tags from CTAGGER (or integrate them back into Brainstorm)
    disp('Selected HED Tags:');
    disp(selectedTags);
    
    save_tags_to_brainstorm(selectedTags, sMat);
end

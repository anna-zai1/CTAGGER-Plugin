function sProcess = process_ctagger_tag_events()
    % DESCRIPTION: Brainstorm process to use CTAGGER for tagging events.

    % ===== PROCESS DESCRIPTION =====
    sProcess.Comment     = 'Tag events using CTAGGER';
    sProcess.FileTag     = '';
    sProcess.Category    = 'Custom';
    sProcess.SubGroup    = 'Tagging';
    sProcess.Index       = 450;

    % ===== INPUT & OUTPUT =====
    sProcess.InputTypes  = {'data', 'raw'};
    sProcess.OutputTypes = {'data', 'raw'};
    sProcess.nInputs     = 1;
    sProcess.nMinFiles   = 1;

    % ===== PROCESS OPTIONS =====
    sProcess.options.eventType.Comment = 'Select event type to tag:';
    sProcess.options.eventType.Type    = 'text';
    sProcess.options.eventType.Value   = 'stimulus';
end

% ===== RUN =====
function OutputFiles = Run(sProcess, sInputs)
    % Check for CTAGGER plugin installation
    ctagger_plugin_install();

    % Get the event structure from Brainstorm
    eventStruct = brainstorm_get_event_struct(sInputs);

    % Call the CTAGGER wrapper to open the GUI and return the selected tags
    selectedTags = ctagger_wrapper(eventStruct);

    % Save the selected tags back to Brainstorm
    save_tags_to_brainstorm(selectedTags, sInputs);
    
    % Return the input files as output
    OutputFiles = {sInputs.FileName};
end

function brainstorm_plugin
    % Main entry point for the CTAGGER plugin
    disp('CTAGGER Plugin for Brainstorm initialized.');
    
    % Add paths for the plugin (assuming the structure has a 'ctagger' folder with relevant files)
    addpath(genpath(fullfile(fileparts(mfilename('fullpath')), 'ctagger')));

    % Call the main function for processing event data with CTAGGER
    ctagger_process_brainstorm_events();
end

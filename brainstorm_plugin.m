function ctagger_plugin_install()
    % Path to the CTAGGER folder
    pluginPath = '/path/to/CTAGGER';

    % Check if CTAGGER is already in the path
    if ~exist(pluginPath, 'dir')
        error('CTAGGER Plugin folder does not exist: %s', pluginPath);
    end

    % Add the CTAGGER jar file to Java classpath
    javaaddpath(fullfile(pluginPath, 'CTAGGER.jar'));

    % Add the CTAGGER folder to MATLAB path
    addpath(pluginPath);

    % Display success message
    disp('CTAGGER plugin successfully installed!');
end

function ctagger_plugin_install()
    pluginPath = 'CTAGGER';

    if ~exist(pluginPath, 'dir')
        error('CTAGGER Plugin folder does not exist: %s', pluginPath);
    end

    javaaddpath(fullfile(pluginPath, 'CTAGGER.jar'));

    addpath(pluginPath);

    disp('CTAGGER plugin successfully installed!');
end

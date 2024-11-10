function InitializeCTAGGERPlugin
    ctaggerPath = 'CTagger.jar';
    if ~contains(path, ctaggerPath)
        addpath(genpath(ctaggerPath));
    end
end

function RemoveCTAGGERPlugin
    rmpath(genpath('CTagger.jar'));
end

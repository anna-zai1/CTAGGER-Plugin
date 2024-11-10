function InitializeCTAGGERPlugin
    ctaggerPath = 'CTagger.kt';
    if ~contains(path, ctaggerPath)
        addpath(genpath(ctaggerPath));
    end
end

function RemoveCTAGGERPlugin
    rmpath(genpath('CTagger.kt'));
end

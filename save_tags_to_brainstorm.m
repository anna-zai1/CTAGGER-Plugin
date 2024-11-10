function LaunchCTAGGERWithExport(inputEvents, outputPath)
    jsonInputFile = 'temp_events.json';
    jsonText = jsonencode(inputEvents); 
    fid = fopen(jsonInputFile, 'w');
    fwrite(fid, jsonText);
    fclose(fid);

    command = sprintf('java -jar CTagger.jar %s %s', jsonInputFile, outputPath);
    system(command);
end

function events = UpdateEventsWithHEDTags(events, outputPath)
    fid = fopen(outputPath, 'r');
    rawJson = fread(fid, inf, 'uint8=>char')';
    fclose(fid);
    
    hedTagsData = jsondecode(rawJson);
    
    for i = 1:numel(events)
        eventName = events(i).label;
        if isfield(hedTagsData, eventName)
            events(i).hedTags = hedTagsData.(eventName);
        else
            events(i).hedTags = {};
        end
    end
end

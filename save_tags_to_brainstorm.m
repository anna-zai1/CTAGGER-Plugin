function events = AddHEDTagsToEvents(events, hedTags)
    if ~isfield(events, 'hedTags')
        [events.hedTags] = deal({});
    end
    for i = 1:numel(events)
        events(i).hedTags = hedTags{i};
    end
end

function save_tags_to_brainstorm(selectedTags, sMat)
    % Check if hedTags field exists, if not, initialize it
    if ~isfield(sMat, 'hedTags')
        sMat.hedTags = cell(size(sMat.events)); % Initialize with empty cells
    end
    
    for i = 1:length(sMat.events)
        sMat.hedTags{i} = selectedTags{i};
    end
    
    % Save sMat back to Brainstorm format
    bst_save(sMat);
end


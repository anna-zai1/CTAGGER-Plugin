function ctagger_wrapper(eventStruct, sMat)
    javaaddpath('CTagger.jar');  
    
    import CTagger;
    
    ctagger = javaObject('CTagger', false, false, '', '', true);
    
    if ismethod(ctagger, 'loadEventData')
        ctagger.loadEventData(eventStruct);  
    else
        warning('loadEventData method does not exist in CTagger.');
    end
    
    selectedTags = {}; 
    
    if ~isempty(selectedTags)
        save_tags_to_brainstorm(selectedTags, sMat);
    else
        disp('No tags were selected or returned.');
    end
end

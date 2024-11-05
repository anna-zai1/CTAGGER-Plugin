function selectedTags = ctagger_wrapper(eventStruct)
    javaaddpath('CTagger.jar'); 
    
    import CTagger;       
    
    ctagger = javaObject('CTagger', false, false, '', '', true);
    ctagger.loadEventData(eventStruct);
    
    ctagger.displayGUI();
    
    selectedTags = ctagger.getSelectedTags();
end


function save_tags_to_brainstorm(selectedTags, sMat)
    DataMat = in_bst_data(sMat.FileName);
    
    for i = 1:length(selectedTags)
        DataMat.Events(i).label = selectedTags{i};
    end

    bst_save(sMat.FileName, DataMat, 'v6');
end

function eventStruct = brainstorm_get_event_struct(sInputs)
    DataMat = in_bst_data(sInputs.FileName);

    events = DataMat.F.events;
    
    for i = 1:length(events)
        eventStruct(i).eventType = events(i).label;
        eventStruct(i).times = events(i).times;
    end
end

function mymenu = AddCtaggerMenu()
    mymenu = uimenu(gui_brainstorm('figure'), 'Label', 'CTAGGER Plugin');
    
    uimenu(mymenu, 'Label', 'Tag Events', 'Callback', @RunCtaggerProcess);
end

function RunCtaggerProcess(hObject, eventdata)
    % Run the CTAGGER Brainstorm process
    process_ctagger_tag_events();
end

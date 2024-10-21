function selectedTags = ctagger_wrapper(eventStruct)
    javaaddpath('CTAGGER/CTAGGER.jar'); 
    
    import CTagger;       
    import HedValidator;   
    
    % Initialize the CTAGGER GUI with event data
    ctagger = javaObject('CTagger', false, false, '', '', true);
    
    ctagger.loadEventData(eventStruct);
    
    ctagger.displayGUI();
    
    selectedTags = ctagger.getSelectedTags(); 
end

function save_tags_to_brainstorm(selectedTags, sMat)
    DataMat = in_bst_data(sMat.FileName);
    
    % Add the selected tags to the event structure in the DataMat
    for i = 1:length(selectedTags)
        DataMat.Events(i).label = selectedTags{i};
    end

    bst_save(sMat.FileName, DataMat, 'v6');
end

function eventStruct = brainstorm_get_event_struct(sInputs)
    DataMat = in_bst_data(sInputs.FileName);

    % Get the event structure from the data
    events = DataMat.F.events;
    
    % Create a structure compatible with CTAGGER
    for i = 1:length(events)
        eventStruct(i).eventType = events(i).label;
        eventStruct(i).times = events(i).times;
    end
end

% This function will be called when the user selects the CTAGGER process
function mymenu = AddCtaggerMenu()
    % Create a new menu in the Brainstorm GUI
    mymenu = uimenu(gui_brainstorm('figure'), 'Label', 'CTAGGER Plugin');
    
    % Add a submenu to the CTAGGER menu
    uimenu(mymenu, 'Label', 'Tag Events', 'Callback', @RunCtaggerProcess);
end

% Callback function for running the CTAGGER process
function RunCtaggerProcess(hObject, eventdata)
    % Run the CTAGGER Brainstorm process
    process_ctagger_tag_events();
end

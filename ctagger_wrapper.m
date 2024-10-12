function selectedTags = ctagger_wrapper(eventStruct)
    % Load the CTAGGER Java package or JAR file
    javaaddpath('CTagger/CTagger.jar'); 
    
    import CTagger;      
    
    % Initialize the CTAGGER GUI with event data
    % Instantiate the CTagger class and pass the event data
    ctagger = javaObject('CTagger', false, false, '', '', true);
    
    % Pass the eventStruct for annotation
    ctagger.loadEventData(eventStruct);
    
    % Open the CTAGGER GUI for user interaction
    ctagger.displayGUI();
    
    % Retrieve the selected tags from CTAGGER after GUI is closed
    selectedTags = ctagger.getSelectedTags(); 
    end

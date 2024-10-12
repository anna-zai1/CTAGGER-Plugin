function selectedTags = ctagger_wrapper(eventStruct)
    % Wrapper to open CTAGGER GUI from MATLAB and return the selected HED tags.

    % 1. Load the CTAGGER Java package or JAR file
    javaaddpath('/path/to/CTagger/CTagger.jar');  % Update this with the correct path
    
    % 2. Import the necessary Java classes
    import CTagger;         % No package needed, class is directly in the root of the JAR
    import HedValidator;    % Same for validator class
    import HEDWebService;   % Same for HEDWebService
    
    % 4. Initialize the CTAGGER GUI with event data
    % Instantiate the CTagger class and pass the event data
    ctagger = javaObject('CTagger', false, false, '', '', true);  % Use default arguments
    
    % Pass the eventStruct for annotation
    ctagger.loadEventData(eventStruct);
    
    % 5. Open the CTAGGER GUI for user interaction
    ctagger.displayGUI();
    
    % 6. Retrieve the selected tags from CTAGGER after GUI is closed
    selectedTags = ctagger.getSelectedTags();  % Get selected tags
    
    % Return the selected tags to MATLAB for further processing
end

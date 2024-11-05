function ctagger_wrapper(eventStruct)
    javaaddpath('CTagger.jar');  % Update with the correct path to CTagger.jar
    
    import CTagger;
    
    ctagger = javaObject('CTagger', false, false, '', '', true);

    if ismethod(ctagger, 'loadEventData')
        ctagger.loadEventData(eventStruct);  
    else
        warning('CTagger does not support loadEventData, data not passed.');
    end

end

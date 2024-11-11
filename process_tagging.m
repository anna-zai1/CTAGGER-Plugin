function sProcess = process_add_hed_tags()
    sProcess.Comment     = 'Add HED Tags';
    sProcess.FileTag     = '';
    sProcess.Category    = 'Custom';
    sProcess.SubGroup    = 'Event';
    sProcess.Index       = 201;  % Arbitrary index

    sProcess.InputTypes  = {'data', 'raw'};
    sProcess.OutputTypes = {'data', 'raw'};
    sProcess.nInputs     = 1;
    sProcess.nMinFiles   = 1;

    sProcess.options.description.Comment = 'Launch CTAGGER to select HED tags';
    sProcess.options.description.Type    = 'label';
end

function OutputFiles = Run(sProcess, sInputs)
    outputPath = 'selected_tags.json';

    for iFile = 1:numel(sInputs)
        DataMat = in_bst_data(sInputs(iFile).FileName);
        
        LaunchCTAGGERWithExport(DataMat.F.events, outputPath);

        DataMat.F.events = UpdateEventsWithHEDTags(DataMat.F.events, outputPath);
        
        OutputFiles{iFile} = bst_process('GetOutputFile', sProcess, sInputs(iFile).FileName);
        save(OutputFiles{iFile}, '-struct', 'DataMat');
    end
end

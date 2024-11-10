function sProcess = process_add_hed_tags()
    sProcess.Comment     = 'Add HED Tags';
    sProcess.FileTag     = '';
    sProcess.Category    = 'Custom';
    sProcess.SubGroup    = 'Event';
    sProcess.Index       = 201; % Arbitrary index

    sProcess.InputTypes  = {'data', 'raw'};
    sProcess.OutputTypes = {'data', 'raw'};
    sProcess.nInputs     = 1;
    sProcess.nMinFiles   = 1;

    sProcess.options.description.Comment = 'Launch CTAGGER GUI to add HED tags';
    sProcess.options.description.Type    = 'label';
end

function OutputFiles = Run(sProcess, sInputs)
    for iFile = 1:numel(sInputs)
        DataMat = in_bst_data(sInputs(iFile).FileName);
        DataMat.F.events = OpenCTAGGER(DataMat.F.events);
        
        OutputFiles{iFile} = bst_process('GetOutputFile', sProcess, sInputs(iFile).FileName);
        save(OutputFiles{iFile}, '-struct', 'DataMat');
    end
end

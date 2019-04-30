function txtsave(state, val, set, region, order)
    if strcmp(set,'Coverage Charge')
        sett = 'Coverage_Charge';
    elseif strcmp(set, 'Patient Payment')
        sett = 'Patient_Payment';
    else
        sett = 'Treatment';
    end
    filename = sprintf('%s_%s_%s_List.txt', region, sett, order);
    fid = fopen(filename, 'w');
    fprintf(fid, '%s List of %s in the %s region\n', order, set, region);
    fprintf(fid, 'State\t|\t%s\n', set);
    if strcmp(sett,'Treatment')
        for i = 1:length(val)
            fprintf(fid, '%s\t:\t%.0f\n', state(i,1:2), val(i));
        end
    else
        for i = 1:length(val)
            fprintf(fid, '%s\t:\t$%.2f\n', state(i,1:2), val(i));
        end
    end
    fclose('all');
end
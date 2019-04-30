function txtsave(state, val, set, region, order)
%this function serves to write the data anyalysis into a txt file
    %this if statement decides the string for what we are writing into the
    %file
    if strcmp(set,'Coverage Charge')
        sett = 'Coverage_Charge';
    elseif strcmp(set, 'Patient Payment')
        sett = 'Patient_Payment';
    else
        sett = 'Treatment';
    end
    
    %txt file work
    filename = sprintf('%s_%s_%s_List.txt', region, sett, order); %create file
    fid = fopen(filename, 'w'); %open file
    fprintf(fid, '%s List of %s in the %s region\n', order, set, region); %write the descriptiong of the data
    fprintf(fid, 'State\t|\t%s\n', set); %write the formatting of the data
   
    %print into file
    if strcmp(sett,'Treatment')
        for i = 1:length(val)
            fprintf(fid, '%s\t:\t%.0f\n', state(i,1:2), val(i));
        end
    else
        for i = 1:length(val)
            fprintf(fid, '%s\t:\t$%.2f\n', state(i,1:2), val(i));
        end
    end
    %close file
    fclose('all');
end
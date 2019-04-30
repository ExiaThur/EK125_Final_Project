function [vallist, statelist] = runmain(app)
    [~,~,raw] = xlsread('MediData.xlsx');
    data = struct;
    for i = length(raw):-1:2
        data(i-1).drg = raw{i,1};
        data(i-1).state = raw{i,6};
        data(i-1).discharge = raw{i,9};
        data(i-1).avgcovered = raw{i,10};
        data(i-1).avgtotpay = raw{i,11};
        data(i-1).avgmedpay = raw{i,12};
    end
        
    app.Label.Text = 'Sorting Data...';
    app.Lamp.Color = [1 1 0];
    drawnow
    
    datset = analysis(data,app.area);
    
    charge = zeros(1,length(datset));
    pay = charge;
    treat = charge;
    name = string(pay);
    
    for i = 1:length(datset)
        charge(i) = datset(i).avg(1);
        pay(i) = datset(i).avg(2)- datset(i).avg(3);
        treat(i) = datset(i).tcount;
        name(i) = convertCharsToStrings(datset(i).name);
    end
    
    if app.AscendingButton.Value == true
        if strcmp(app.DropDown.Value,'Coverage Charge')
            [vallist, statelist] = sortarray(charge,name); 
        elseif strcmp(app.DropDown.Value,'Patient Payment')
            [vallist, statelist] = sortarray(pay,name);
        else
            [vallist, statelist] = sortarray(treat,name);
        end
    else
        if strcmp(app.DropDown.Value,'Coverage Charge')
            [vallist, statelist] = sortarray(charge,name); 
            statelist = fliplr(statelist);
            vallist = fliplr(vallist);
        elseif strcmp(app.DropDown.Value,'Patient Payment')
            [vallist, statelist] = sortarray(pay,name);
            statelist = fliplr(statelist);
            vallist = fliplr(vallist);
        else
            [vallist, statelist] = sortarray(treat,name);
            statelist = fliplr(statelist);
            vallist = fliplr(vallist);
        end
    end
    
    if strcmp(app.area,'USA')
        statelist = statelist';
        statelist = statelist(1:20);
        statelist = char(statelist);
        vallist = vallist(1:20);
    else
        statelist = statelist';
        statelist = char(statelist);
    end
end
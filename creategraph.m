function creategraph(state, val, set, region)
    y = val;
    xtemp = 1:(length(val));
    x = cell(1,length(state));
    for i = 1:length(state)
        x{i} = state(i,1:2);
    end
    figure('Name','Data Plot', 'NumberTitle', 'off', 'WindowState', 'maximized');
	bar(y);
    bardisp = gca;
    bardisp.YAxis.Exponent = 0;
    tit = sprintf('%s %s Bar Plot', region, set);
    title(tit);
    xticks(xtemp);
	xticklabels(x);
    xlabel('State');
    ylabel('Value');
    grid on;
end
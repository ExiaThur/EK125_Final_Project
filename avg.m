function [covchar, totpay, medpay] = avg(data, area)
    covchar = 0;
    totpay = 0;
    medpay = 0;
    for i = area
        covchar = covchar + data(i).avgcovered;
        totpay = totpay + data(i).avgtotpay;
        medpay = medpay + data(i).avgmedpay;
    end
    covchar = covchar/length(area);
    totpay = totpay/length(area);
    medpay = medpay/length(area);
end
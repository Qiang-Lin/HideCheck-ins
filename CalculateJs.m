function [js] = CalculateJs(hist1, hist2)
    %calculate the js divergence
    js=1;
    KL1=0;
    KL2=0;
    hist1 = hist1/sum(hist1);%transform to the probability
    hist2 = hist2/sum(hist2);
    totalHist = (hist1+hist2)/2;
    idx = hist1>0 & hist2>0;%need to find the bin counts > 0
    KL1 = sum(hist1(idx).*log(hist1(idx)./totalHist(idx)));
    KL2 = sum(hist2(idx).*log(hist2(idx)./totalHist(idx)));
    js = KL1/2 + KL2/2;
end
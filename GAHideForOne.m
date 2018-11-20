function [bestHist,bestJs] = GAHideForOne(userHist,senIndex)
    [bestHist, bestJs]=Cga(userHist, senIndex);
        if bestJs>1
            bestJs=1;%in case not finding the solution.
            bestHist=userHist;
        end
end
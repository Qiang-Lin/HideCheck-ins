function [bestHist,bestJs] = GreedyHideForOne(userHist1,senIndex)
    tempHist = userHist1;
    bestJs=1;% initialise with the worst condition.
    bestHist = userHist1;
    tempSenIndex=senIndex;
    while ~isempty(tempSenIndex)
        %find the largest sensitive location.
        [count,idx]=max(userHist1(tempSenIndex));
        tempHist(tempSenIndex(idx))=0;
        bestJs=1;
        %move its frequency to non-sensitive location
        tryHist=tempHist;
        for i=1:length(userHist1)
            if ~ismember(i,senIndex)% non-sensitive location
                tryHist=tempHist;
                tryHist(i) = tryHist(i) + count;
                js = CalculateJs(tempHist,tryHist);
                if js < bestJs
                    bestJs  = js;
                    tempBestHist = tryHist;
                end
            end
        end
        tempHist = tempBestHist;
        tempSenIndex(idx)=[];
    end
    bestHist = tempHist;
    bestJs = CalculateJs(userHist1,bestHist);
    % bar(userHist1);
    % figure();
    % bar(bestHist);
end
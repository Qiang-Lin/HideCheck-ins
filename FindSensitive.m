function [senIndex] = FindSensitive(senInfo,DataText)
    senIndex=[];
    for i = 1:length(DataText)
        if str2num(char(DataText(i,1)))==1
            data(i,:)=DataText(i,:);
        end
    end
    a=unique(data);
    a(1)=[];
    for i = 1:length(senInfo)
        [bool,inx]=ismember(senInfo(i),a');
        if bool==1
            senIndex=[senIndex;inx];
        end
    end
end
function bestHist = ReconstrucToHist(userHist,senIndex,par) 
%reconstruct the parameters into the hist
    j=0;
    len = length(userHist);
    bestHist=zeros(1,len);
    for i=1:len
        if ~ismember(i,senIndex)
            j=j+1;
            bestHist(i)=userHist(i)+round(par(1,j));
        end
    end
end
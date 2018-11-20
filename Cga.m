% Continuous Genetic Algorithm
% Reference to Haupt & Haupt
function [bestHist, bestJs] = Cga(userHist,senIndex)
    %_______________________________________________________
    % I Setup the GA
    ff='Djs'; % objective function
    npar=length(userHist)-length(senIndex); % number of optimization variables non-sensitive
    count = sum(userHist(senIndex));
    varhi=count; varlo=0; % variable limits 
    aaa=[];
    xxmin=0;
    %_______________________________________________________
    % II Stopping criteria
    maxit=4000; % max number of iterations
    mincost=0; % minimum cost
    %_______________________________________________________
    % III GA parameters
    popsize=100; % set population size
    mutrate=0.02; % set mutation rate
    selection=0.5; % fraction of population kept
    Nt=npar; % continuous parameter GA Nt=#variables
    keep=floor(selection*popsize); % #population members that survive
    nmut=ceil((popsize-1)*Nt*mutrate); % total number of mutations
    M=ceil((popsize-keep)/2); % number of matings
    %_______________________________________________________
    % Create the initial population
    iga=0; % generation counter initialized
    par=(varhi-varlo)*rand(popsize,npar)+varlo; % random

    %cost=feval(ff,par); % calculates population cost using ff
    [rr, cc] =size(par);
    for ii=1:rr
        cost(ii) = feval(ff,par(ii,:),userHist,senIndex,count);%
    end
    [cost,ind]=sort(cost); % min cost in element 1
    par=par(ind,:); % sort continuous
    minc(1)=min(cost); % minc contains min of
    meanc(1)=mean(cost); % meanc contains mean of population
    %_______________________________________________________
    % Iterate through generations
    while iga<maxit
        iga=iga+1; % increments generation counter
        %_______________________________________________________
        % Pair and mate
        M=ceil((popsize-keep)/2); % number of matings
        prob=flipud([1:keep]'/sum([1:keep])); % weights chromosomes
        odds=[0 cumsum(prob(1:keep))']; % probability distribution function
        pick1=rand(1,M); % mate #1
        pick2=rand(1,M); % mate #2
        % ma and pa contain the indicies of the chromosomes that will mate
        ic=1;
        while ic<=M
            for id=2:keep+1
                if pick1(ic)<=odds(id) & pick1(ic)>odds(id-1)
                    ma(ic)=id-1;
                end
                if pick2(ic)<=odds(id) & pick2(ic)>odds(id-1)
                    pa(ic)=id-1;
                end
            end
            ic=ic+1;
        end
        %_______________________________________________________
        % Performs mating using single point crossover Extrapolation(blending
        ix=1:2:keep; % index of mate #1
        xp=ceil(rand(1,M)*Nt); % crossover point
        r=rand(1,M); % mixing parameter
        for ic=1:M
            xy=par(ma(ic),xp(ic))-par(pa(ic),xp(ic)); % ma and pa
            % mate
            par(keep+ix(ic),:)=par(ma(ic),:); % 1st offspring
            par(keep+ix(ic)+1,:)=par(pa(ic),:); % 2nd offspring

            par(keep+ix(ic),xp(ic))=par(ma(ic),xp(ic))-r(ic).*xy; % 1st
            par(keep+ix(ic)+1,xp(ic))=par(pa(ic),xp(ic))+r(ic).*xy;% 2nd
            for j=0:(npar-xp(ic))%method1 blending after n
                par(keep+ix(ic),xp(ic)+j)=par(ma(ic),xp(ic))-rand.*xy; % 1st
                par(keep+ix(ic)+1,xp(ic)+j)=par(pa(ic),xp(ic))+rand.*xy;% 2nd
            end

    %         if xp(ic)<npar %method2 swap
    %             par(keep+ix(ic),:)=[par(keep+ix(ic),1:xp(ic)) par(keep+ix(ic)+1,xp(ic)+1:npar)];
    %             par(keep+ix(ic)+1,:)=[par(keep+ix(ic)+1,1:xp(ic)) par(keep+ix(ic),xp(ic)+1:npar)];
    %         end % if  
        end
        %_______________________________________________________
        % Mutate the population
        mrow=sort(ceil(rand(1,nmut)*(popsize-1))+1);
        mcol=ceil(rand(1,nmut)*Nt);
        non_sen = sum(userHist)-count;
        for ii=1:nmut
            if (sum(round(par(mrow(ii),:)))~=non_sen) || (ii > maxit/40) % help the save the feasible solution
                par(mrow(ii),mcol(ii))=(varhi-varlo)*rand+varlo;
            end
        end 
        %_______________________________________________________
        % The new offspring and mutated chromosomes are evaluated
        %cost=feval(ff,par);
        [rr, cc] =size(par);
        for ii=2:rr
            cost(ii) = feval(ff,par(ii,:),userHist,senIndex,count);
        end
        %_______________________________________________________
        % Sort the costs and associated parameters
        [cost,ind]=sort(cost);
        par=par(ind,:);
        %_______________________________________________________
        % Do statistics for a single nonaveraging run
        minc(iga+1)=min(cost);
        meanc(iga+1)=mean(cost);
        %_______________________________________________________
        % Stopping criteria
        if iga>maxit | cost(1)<mincost
            break
        end
        disp(['Iteration: ', num2str(iga), '           Lowest Cost: ',num2str(cost(1))]);% the parellel time
        [iga cost(1)];%show the progress
        aaa=[aaa;cost(1)];
        if cost(1)<10 && xxmin==0
            xxmin=iga;
        end
    end 

    %reconstruct the parameters into the hist
    bestHist = ReconstrucToHist(userHist,senIndex,par);
    bestJs=cost(1);
    %---------------------------------
%     plot the optimization progress
    figure()
    plot(aaa*1e5,'LineWidth',1.2);
    axis([xxmin 2000 cost(1)*1e5 1000]);
    legend('Lowest cost in each iteration');
    xlabel('Iteration');
    ylabel('JS score*10^5'); 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Portion of MATLAB Code for                                   %
%                                                               %
%  Imperialistic Competitive Algorithm (ICA)                    %
%  Version 1.9 - May 2010                                       %
%                                                               %
%    Programmed By: S. Mostapha Kalami Heris                    %
%                   Member of MATLABSITE.com Programmers Group  %
%                                                               %
%         Site URL: http://www.matlabsite.com                   %
%                                                               %
%  Support e-Mails: info@matlabsite.com                         %
%                                                               %
%   Author e-Mails: sm.kalami@gmail.com                         %
%                   kalami@ee.kntu.ac.ir                        %
%                                                               %
%  Author Homepage: http://www.kalami.ir                        %
%                                                               %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function imp=InitializeImperials()

    global ProblemSettings;
    global ICASettings;
    
    CostFunction=ProblemSettings.CostFunction;
    nVar=ProblemSettings.nVar;
    VarMin=ProblemSettings.VarMin;
    VarMax=ProblemSettings.VarMax;
    
    nPop=ICASettings.nPop;
    nImp=ICASettings.nImp;
    nCol=ICASettings.nCol;
    zetamax=ICASettings.zetamax;
    
    EmptyColony.Position=[];
    EmptyColony.Cost=[];
    
    Colonies=repmat(EmptyColony,nPop,1);
    for k=1:nPop
        Colonies(k).Position=unifrnd(VarMin,VarMax,[1 nVar]);
        Colonies(k).Cost=CostFunction(Colonies(k).Position);
    end

    [SortedCosts CostsSortOrder]=sort([Colonies.Cost]);
    Colonies=Colonies(CostsSortOrder);
    
    EmptyImperial.Position=[];
    EmptyImperial.Cost=[];
    EmptyImperial.TotalCost=[];
    EmptyImperial.nCol0=[];
    EmptyImperial.nCol=[];
    EmptyImperial.Colonies=[];
    EmptyImperial.zeta=[];
    
    imp=repmat(EmptyImperial,nImp,1);
    for i=1:nImp
        imp(i).Position=Colonies(i).Position;
        imp(i).Cost=Colonies(i).Cost;
    end
    
    Colonies=Colonies(nImp+1:end);
    if isempty(Colonies)
        return;
    end
    
    ImpCosts=[imp.Cost];
    MaxImpCost=max(ImpCosts);
    ImpFitness=1.2*MaxImpCost-ImpCosts;
    p=ImpFitness/sum(ImpFitness);
    nc=round(p*nCol);
    snc=sum(nc);
    
    if snc>nCol
        i=1;
        while snc>nCol
            nc(i)=max(nc(i)-1,0);
            i=i+1;
            if i>nImp
                i=1;
            end
            snc=sum(nc);
        end
    elseif snc<nCol
        i=nImp;
        while snc<nCol
            nc(i)=nc(i)+1;
            i=i-1;
            if i<1
                i=nImp;
            end
            snc=sum(nc);
        end
    end
    
    Colonies=Colonies(randperm(nCol));
    
    for i=1:nImp
        imp(i).nCol0=nc(i);
        imp(i).nCol=nc(i);
        imp(i).Colonies=Colonies(1:nc(i));
        imp(i).zeta=zetamax;
        Colonies=Colonies(nc(i)+1:end);
    end
    
end
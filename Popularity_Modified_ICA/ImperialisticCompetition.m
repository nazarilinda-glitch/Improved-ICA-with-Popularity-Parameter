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

function imp=ImperialisticCompetition(imp)

    if numel(imp)<2
        return;
    end

    ImpTotalCost=[imp.TotalCost];
    [MaxImpTotalCost WeakestImpIndex]=max(ImpTotalCost);
    WeakestImp=imp(WeakestImpIndex);

    ColCost=[WeakestImp.Colonies.Cost];
    [MaxColCost WeakestColIndex]=max(ColCost);
    WeakestCol=WeakestImp.Colonies(WeakestColIndex);
    
    ImpFitness=MaxImpTotalCost-ImpTotalCost;
    p=ImpFitness/sum(ImpFitness);
    i=RouletteWheelSelection(p);
    
    imp(i).nCol=imp(i).nCol+1;
    imp(i).Colonies(imp(i).nCol)=WeakestCol;

    imp(WeakestImpIndex).nCol=imp(WeakestImpIndex).nCol-1;
    imp(WeakestImpIndex).Colonies=imp(WeakestImpIndex).Colonies([1:WeakestColIndex-1 WeakestColIndex+1:end]);
    
    if imp(WeakestImpIndex).nCol==0
       
        j=RouletteWheelSelection(p);
        
        imp(j).nCol=imp(j).nCol+1;
        imp(j).Colonies(imp(j).nCol).Position=WeakestImp.Position;
        imp(j).Colonies(imp(j).nCol).Cost=WeakestImp.Cost;
        
        imp=imp([1:WeakestImpIndex-1 WeakestImpIndex+1:end]);
        
    end
    
end
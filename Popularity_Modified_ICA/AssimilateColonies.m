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

function imp=AssimilateColonies(imp)

    global ProblemSettings;
    global ICASettings;
    
    CostFunction=ProblemSettings.CostFunction;
    VarMin=ProblemSettings.VarMin;
    VarMax=ProblemSettings.VarMax;
    
    beta=ICASettings.beta;
    
    for i=1:numel(imp)
        for j=1:imp(i).nCol
            
            d=imp(i).Position-imp(i).Colonies(j).Position;
            
            x=beta*rand(size(d)).*d;
            
            imp(i).Colonies(j).Position=imp(i).Colonies(j).Position+x;
            
            imp(i).Colonies(j).Position=min(max(imp(i).Colonies(j).Position,VarMin),VarMax);
            
            imp(i).Colonies(j).Cost=CostFunction(imp(i).Colonies(j).Position);
            
        end
    end
    
end
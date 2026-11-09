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

function imp=RevolveColonies(imp)

    global ProblemSettings;
    global ICASettings;
    
    CostFunction=ProblemSettings.CostFunction;
    nVar=ProblemSettings.nVar;
    VarMin=ProblemSettings.VarMin;
    VarMax=ProblemSettings.VarMax;
    
    pRevolution=ICASettings.pRevolution;
    
    for i=1:numel(imp)
        for j=1:imp(i).nCol
            if rand<pRevolution
                k=randi([1 nVar]);

                imp(i).Colonies(j).Position(k)=unifrnd(VarMin,VarMax);

                imp(i).Colonies(j).Cost=CostFunction(imp(i).Colonies(j).Position);
            end
        end
    end

end
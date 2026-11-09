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

function imp=ExchangeWithBestColony(imp)

    for i=1:numel(imp)
        
        cc=[imp(i).Colonies.Cost];
        [min_cc min_cc_index]=min(cc);
        
        if min_cc<=imp(i).Cost
            
            BestColony=imp(i).Colonies(min_cc_index);
            
            imp(i).Colonies(min_cc_index).Position=imp(i).Position;
            imp(i).Colonies(min_cc_index).Cost=imp(i).Cost;
            
            imp(i).Position=BestColony.Position;
            imp(i).Cost=BestColony.Cost;
            
        end
        
    end

end
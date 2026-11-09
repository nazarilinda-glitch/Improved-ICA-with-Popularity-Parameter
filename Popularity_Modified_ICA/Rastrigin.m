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

function z=Rastrigin(x)
    
    global NFE;
    NFE=NFE+1;

    n=numel(x);

    A=10;
    
    z=n*A+sum(x.^2-A*cos(2*pi*x));

end
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

%% Problem Definition
global ProblemSettings;
ProblemSettings.CostFunction=CostFunction;
ProblemSettings.nVar=nVar;
ProblemSettings.VarMin=VarMin;
ProblemSettings.VarMax=VarMax;

%% ICA Settings
global ICASettings;
ICASettings.nPop=nPop;
ICASettings.nImp=nImp;
ICASettings.nCol=nPop-nImp;
ICASettings.MaxDecades=MaxDecades;
ICASettings.beta=beta;
ICASettings.pRevolution=pRevolution;
ICASettings.zetamin=zetamin;
ICASettings.zetamax=zetamax;

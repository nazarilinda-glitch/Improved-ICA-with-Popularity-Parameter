%% Problem Definition
 
CostFunction=@(x) Ackley(x);
 
nVar=5;       % Number of Unknown Variables
 
VarMin=-10;    % Lower Bound of Unknown Variables
VarMax= 10;    % Upper Bound of Unknown Variables
 
%% ICA Settings
 
nPop=100;     % Number of Countries
nImp=10;      % Number of Imperials
nCol=nPop-nImp;
 
MaxDecades=100;
 
beta=2;
 
pRevolution=0.1;
 
zetamin=0.01;
zetamax=0.1;
 
UpdateZetaAt=20;
 
%% Initialization
 
ShareSettings;
 
imp=InitializeImperials();
 
BestSol.Position=[];
BestSol.Cost=[];
 
BestCost=zeros(ICASettings.MaxDecades,1);
MeanCost=zeros(ICASettings.MaxDecades,1);
 
%% ICA
for Decade=1:MaxDecades
    
     if Decade==UpdateZetaAt            % Onces at decade UpdateZetaAt
    %if mod(Decade,UpdateZetaAt)==0     % Every UpdateZetaAt decade
    %if true                            % Always
    %if false                           % Never
        disp('Before Updae ...');
        disp([imp.zeta]);
        imp=UpdateZeta(imp);
        disp('After Update ...');
        disp([imp.zeta]);
    end
    
    imp=AssimilateColonies(imp);
    
    imp=RevolveColonies(imp);
    
    imp=ExchangeWithBestColony(imp);
    
    imp=CalculateTotalCosts(imp);
    
    imp=ImperialisticCompetition(imp);
 
    ImpCost=[imp.Cost];
    [BestImpCost BestImpIndex]=min(ImpCost);
    BestImp=imp(BestImpIndex);
    
    BestSol.Position=BestImp.Position;
    BestSol.Cost=BestImp.Cost;
    
    BestCost(Decade)=BestImpCost;
    MeanCost(Decade)=mean(ImpCost);
    
    disp(['Decade ' num2str(Decade) ...
          ': Best Cost = ' num2str(BestCost(Decade)) ...
          ', Mean Cost = ' num2str(MeanCost(Decade)) ...
          ', nImp = ' num2str(numel(imp))]);
      
end
 
figure;
semilogy(BestCost,'b','LineWidth',2);
hold on;
semilogy(MeanCost,'r:','LineWidth',2);
legend('Best Cost','Mean Cost');
xlabel('Decade');

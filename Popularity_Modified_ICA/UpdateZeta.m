function imp=UpdateZeta(imp)

    global ICASettings;
    zetamin=ICASettings.zetamin;
    zetamax=ICASettings.zetamax;

    nImp=numel(imp);

       for i=1:nImp
        Q(i)=max(imp(i).nCol-imp(i).nCol0,0);
    end
    
    Qmin=min(Q);
    Qmax=max(Q);
    
   
        for i=1:nImp
            imp(i).zeta=zetamax-(zetamax-zetamin)*(Q(i)-Qmin)/(Qmax-Qmin);
     end

end
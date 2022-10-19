[ann,anntype,subtype,chan]=rdann('mitdb/234', 'atr', [],[],[],'V');

ind=ann;
i=1;
 cnt=numel(ind);
 sgmt=rand(cnt,256);
while(i<=cnt)
    k=1;
    for j=(ind(i)-75):1:(ind(i)+180)
        sgmt(i,k)=a1(j);
        k=k+1;
    end
    i=i+1;
        
end


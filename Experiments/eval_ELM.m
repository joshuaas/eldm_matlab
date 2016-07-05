%elm
AUCELM = zeros(length(coeff),length(node),length(q));
timeELM = zeros(length(coeff),length(node),length(q));
  for  i = coeff
       for  n=node   
               for cycles=q  
                        [x_train,y_train,x_test,y_test, ps] = splitData (data,ny,0.4 );
                        C = 2^i;
                        n_h = n;  
                        t1=clock;
                        model = Train_ELM( x_train,y_train,n_h,C,'tanh');
                        t2=clock;
                        timeELM(i+1-coeff(1),n+1-node(1),cycles+1-q(1))=etime(t2,t1);
                        y_predict = pred_E(x_test,model);
                        auc = calacc(y_predict,y_test);
                        AUCELM(i+1-coeff(1),n+1-node(1),cycles+1-q(1))=auc;
                end
      end
  end   
resultELM = mean(AUCELM,3);
resulttimeELM = mean(timeELM,3);
maxAUCELM = max(resultELM(:));
indexELM = find(resultELM==maxAUCELM);
[iAUCELM,nAUCELM] = ind2sub(size(resultELM),indexELM);
aELM = AUCELM(iAUCELM(1),nAUCELM(1),:);
aELM = aELM(:);
tELM = timeELM(iAUCELM(1),nAUCELM(1),:);
tELM = tELM(:);
stdELM = std(aELM);
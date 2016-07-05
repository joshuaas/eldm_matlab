%eldm
AUCeldm = zeros(length(coeff),length(node),length(lam1),length(lam2),length(q));%AUC can Judge of classifier that is good or bad
timeeldm = zeros(length(coeff),length(node),length(lam1),length(lam2),length(q));%computing time
  for  i = 1:length(coeff)
       for  n= 1:length(node)
           for  j = 1:length(lam1)       
                for o = 1:length(lam2)          
                    for cycles=1:length(q)  
                        [x_train,y_train,x_test,y_test, ps] = splitData (data,ny,0.4 );
                        C= 2^(coeff(i));
                        nh = node(n);
                        lambda1 = 2^(lam1(j));
                        lambda2 = 2^(lam2(o)); 
                        t1=clock;
                        model = train_eldm(x_train,y_train,C ,nh,lambda1,lambda2,'tanh');
                        t2=clock;
                        timeeldm(i,n,j,o,cycles)=etime(t2,t1);
                        y_predict = pred_E(x_test,model);
                        auc=calacc(y_predict,y_test);
                        AUCeldm(i,n,j,o,cycles)=auc;
                          disp([num2str(i) '-' num2str(n) '-' num2str(j) '-' num2str(o) '-' num2str(cycles)])
                     end
                end
           end
      end
  end
  resulteldm = mean(AUCeldm,5);
  resulttimeeldm = mean(timeeldm,5);
  maxAUCeldm = max(resulteldm(:));
 indexeldm = find(resulteldm==maxAUCeldm);
 [iAUCeldm,nAUCeldm,jAUCeldm,oAUCeldm] = ind2sub(size(resulteldm),indexeldm); 
 aELDM   = AUCeldm(iAUCeldm(1),nAUCeldm(1),jAUCeldm(1),oAUCeldm(1),:);
 aELDM   = aELDM(:);
 tELDM   = timeeldm(iAUCeldm(1),nAUCeldm(1),jAUCeldm(1),oAUCeldm(1),:);
 tELDM   = tELDM(:);
 stdELDM = std(aELDM);
  
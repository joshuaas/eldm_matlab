AUCLDM=zeros(length(coeff),length(lam1),length(lam2),length(g),length(q));
timeLDM=zeros(length(coeff),length(lam1),length(lam2),length(g),length(q));
  for  i = 1:length(coeff)
      for  j =1:length(lam1)       
             for o = 1:length(lam2)     
                 for gg  = 1:length(g)     
                      for cycles=1:5
                   	    ng = num2str(g(gg)) ;
                        C= 2^(coeff(i));
                        lambda1 = 2^(lam1(j));
                        lambda2 = 2^(lam2(o)); 
                        [x_train,y_train,x_test,y_test, ps] = splitData (data,ny,0.4 );
                        t1=clock;
                        [prediction,value]=train_LDM(y_train,x_train,y_test,x_test,C,lambda1,lambda2, ['-s 0 -k 2 -g ' ng ' -c ' num2str(C)]);   
                        t2=clock;
                        timeLDM(i,j,o,gg ,cycles)=etime(t2,t1);
                        auc=calacc(value,y_test);
                        AUCLDM(i,j,o,gg,cycles)=auc;
                        disp([num2str(i) '-' num2str(j) '-' num2str(o) '-' num2str(gg) '-' num2str(cycles)])
                     end
                end
             end
       end
  end
  resultLDM=mean(AUCLDM,5);
  resulttimeLDM=mean(timeLDM,5);
  maxAUCLDM=max(resultLDM(:));
 indexLDM=find(resultLDM==maxAUCLDM);
 [iAUCLDM,jAUCLDM,oAUCLDM,gAUCLDM]=ind2sub(size(resultLDM),indexLDM);
 aLDM  = AUCLDM(iAUCLDM(1),jAUCLDM(1),oAUCLDM(1),gAUCLDM(1),:);
 aLDM  = aLDM(:);
 tLDM  = timeLDM(iAUCLDM(1),jAUCLDM(1),oAUCLDM(1),gAUCLDM(1),:);
 tLDM  = tLDM(:);

stdLDM = std(aLDM);
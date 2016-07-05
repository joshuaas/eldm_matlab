%execute algorithm then save
function eval_ELDM_test(inpath,outpath)
[data,ny] =parseData(inpath) ;%deal with input path and data
%data= load('E:\MATLAB\SVM\data\handwritten2.txt');

coeff= -3:3;% penalty coefficient
g=-5:5;%gamma in kernel function
c=coeff;
if(ny>1)
    node = [50 100 150 200 300 1000] ;
else
    node= [50 100 150 200 300];%Number of hidden nodes
end
lam1= -8:-3;
lam2= -8:-3;
q = 1:5; %cycle-index
%LDM
% path(path,'E:\MATLAB\SVM\LDM-code');
% path(path,'E:\MATLAB\SVM\LDM-code\LDM');
% path(path,'E:\MATLAB\SVM\libsvm-3.21\matlab');
eval_LDM  ;

eval_ELM  ;

eval_ELDM ;
% % 
% % a = [aELDM;aELM;aLDM];
% % t = [tELDM;tELM;tLDM];
% % a = a(:);
% % t = t(:);
% % gr = repmat(1:3,5,1);
% % gr =gr(:);
% % resA = [a gr];
% % resT = [t gr];

save(strcat(outpath{:}));

end
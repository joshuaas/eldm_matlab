function [prediction,value,t]=train_LDM(label,trainInstance,groundTruth,testInstance,C,lambda1,lambda2,options)
if(size(label,2)>1)
	m = size(label,2);
	label = 2*label-1;
	groundTruth = 2*groundTruth -1;
	t = 0;
	for i = 1:m
       [prediction(:,i),~,value(:,i),ti]=LDM(label(:,i),trainInstance,groundTruth(:,i),testInstance,C,lambda1,lambda2,options);
       t = t +ti;  
	end
else
  
	[prediction,~,value,t]=LDM(label,trainInstance,groundTruth,testInstance,C,lambda1,lambda2,options);
end
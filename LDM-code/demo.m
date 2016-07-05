addpath('LDM');

% kernel LDM on the data set "heart"
load('heart.mat');
C=10;
lambda1=2^0;
lambda2=2^0;
[prediction,accuracy,value]=LDM(label,trainInstance,groundTruth,testInstance,C,lambda1,lambda2,'-s 0 -g 0.1');

% large scale LDM on the data set "real-sim"
load('real-sim.mat');
C=1;
lambda1=2^9;
lambda2=2^6;
[prediction,accuracy,value]=LDM(label,trainInstance,groundTruth,testInstance,C,lambda1,lambda2,'-s 1 -t 5');
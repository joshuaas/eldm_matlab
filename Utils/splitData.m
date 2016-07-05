function  [x_train,y_train,x_test,y_test,ps]=splitData(data,k,ratio)
    [m,n]=size(data);%data的行列
    %ratio=0.8;%比例
    index_train=randperm(m,round(ratio*m));%从原始数据中抽取了训练数据的下标
    %k=1;%训练数据的输出所占的列数
    x=data(:,1:(n-k));%对所有输入数据标准化
    x=x';
    [x,ps] = mapminmax(x,-1,1);%标准化：均值为0，标准差为1的正态分布
    x=x';
    x_train=x(index_train,:);%选取训练输入样本
    y_train=data(index_train,(n-k+1):n);%选取训练输出样本
    index_test=setdiff(1:m,index_train);%测试集行标
    x_test=x(index_test,:);%选取输入测试集
    y_test=data(index_test,(n-k+1):n);%选取输出测试集
end

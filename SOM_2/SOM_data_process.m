function [train_data,train_label]=SOM_data_process()
train_data=[1 0 0 0 0;
            2 0 0 0 0;
            3 0 0 0 0;
            4 0 0 0 0;
            5 0 0 0 0;
            3 1 0 0 0;
            3 2 0 0 0;
            3 3 0 0 0;
            3 4 0 0 0;
            3 5 0 0 0;
            3 3 1 0 0;
            3 3 2 0 0;
            3 3 3 0 0;
            3 3 4 0 0;
            3 3 5 0 0;
            3 3 3 1 0;
            3 3 3 2 0;
            3 3 3 3 0;
            3 3 3 4 0;
            3 3 3 5 0;
            3 3 3 3 1;
            3 3 3 3 2;
            3 3 3 3 3;
            3 3 3 3 4;
            3 3 3 3 5;
            3 3 3 3 6];
train_label=['A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z','1','2','3','4','5','6'];
train_data=train_data';
length=size(train_data,2);
for i=1:length
     train_data(:,i)=train_data(:,i)/sqrt(sum(train_data(:,i).*train_data(:,i)));
% train_data(:,i)=train_data(:,i)/max(train_data(:,i));
end
end
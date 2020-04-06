%%lijie测试som
clc;
clear;
load abs.txt
data=abs;
data=data(:,2:115);
size(data);
P1=data(1:40,:);
T1=data(41:60,:);
P=P1;
T=T1;
P=P';  %%转置
T=T';

[Pn,Ps]=mapminmax(P); %归一化
[Tn,Ps]=mapminmax(T); %归一化
%%建立网络
Q=minmax(Pn); %如果不归一化,直接使用P的最大最小值
net=newc(Q,2,0.1);  %无导师
net=init(net);

%%训练网络
net.trainParam.epochs=300;
net=train(net,P);

%%测试数据
a=sim(net,P);
ac=vec2ind(a);    %只显示分类类别

%预测数据T
y=sim(net,T);
yc=vec2ind(y);    %只显示分类类别




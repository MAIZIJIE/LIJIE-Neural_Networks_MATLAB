%%lijie����som
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
P=P';  %%ת��
T=T';

[Pn,Ps]=mapminmax(P); %��һ��
[Tn,Ps]=mapminmax(T); %��һ��
%%��������
Q=minmax(Pn); %�������һ��,ֱ��ʹ��P�������Сֵ
net=newc(Q,2,0.1);  %�޵�ʦ
net=init(net);

%%ѵ������
net.trainParam.epochs=300;
net=train(net,P);

%%��������
a=sim(net,P);
ac=vec2ind(a);    %ֻ��ʾ�������

%Ԥ������T
y=sim(net,T);
yc=vec2ind(y);    %ֻ��ʾ�������




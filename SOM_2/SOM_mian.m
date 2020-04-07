%%% ������֮����֯����SOM��ϰ
%%%���ߣ�xd.wp
%%%ʱ�䣺2016.10.02 19��16
%% ����˵����
%%%          1���������У������Ϊ��άƽ�棬
%%%          2����������ȷ��������Ȩֵ����exp(-distant^2/delta^2)����
%%%          3������ά��Ϊ5���������Ϊ70
%%%          4���������ݣ���һ��Ϊ��λ����
clear all;
clc;
%% �����ʼ������Ӧ������ʼ��
%�������ݲ���һ��
[train_data,train_label]=SOM_data_process();
data_num=size(train_data,2);
 
%Ȩֵ��ʼ��
% weight_temp=ones(5,70)/1000;
weight_temp=rand(5,70)/1000;
 
%������
node_num=size(weight_temp,2);
 
%Ȩֵ��һ��
for i=1:node_num
    weight(:,i)=weight_temp(:,i)/max(weight_temp(:,i));    
end
 
%����������
delta=2;
 
%��������
alpha=0.6;
%% Kohonen�㷨ѧϰ����
for t=4:-1:1                                    %%�����������
    index_active=ones(1,node_num);              %%����Ծ��־
    for n=1:data_num                            %%ÿ������������
        % �������֣�������С����ȷ����ʤ��Ԫ
        [j_min]=SOM_compare(weight,train_data(:,n),node_num,index_active);
        
        %ȥ���ȷ�����ݽ��1��1ӳ��
        index_active(1,j_min)=0;
        
        %Ϊ������ͼ���ַ���
        index_plot(1,n)=j_min;
        [x,y]=line_to_array(j_min);
        fprintf('����[%d,%d]��Ϊ�ַ�%s \n',x,y,train_label(1,n));
        
        % ѧϰ��������Ȩֵ����
        st=num2str(t-1);
        switch   st
            case '3'
                [weight]=SOM_neighb3(weight,train_data(:,n),j_min,delta,alpha);
            case '2'
                [weight]=SOM_neighb2(weight,train_data(:,n),j_min,delta,alpha);
            case '1'
                [weight]=SOM_neighb1(weight,train_data(:,n),j_min,delta,alpha);
            otherwise
                [weight]=SOM_neighb0(weight,train_data(:,n),j_min,alpha);
        end
        
    end
end
%% ���ƽ��ֲ�ͼ��
figure(1);
for n=1:data_num
    [x,y]=line_to_array(index_plot(1,n));
    axis([0,12,0,12]);
    text(x,y,'*');
    text(x+0.2,y+0.2,train_label(1,n));
    hold on;
end
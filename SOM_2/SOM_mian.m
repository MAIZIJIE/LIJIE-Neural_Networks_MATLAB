%%% 神经网络之自组织网络SOM练习
%%%作者：xd.wp
%%%时间：2016.10.02 19：16
%% 程序说明：
%%%          1、本程序中，输出层为二维平面，
%%%          2、几何邻域确定及调整权值采用exp(-distant^2/delta^2)函数
%%%          3、样本维数为5，输出层结点为70
%%%          4、输入数据，归一化为单位向量
clear all;
clc;
%% 网络初始化及相应参数初始化
%加载数据并归一化
[train_data,train_label]=SOM_data_process();
data_num=size(train_data,2);
 
%权值初始化
% weight_temp=ones(5,70)/1000;
weight_temp=rand(5,70)/1000;
 
%结点个数
node_num=size(weight_temp,2);
 
%权值归一化
for i=1:node_num
    weight(:,i)=weight_temp(:,i)/max(weight_temp(:,i));    
end
 
%邻域函数参数
delta=2;
 
%调整步幅
alpha=0.6;
%% Kohonen算法学习过程
for t=4:-1:1                                    %%总体迭代次数
    index_active=ones(1,node_num);              %%结点活跃标志
    for n=1:data_num                            %%每个样本的输入
        % 竞争部分，根据最小距离确定获胜神经元
        [j_min]=SOM_compare(weight,train_data(:,n),node_num,index_active);
        
        %去激活，确保数据结点1对1映射
        index_active(1,j_min)=0;
        
        %为后续绘图部分服务
        index_plot(1,n)=j_min;
        [x,y]=line_to_array(j_min);
        fprintf('坐标[%d,%d]处为字符%s \n',x,y,train_label(1,n));
        
        % 学习部分网络权值调整
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
%% 绘制结点分布图像
figure(1);
for n=1:data_num
    [x,y]=line_to_array(index_plot(1,n));
    axis([0,12,0,12]);
    text(x,y,'*');
    text(x+0.2,y+0.2,train_label(1,n));
    hold on;
end
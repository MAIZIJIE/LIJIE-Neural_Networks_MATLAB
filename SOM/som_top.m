%% SOM拓扑结构
%%gridtop网络拓扑结构
pos=gridtop(8,10);
plotsom(pos);

%%hextop网络拓扑结构  %%缺省函数
pos=hextop(8,10);
plotsom(pos)

%%randtop()生成随机网络拓扑结构
pos=randtop(8,10);
plotsom(pos);

%%神经元之间距离


%欧几里德距离dist()
%pos2=[0 1 2;0 1 2];
pos2=gridtop(2,3);
plotsom(pos2);
D=dist(pos2);


%boxdist()
pos2=gridtop(2,3);
plotsom(pos2);
D=boxdist(pos2)

%%link距离
%%Manhattan距离


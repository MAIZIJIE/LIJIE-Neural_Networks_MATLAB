%% SOM���˽ṹ
%%gridtop�������˽ṹ
pos=gridtop(8,10);
plotsom(pos);

%%hextop�������˽ṹ  %%ȱʡ����
pos=hextop(8,10);
plotsom(pos)

%%randtop()��������������˽ṹ
pos=randtop(8,10);
plotsom(pos);

%%��Ԫ֮�����


%ŷ����¾���dist()
%pos2=[0 1 2;0 1 2];
pos2=gridtop(2,3);
plotsom(pos2);
D=dist(pos2);


%boxdist()
pos2=gridtop(2,3);
plotsom(pos2);
D=boxdist(pos2)

%%link����
%%Manhattan����


function [x,y]=line_to_array(j_min)
% ��1*70�����е�����ת��Ϊ7*10�����е�����
%    1   8    ������
%    7   14   ������
y=ceil(j_min/7);
x=rem(j_min,7);
end
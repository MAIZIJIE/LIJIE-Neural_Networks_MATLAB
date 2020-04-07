function [x,y]=line_to_array(j_min)
% 将1*70向量中的坐标转化为7*10矩阵中的坐标
%    1   8    ···
%    7   14   ···
y=ceil(j_min/7);
x=rem(j_min,7);
end
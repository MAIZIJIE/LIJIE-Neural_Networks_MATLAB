function [weight]=SOM_neighb3(weight,train_data_active,j_min,delta,alpha)
 
%% 权值调整幅度分布
%                          -0.2
%                           0.2
%                           0.6
%        -0.2   0.2   0.6    1    0.6   0.2   -0.2
%                           0.6
%                           0.2
%                          -0.2
% 单位距离转化比例为0.4
%% 坐标转换
[x,y]=line_to_array(j_min);
% 将1*70向量中的坐标转化为7*10矩阵中的坐标
%    1   8    ···
%    7   14   ···
 
%% 权值调整过程
%结点靠上边情况
if (x<=3)
    for m=1:1:x+3
        if (y<=3)          %结点靠左边
            for n=1:1:y+3
                distant=sqrt((x-m)^2+(y-n)^2);
                weight(:,(n-1)*7+m)=weight(:,(n-1)*7+m)-alpha*exp(-distant^2/delta^2)*(weight(:,(n-1)*7+m)-train_data_active);
            end
        elseif (y>=8)      %结点靠右边
            for n=y-3:1:10
                distant=sqrt((x-m)^2+(y-n)^2);
                weight(:,(n-1)*7+m)=weight(:,(n-1)*7+m)-alpha*exp(-distant^2/delta^2)*(weight(:,(n-1)*7+m)-train_data_active);
            end
        else
            for n=y-3:1:y+3
                distant=sqrt((x-m)^2+(y-n)^2);
                weight(:,(n-1)*7+m)=weight(:,(n-1)*7+m)-alpha*exp(-distant^2/delta^2)*(weight(:,(n-1)*7+m)-train_data_active);
            end
        end
    end
    %结点靠下边情况
elseif (x>=5)
    for m=x-3:1:7
         if (y<=3)          %结点靠左边
            for n=1:1:y+3
                distant=sqrt((x-m)^2+(y-n)^2);
                weight(:,(n-1)*7+m)=weight(:,(n-1)*7+m)-alpha*exp(-distant^2/delta^2)*(weight(:,(n-1)*7+m)-train_data_active);
            end
        elseif (y>=8)      %结点靠右边
            for n=y-3:1:10
                distant=sqrt((x-m)^2+(y-n)^2);
                weight(:,(n-1)*7+m)=weight(:,(n-1)*7+m)-alpha*exp(-distant^2/delta^2)*(weight(:,(n-1)*7+m)-train_data_active);
            end
        else
            for n=y-3:1:y+3
                distant=sqrt((x-m)^2+(y-n)^2);
                weight(:,(n-1)*7+m)=weight(:,(n-1)*7+m)-alpha*exp(-distant^2/delta^2)*(weight(:,(n-1)*7+m)-train_data_active);
            end
        end
    end
    %结点正好在中间
else
    for m=1:7
         if (y<=3)          %结点靠左边
            for n=1:1:y+3
                distant=sqrt((x-m)^2+(y-n)^2);
                weight(:,(n-1)*7+m)=weight(:,(n-1)*7+m)-alpha*exp(-distant^2/delta^2)*(weight(:,(n-1)*7+m)-train_data_active);
            end
        elseif (y>=8)      %结点靠右边
            for n=y-3:1:10
                distant=sqrt((x-m)^2+(y-n)^2);
                weight(:,(n-1)*7+m)=weight(:,(n-1)*7+m)-alpha*exp(-distant^2/delta^2)*(weight(:,(n-1)*7+m)-train_data_active);
            end
        else
            for n=y-3:1:y+3
                distant=sqrt((x-m)^2+(y-n)^2);
                weight(:,(n-1)*7+m)=weight(:,(n-1)*7+m)-alpha*exp(-distant^2/delta^2)*(weight(:,(n-1)*7+m)-train_data_active);
            end
        end
    end
end
end
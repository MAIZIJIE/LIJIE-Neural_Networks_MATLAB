function [weight]=SOM_neighb1(weight,train_data_active,j_min,delta,alpha)
 
%% Ȩֵ�������ȷֲ�
%                          -0.2
%                           0.2
%                           0.6
%        -0.2   0.2   0.6    1    0.6   0.2   -0.2
%                           0.6
%                           0.2
%                          -0.2
% ��λ����ת������Ϊ0.4
%% ����ת��
[x,y]=line_to_array(j_min);
% ��1*70�����е�����ת��Ϊ7*10�����е�����
%    1   8    ������
%    7   14   ������
 
%% Ȩֵ��������
%��㿿�ϱ����
if (x<=1)
    for m=1:1:x+1
        if (y<=1)          %��㿿���
            for n=1:1:y+3
                distant=sqrt((x-m)^2+(y-n)^2);
                weight(:,(n-1)*7+m)=weight(:,(n-1)*7+m)-alpha*exp(-distant^2/delta^2)*(weight(:,(n-1)*7+m)-train_data_active);
            end
        elseif (y>=10)      %��㿿�ұ�
            for n=y-1:1:10
                distant=sqrt((x-m)^2+(y-n)^2);
weight(:,(n-1)*7+m)=weight(:,(n-1)*7+m)-alpha*exp(-distant^2/delta^2)*(weight(:,(n-1)*7+m)-train_data_active);
            end
        else
            for n=y-1:1:y+1
                distant=sqrt((x-m)^2+(y-n)^2);
                weight(:,(n-1)*7+m)=weight(:,(n-1)*7+m)-alpha*exp(-distant^2/delta^2)*(weight(:,(n-1)*7+m)-train_data_active);
            end
        end
    end
    %��㿿�±����
elseif (x>=7)
    for m=x-3:1:7
        if (y<=1)          %��㿿���
            for n=1:1:y+3
                distant=sqrt((x-m)^2+(y-n)^2);
                weight(:,(n-1)*7+m)=weight(:,(n-1)*7+m)-alpha*exp(-distant^2/delta^2)*(weight(:,(n-1)*7+m)-train_data_active);
            end
        elseif (y>=10)      %��㿿�ұ�
            for n=y-1:1:10
                distant=sqrt((x-m)^2+(y-n)^2);
weight(:,(n-1)*7+m)=weight(:,(n-1)*7+m)-alpha*exp(-distant^2/delta^2)*(weight(:,(n-1)*7+m)-train_data_active);
            end
        else
            for n=y-1:1:y+1
                distant=sqrt((x-m)^2+(y-n)^2);
                weight(:,(n-1)*7+m)=weight(:,(n-1)*7+m)-alpha*exp(-distant^2/delta^2)*(weight(:,(n-1)*7+m)-train_data_active);
            end
        end
    end
    %����������м�
else
    for m=x-1:1:x+1
        if (y<=1)          %��㿿���
            for n=1:1:y+3
                distant=sqrt((x-m)^2+(y-n)^2);
                weight(:,(n-1)*7+m)=weight(:,(n-1)*7+m)-alpha*exp(-distant^2/delta^2)*(weight(:,(n-1)*7+m)-train_data_active);
            end
        elseif (y>=10)      %��㿿�ұ�
            for n=y-1:1:10
                distant=sqrt((x-m)^2+(y-n)^2);
weight(:,(n-1)*7+m)=weight(:,(n-1)*7+m)-alpha*exp(-distant^2/delta^2)*(weight(:,(n-1)*7+m)-train_data_active);
            end
        else
            for n=y-1:1:y+1
                distant=sqrt((x-m)^2+(y-n)^2);
                weight(:,(n-1)*7+m)=weight(:,(n-1)*7+m)-alpha*exp(-distant^2/delta^2)*(weight(:,(n-1)*7+m)-train_data_active);
            end
        end
    end
end
end
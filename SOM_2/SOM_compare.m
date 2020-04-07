function [j_min]=SOM_compare(weight,train_data_active,node_num,index_active)
for j=1:node_num
    distant(j,1)=sum((weight(:,j)-train_data_active).^2);
end
[~,j_min]=min(distant);
while(index_active(1,j_min)==0)
    distant(j_min,1)=10000000;
    [~,j_min]=min(distant);
end
 
end
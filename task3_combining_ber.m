%calculate the average combining ber by conbining all possibilities.
clear all;
clc;
load task3
data(1,:)=task3_try_1;
data(2,:)=task3_try_2;
data(3,:)=task3_try_3;
data(4,:)=task3_try_4;
data(5,:)=task3_try_5;
data(6,:)=task3_try_6;
data(7,:)=task3_try_7;
data(8,:)=task3_try_8;
data(9,:)=task3_try_9;
data(10,:)=task3_try_10;
data(11,:)=task3_try_11;
s_soft=task3_try_1+task3_try_2+task3_try_3+task3_try_4+task3_try_5+task3_try_6+task3_try_7+task3_try_8+task3_try_9+task3_try_10+task3_try_11;
s_soft=sign(s_soft);
s_hard=sign(sign(task3_try_1)+sign(task3_try_2)+sign(task3_try_3)+sign(task3_try_4)+sign(task3_try_5)+sign(task3_try_6)+sign(task3_try_7)+sign(task3_try_8)+sign(task3_try_9)+sign(task3_try_10)+sign(task3_try_11));
ss_soft=(s_soft+1)./2;
ss_hard=(s_hard+1)./2;
count=1;
for i=1:10
    for j=i+1:11
        s_soft_2=sign(data(i,:)+data(j,:));
        ss_soft_2=(s_soft_2+1)./2;
        bnr_1=(ss_soft_2-ss_soft).^2;
        bnr(count)=sum(bnr_1)/length(bnr_1);
        count=count+1;
        
    end
end
res_soft_2=sum(bnr)/length(bnr)
count=1;
for i=1:9
    for j=i+1:10
        for k=j+1:11
            s_hard_3=sign(sign(data(i,:))+sign(data(j,:))+sign(data(k,:)));
            ss_hard_3=(s_hard_3+1)./2;
            bnr_1=(ss_hard_3-ss_soft).^2;
            bnr2(count)=sum(bnr_1)/length(bnr_1);
            count=count+1;
        end
    end
end
res_hard_3=sum(bnr2)/length(bnr2)

%calculate combining ber for different combining times. 
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

for i=1:11
    s_soft2=zeros(1,212400);
    for j=1:i
        s_soft2=s_soft2+data(j,:);
    end
    s_soft2=sign(s_soft2);
    ss_soft2=(s_soft2+1)./2;
    ber_1=(ss_soft2-ss_soft).^2;
    ber(i)=sum(ber_1)/length(ber_1);
    
    
end
for i=1:6
    s_hard2=zeros(1,212400);
    for j=1:i
        s_hard2=s_hard2+sign(data(2*j-1,:));
    end
    s_hard2=sign(s_hard2);
    ss_hard2=(s_hard2+1)./2;
    ber_1=(ss_hard2-ss_soft).^2;
    ber2(i)=sum(ber_1)/length(ber_1);
    
    
end
figure;
subplot(1,2,1)
i=1:11
plot(i,ber)
i=1:6;
i=i.*2-1;
subplot(1,2,2)
plot(i,ber2)


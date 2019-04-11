clc;
clear all;
load task2;
training_out(1001)=0;
training_out(1002)=0;
training_out(1003)=0;
training_out(1004)=0;
for i=0:4
    
    tempy=training_out(1+i:1000+i);
    temp=tempy.*training_in;
    sum1=sum(temp);
    h(i+1)=sum1/(1000-i);
end    
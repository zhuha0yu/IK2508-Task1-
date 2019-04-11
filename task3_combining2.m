%two soft combinition and three hard combinition ber
clear all;
clc;
load task3
s_soft=task3_try_1+task3_try_2;
s_soft=sign(s_soft);
s_hard=sign(sign(task3_try_1)+sign(task3_try_2)+sign(task3_try_3));
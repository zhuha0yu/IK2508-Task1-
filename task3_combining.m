clear all;
clc;
load task3
s_soft=task3_try_1+task3_try_2+task3_try_3+task3_try_4+task3_try_5+task3_try_6+task3_try_7+task3_try_8+task3_try_9+task3_try_10+task3_try_11;
s_soft=sign(s_soft);
s_hard=sign(sign(task3_try_1)+sign(task3_try_2)+sign(task3_try_3)+sign(task3_try_4)+sign(task3_try_5)+sign(task3_try_6)+sign(task3_try_7)+sign(task3_try_8)+sign(task3_try_9)+sign(task3_try_10)+sign(task3_try_11));
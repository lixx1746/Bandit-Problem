function a=cacl_hit(true_mean,count)
% this function can be used to caculate the number of optimal pull
% input true_mean: expected value
% input count: how many times each arm is pulled
a = count(find(true_mean == max(true_mean),1));
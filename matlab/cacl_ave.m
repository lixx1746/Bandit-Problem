function [ave, count]  = cacl_ave(value,n)
% this function can be used to caculate average of the gain
% input value: gain
% input n: play turn
ave = sum(value)./n;
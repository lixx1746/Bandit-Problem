function [Expectedvalue, reward] = game_setting(K,var,n,true)
%input K: number of arms
%input var: standard devation of the gaussian distribution
%input true: 1 menas gaussian distro, 0 means unionform distro
%input n: turn
%output: Expectedvalue and reward
if nargin < 3
    n = 1000;
    true = 1;
end

if true == 1
 Expectedvalue = rand(K,1);
 reward = repmat(Expectedvalue,1,n) + var.* randn(K,n);
else
   Expectedvalue = rand(K,1); 
   reward = rand(K,n) + repmat((2.*Expectedvalue - 1)./2,1,n);
end
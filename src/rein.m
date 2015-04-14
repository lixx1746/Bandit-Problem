function [action,value,value1,count]=rein(n,K,reward,a,b)
% this function perform the reinforcement algorithm
%input n: total turn
%input reward: reward 
%input K: how many arms
%input a,b: paramater
%output: action every turn, value1: gain value every turn 
%output: value: gain for each arm, count: pull times for each arm
prefer = ones(K,1);
action = zeros(n,1);
count = zeros(K,1);
value = zeros(K,1);value1 = zeros(n,1);
ave = zeros(K,1);
for i = 1:n
    pro = exp(prefer);
    temp = randsample(K,1,true,pro./sum(pro));
    prefer(temp) = prefer(temp) + b*(reward(temp,i)-ave(temp));
    ave(temp) = (1-a)*ave(temp) + a*reward(temp,i);
    count(temp) = count(temp)+1; 
    value(temp) = value(temp) + reward(temp,i);
    value1(i) = reward(temp,i);
    action(i) = temp;
end
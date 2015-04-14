function [action,value,value1,count]=ucb(n,K,reward)
% this function perform the ucb1 algorithm
%input n: total turn
%input K: how many arms
%input reward: reward 
%output: action every turn, value1: gain value every turn 
%output: value: gain for each arm, count: pull times for each arm

init_expected = ones(K,1);
action = zeros(n,1);
count = ones(K,1);
value = zeros(K,1);value1 = zeros(n,1);
for i = 1:n
temp = init_expected + sqrt(2*log(n)./count);
temp1 = find(temp == max(temp),1);
action(i)= temp1;
count(temp1) = count(temp1) + 1;
value(temp1) = value(temp1) + reward(temp1,i);
value1(i) = reward(temp1,i);
init_expected(temp1) = value(temp1)./count(temp1);
end
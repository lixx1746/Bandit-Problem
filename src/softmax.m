function [action,value,value1,count] = softmax(n,K,t,reward)
%this function perform the softmax algorithm
%input n: total turn
%input K: how many arms
%input reward: reward 
%input t: paramater to control explo vs exploi
%output: action every turn, value1: gain value every turn 
%output: value: gain for each arm, count: pull times for each arm
init_expected = ones(K,1);
action = zeros(n,1);
count = zeros(K,1);
value = zeros(K,1);value1 = zeros(n,1);
for i = 1:n
    pro = exp(init_expected./t);
    temp = randsample(K,1,true,pro./sum(pro));
    action(i) = temp;
    value(temp) = value(temp) + reward(temp,i);
    value1(i) = reward(temp,i);
    count(temp) = count(temp) + 1; 
    init_expected(temp) = value(temp)./count(temp);
end
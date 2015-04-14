function [action,value,value1,count]=ucb_tune(n,K,reward)
% this function perform the ucb1-tune algorithm
%input n: total turn
%input K: how many arms
%input reward: reward 
%output: action every turn, value1: gain value every turn 
%output: value: gain for each arm, count: pull times for each arm

init_expected = ones(K,1);
action = zeros(n,1);
count = ones(K,1);
value = zeros(K,1);value1 =zeros(n,1);
value_square = zeros(K,1);
for i = 1:n
    v = value_square./count - init_expected.^2 + sqrt(2*log(i)./count);
    temp = min(0.25, v);
    temp1 = init_expected + sqrt((log(i)./count).*temp);
    temp2 = find(temp1 == max(temp1),1);
    action(i)= temp2;
    count(temp2) = count(temp2) + 1;
    value(temp2) = value(temp2) + reward(temp2,i);
    value1(i) = reward(temp2,i);
    value_square(temp2) = value_square(temp2) + reward(temp2,i).^2;
    init_expected(temp2) = value(temp2)./count(temp2);
end
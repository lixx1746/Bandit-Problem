function [action,value,value1,count] = eps_greedy(n,K,eps,reward)
% this function perform the eps-greedy algorithm
%input n: total turn
%input K: how many arms
%input reward: reward 
%input eps: paramater to control explo vs exploi
%output: action every turn, value1: gain value every turn 
%output: value: gain for each arm, count: pull times for each arm

init_expected = ones(K,1);
action = zeros(n,1);
count = zeros(K,1);
value = zeros(K,1);value1 = zeros(n,1);
greedy_play = random_play(n,eps);
for i = 1:n
    if greedy_play(i) == 1;
        temp = find(init_expected == max(init_expected),1);
        action(i) = temp;
        value(temp) = value(temp) + reward(temp,i);
        value1(i) = reward(temp,i);
        count(temp) = count(temp) + 1; 
        init_expected(temp) = value(temp)./count(temp);
        
    else
        temp = randsample(K,1);
        action(i) = temp;
        value(temp) = value(temp) + reward(temp,i);
        value1(i) = reward(temp,i);
        count(temp) = count(temp) + 1; 
        init_expected(temp) = value(temp)./count(temp);
    end

end


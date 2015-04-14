function [action,value,value1,count]=Exp3H(n,K,reward)
% this function perform the exp3 algorithm
%input n: total turn
%input K: how many arms
%input reward: reward 
%output: action every turn, value1: gain value every turn 
%output: value: gain for each arm, count: pull times for each arm
r = 0.5;a = 1;
w = exp(a*r./3*sqrt(n/K)).*ones(K,1);
action = zeros(n,1);
count = zeros(K,1);
value = zeros(K,1);value1 = zeros(n,1);
for i = 1 : n
    p = (1 - r).* w ./sum(w) + r./K;
    temp = randsample(K,1,true,p);
    action(i) = temp;
    count(temp) = count(temp) + 1;
    x_hat = zeros(K,1);
    value(temp)= value(temp) + reward(temp,i);
    value1(i) = reward(temp,i);
    x_hat(temp) = reward(temp,i)./p(temp);
    w = w.*exp(r./(3*K).*(x_hat + a./(p*sqrt(K*n))));
end
    
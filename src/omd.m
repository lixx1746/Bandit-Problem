function [action,value,value1,count,w] = omd(n,K,rewards)

% this function perform the my propose algorithm(online mirror descent)
%input n: total turn
%input K: how many arms
%input rewards: reward 
%output: action every turn, value1: gain value every turn 
%output: value: gain for each arm, count: pull times for each arm
a = 0.2;
action = zeros(n,1);
count = zeros(K,1);
value = zeros(K,1);
w = 1./K .* ones(K,1);
for i = 1 : n
    if ~(sum(w) > 0) || ~all(w >=0)
       w = 1./K.*ones(K,1);
    end
    % according to w, choose arm
    temp = randsample(K,1,true,w);
    action(i) = temp;
    y = rewards(temp,i);
    value(temp) = value(temp) + rewards(temp,i);
    value1(i) = rewards(temp,i);
    count(temp) = count(temp) + 1; 
    w_hat = w;
    % update w_hat, since y is reward, in order to chage it to lose, we use
    % (1-y)
    w_hat(temp) = w(temp)*exp(-a .* (1-y)./w(temp));
    w = w_hat./sum(w_hat);
end
end

    
    

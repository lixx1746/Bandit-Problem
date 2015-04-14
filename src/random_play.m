function greedy_play = random_play(n,eps)
% input n: the total play turns
% output random_play: n*1 array, its entry is 0 or 1
% 1 means I should choose the lagest estimate
% 0 means I should randome choose one arm which, is independent of my estimate
if nargin < 1
    n = 1000;
    eps = 0.1;
end
a=rand(1,n);
greedy_play = (a <= (1-eps));
end
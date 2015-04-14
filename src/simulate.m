function simulate()
% this funtion used to compare different algorithm
% you can just run this program to see the result
close all;
clear all;
%K: number of arms
%var: variance
%n: how many turns
%true = 1 means gaussian, 0 means uniform
K = 10;var = 0.1;n = 1000;true =1;
eps = 0.1;
t = 0.2;
%repeat 10 times
a = 0.5;b = 0.5;repeat = 10;
for i = 1:repeat
[Expectedvalue(:,i), reward] = game_setting(K,var,n,true);
% action: the colume represent the unit time
[action_g(:,i),value_g,value1_g(:,i),count_g] = eps_greedy(n,K,eps,reward);
[action_s(:,i),value_s,value1_s(:,i),count_s] = softmax(n,K,t,reward);
[action_r(:,i),value_r,value1_r(:,i),count_r]=rein(n,K,reward,a,b);
[action_u(:,i),value_u,value1_u(:,i),count_u]=ucb(n,K,reward);
[action_t(:,i),value_t,value1_t(:,i),count_t]=ucb_tune(n,K,reward);
[action_h(:,i),value_h,value1_h(:,i),count_h]=Exp3H(n,K,reward);
[action_o(:,i),value_o,value1_o(:,i),count_o]=omd(n,K,reward);
g_val(:,i)=cacl_ave(value_g,n);g_hit(:,i)=cacl_hit(Expectedvalue(:,i),count_g);
s_val(:,i)=cacl_ave(value_s,n);s_hit(:,i)=cacl_hit(Expectedvalue(:,i),count_s);
r_val(:,i)=cacl_ave(value_r,n);r_hit(:,i)=cacl_hit(Expectedvalue(:,i),count_r);
u_val(:,i)=cacl_ave(value_u,n);u_hit(:,i)=cacl_hit(Expectedvalue(:,i),count_u);
t_val(:,i)=cacl_ave(value_t,n);t_hit(:,i)=cacl_hit(Expectedvalue(:,i),count_t);
h_val(:,i)=cacl_ave(value_h,n);h_hit(:,i)=cacl_hit(Expectedvalue(:,i),count_h);
o_val(:,i)=cacl_ave(value_o,n);o_hit(:,i)=cacl_hit(Expectedvalue(:,i),count_o);
end
hold on;
draw_per(n,repeat,Expectedvalue,action_g,'b');
draw_per(n,repeat,Expectedvalue,action_s,'r');
draw_per(n,repeat,Expectedvalue,action_r,'g');
draw_per(n,repeat,Expectedvalue,action_u,'y');
draw_per(n,repeat,Expectedvalue,action_t,'m');
draw_per(n,repeat,Expectedvalue,action_h,'c');
draw_per(n,repeat,Expectedvalue,action_o,'k');
legend('greedy','softmax','rein','ucb','tune','exp','omd','location','NorthWest');
title('Optimal hit percent','fontsize',12);
xlabel('time horizon');
figure(2)
hold on;
draw_reg(n,repeat,Expectedvalue,value1_g,'b');
draw_reg(n,repeat,Expectedvalue,value1_s,'r');
draw_reg(n,repeat,Expectedvalue,value1_r,'g');
draw_reg(n,repeat,Expectedvalue,value1_u,'y');
draw_reg(n,repeat,Expectedvalue,value1_t,'m');
draw_reg(n,repeat,Expectedvalue,value1_h,'c');
draw_reg(n,repeat,Expectedvalue,value1_o,'k');
legend('greedy','softmax','rein','ucb','tune','exp','omd','location','NorthEast');
axis([0 1000 0 1]);
title('Regret each turn','fontsize',12);
xlabel('time horizon');








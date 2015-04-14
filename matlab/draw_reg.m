function draw_reg(n,repeat,expected,value,c)
% this function is use to to draw regret
reg = cacl_reg(n,repeat,value,expected);
plot(1:n,reg,c,'linewidth',2);hold on

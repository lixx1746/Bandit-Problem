function draw_per(n,repeat,expected,action,c)
% this function is use to to draw pulling number
per = cacl_optimalhit(n,repeat,action,expected);
plot(1:n,per,c,'linewidth',2)

function reg = cacl_reg(n,repeat,value1,expected)
% this fuction used to caculate regret
reg = zeros(n,1);
for i = 1:n
    temp = max(expected);
    reg(i) = sum(i*temp-sum(value1(1:i,:)))./(i*repeat);
end
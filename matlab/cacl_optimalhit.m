function per = cacl_optimalhit(n,repeat,action,expected)
% this fuction used to optimal pulling percent
per = zeros(n,1);
for i = 1: n
    [a,index] = max(expected);
    temp = (action(1:i,:) == repmat(index,i,1));
    per(i) = sum(sum(temp))./(i*repeat);
end
% Gradient Descent
% 最速下降法 / 梯度下降法
% 依赖函数：f_d_dd.m
clear;
clc;
x = [0,0];
error = 1e-3;
syms r;
fval = zeros(1,100); % 记录所有的函数值
f_error = zeros(1,100); % 记录所有的偏差值
format short
for i = 1:100
    [f,s,~] = f_d_dd(x);
    s = -s'; % 取负梯度方向，f_d_dd.m中一阶导数为列向量，需要转置
%     dfr = diff(f_d_dd(x + r*s))
%     r_solve = solve(dfr,r)
    r_solve = mymin(x,s,@f_d_dd);
    x = x + r_solve*s;
%     fprintf('\n');
    f_new = f_d_dd(x);
    fval(i) = f_new;
    f_error(i) = abs((f_new-f)/f);
    if f_error(i) < error
        break;
    end
end
x = eval(x); %符号转数值
f_new = eval(f_new); %符号转数值
fprintf('最优解为：x=[%.4f,%.4f]\n',x(1),x(2));
fprintf('迭代次数为：i=%d\n',i);
fprintf('最小值为：fmin=%.4f\n',f_new);
fprintf('函数值相对上次偏差为：%d\n',f_error(i));
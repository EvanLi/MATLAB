% Newton's method / Newton–Raphson method
% 牛顿法 / 牛顿-拉夫逊法
% 依赖函数：f_d_dd.m
% format long;
format short;
clear;
clc;
x = [0,0]; % x输入列向量
for i = 1:100
    [~,g,J] = f_d_dd(x);
    x = x' - J\g;  %x = x'-inv(J)*g,g为列向量
    [f,g,J] = f_d_dd(x);
    if abs(g(1)) < eps && abs(g(2)) < eps
        break
    end
end
f_new = eval(f);
x = eval(x);
fprintf('最优解为：x=[%.4f,%.4f]\n',x(1),x(2));
fprintf('迭代次数为：i=%d\n',i);
fprintf('最小值为：fmin=%.4f\n',f_new);
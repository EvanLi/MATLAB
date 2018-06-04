% Coordinate Rotation Method
% 坐标轮换法
% 依赖函数：f_d_dd.m
clear;
clc;
format short;
x = [0,0];
e = 0.01; %试探长度
error = 1e-3; % 终止值
s1 = [1,0]; %搜索方向
s2 = [0,1];
syms r;
fval = zeros(1,100); % 记录所有的函数值
f_error = zeros(1,100); % 记录所有的偏差值
for i = 1:100
    if mod(i,2) == 1
        s = s1;
    else
        s = s2;
    end
    f = f_d_dd(x);
    x1 = x + e*s;
    f1 = f_d_dd(x1);
    x2 = x - e*s;
    f2 = f_d_dd(x2);
    if f1 < f
        dfr = diff(f_d_dd(x + r*s));
% 		r_solve = solve(dfr,r);
        r_solve = mymin(x,s,@f_d_dd);
    	x = x + r_solve*s;
        fval(i) = f_d_dd(x);
%         disp('取s');
    elseif f2 < f
        s = -s;
        dfr = diff(f_d_dd(x + r*s));
% 		r_solve = solve(dfr,r);
        r_solve = mymin(x,s,@f_d_dd);
    	x = x + r_solve*s;
        fval(i) = f_d_dd(x);
%         disp('取-s');
    else
        s = 0;
        fval(i) = f_d_dd(x);
    end
    f_new = f_d_dd(x);
    f_error(i) = abs((f_new-f)/f);
    if f_error(i) < error
        break;
    end
end
fprintf('最优解为：x=[%.4f,%.4f]\n',x(1),x(2));
fprintf('迭代次数为：i=%d\n',i);
fprintf('最小值为：fmin=%.4f\n',f_new);
fprintf('函数值相对上次偏差为：%.4f\n',f_error(i));
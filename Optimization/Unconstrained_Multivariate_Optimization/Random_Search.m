% Random Search
% 随机走步法
% 依赖函数 f_d_dd.m
clear;
clc;
x = [0,0]';
delta = 0.1; %步长
error = 1e-3;
for i = 1:1000
	while 1
	    r0 = -1 + 2*rand(2,1);
	    R = sqrt(r0'*r0);
	    if R < 1 || R ==1
	        r = r0;
	        break;
	    end
	end
	f = f_d_dd(x);
	u = r/R;
	x_new = x + delta.*u;
	f_new = f_d_dd(x_new);
	if f_new < f
	    x = x_new;
%         fprintf('生效轮%d\n',i);
%         pause;
    end
    f_error = abs((f_new-f)/f);
    if f_error < error
        break;
    end
%     fprintf('第%d轮\n',i);
end
fprintf('步长：%f\n',delta);
fprintf('相对偏差限值：%f\n',error);
fprintf('最优解为：x=[%f,%f]\n',x(1),x(2));
fprintf('迭代次数为：i=%d\n',i);
fprintf('最小值为：fmin=%f\n',f_new);
fprintf('函数值相对上次偏差为：%f\n',f_error);
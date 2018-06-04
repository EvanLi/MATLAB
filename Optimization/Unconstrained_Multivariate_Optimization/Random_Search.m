% Random Search
% ����߲���
% �������� f_d_dd.m
clear;
clc;
x = [0,0]';
delta = 0.1; %����
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
%         fprintf('��Ч��%d\n',i);
%         pause;
    end
    f_error = abs((f_new-f)/f);
    if f_error < error
        break;
    end
%     fprintf('��%d��\n',i);
end
fprintf('������%f\n',delta);
fprintf('���ƫ����ֵ��%f\n',error);
fprintf('���Ž�Ϊ��x=[%f,%f]\n',x(1),x(2));
fprintf('��������Ϊ��i=%d\n',i);
fprintf('��СֵΪ��fmin=%f\n',f_new);
fprintf('����ֵ����ϴ�ƫ��Ϊ��%f\n',f_error);
% Coordinate Rotation Method
% �����ֻ���
% ����������f_d_dd.m
clear;
clc;
format short;
x = [0,0];
e = 0.01; %��̽����
error = 1e-3; % ��ֵֹ
s1 = [1,0]; %��������
s2 = [0,1];
syms r;
fval = zeros(1,100); % ��¼���еĺ���ֵ
f_error = zeros(1,100); % ��¼���е�ƫ��ֵ
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
%         disp('ȡs');
    elseif f2 < f
        s = -s;
        dfr = diff(f_d_dd(x + r*s));
% 		r_solve = solve(dfr,r);
        r_solve = mymin(x,s,@f_d_dd);
    	x = x + r_solve*s;
        fval(i) = f_d_dd(x);
%         disp('ȡ-s');
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
fprintf('���Ž�Ϊ��x=[%.4f,%.4f]\n',x(1),x(2));
fprintf('��������Ϊ��i=%d\n',i);
fprintf('��СֵΪ��fmin=%.4f\n',f_new);
fprintf('����ֵ����ϴ�ƫ��Ϊ��%.4f\n',f_error(i));
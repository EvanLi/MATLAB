% Gradient Descent
% �����½��� / �ݶ��½���
% ����������f_d_dd.m
clear;
clc;
x = [0,0];
error = 1e-3;
syms r;
fval = zeros(1,100); % ��¼���еĺ���ֵ
f_error = zeros(1,100); % ��¼���е�ƫ��ֵ
format short
for i = 1:100
    [f,s,~] = f_d_dd(x);
    s = -s'; % ȡ���ݶȷ���f_d_dd.m��һ�׵���Ϊ����������Ҫת��
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
x = eval(x); %����ת��ֵ
f_new = eval(f_new); %����ת��ֵ
fprintf('���Ž�Ϊ��x=[%.4f,%.4f]\n',x(1),x(2));
fprintf('��������Ϊ��i=%d\n',i);
fprintf('��СֵΪ��fmin=%.4f\n',f_new);
fprintf('����ֵ����ϴ�ƫ��Ϊ��%d\n',f_error(i));
% Newton's method / Newton�CRaphson method
% ţ�ٷ� / ţ��-����ѷ��
% ����������f_d_dd.m
% format long;
format short;
clear;
clc;
x = [0,0]; % x����������
for i = 1:100
    [~,g,J] = f_d_dd(x);
    x = x' - J\g;  %x = x'-inv(J)*g,gΪ������
    [f,g,J] = f_d_dd(x);
    if abs(g(1)) < eps && abs(g(2)) < eps
        break
    end
end
f_new = eval(f);
x = eval(x);
fprintf('���Ž�Ϊ��x=[%.4f,%.4f]\n',x(1),x(2));
fprintf('��������Ϊ��i=%d\n',i);
fprintf('��СֵΪ��fmin=%.4f\n',f_new);
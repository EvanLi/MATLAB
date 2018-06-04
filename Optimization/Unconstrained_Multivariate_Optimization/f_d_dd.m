function varargout=f_d_dd(x)
% Usage:
% [f,df,ddf] = f_d_dd(x)
% ����x=[a,b],���㺯��ֵf��һ�׵���ֵdf = [c,d]'(�������������׵���ֵddf������
%{
example:
[a,b,c]=f_d_dd([0,0])
a =
     0
b =
     1
    -1
c =
     4     2
     2     2
%}
%% ���庯��
syms x1 x2
% f=100*x1^4-250*x1^2*x2+x1^2-2*x1+80*x2^2+1; % Question
f = x1-x2+2*x1^2+2*x1*x2+x2^2; % Test question
%% ���ű�����
df1=diff(f,x1);
df2 = diff(f,x2);
df11 = diff(df1,x1);
df12 = diff(df1,x2);
df21 = diff(df2,x1);
df22 = diff(df2,x2);
%% �������x��������ֵ
f = subs(f,{x1,x2},{x(1),x(2)}); % ���㺯��ֵ
df = sym(zeros(2,1)); %��ʼ������ֵdfΪ������ Define B to be an array of sym objects before your for loop. B = sym(zeros(4, 1));
df(1,1)=subs(df1,{x1,x2},{x(1),x(2)}); % ����һ�׵���ֵ
% df1 = 2*x1 - 500*x1*x2 + 400*x1^3 - 2;
df(2,1)=subs(df2,{x1,x2},{x(1),x(2)});
% df2 = - 250*x1^2 + 160*x2;
ddf(1,1) = subs(df11,{x1,x2},{x(1),x(2)}); % ������׵���ֵ
ddf(1,2) = subs(df12,{x1,x2},{x(1),x(2)});
ddf(2,1) = subs(df21,{x1,x2},{x(1),x(2)});
ddf(2,2) = subs(df22,{x1,x2},{x(1),x(2)});
varargout{1} = f;
varargout{2} = df;
varargout{3} = ddf;

function g=use_varargin(a,b,varargin)  
% Variable-length input argument list
% ���������Ŀ�ɱ�
if nargin==2  
% ��������Ӻ�
    g=a+b;  
elseif nargin==3
% ��������Ӻ�
    g=a+b+varargin{1}; 
else
% �����������뱨��
    disp('ERROR!Too Many Input');
end  
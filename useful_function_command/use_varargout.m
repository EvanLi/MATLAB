function varargout=use_varargout(a,b,varargin)  
% Variable-length output argument list
% �������������Ŀ���ɱ�
if nargin==2  
    % �������������ʱ����һ�����Ϊ�ӷ����ڶ������Ϊ�˷�
    varargout{1}=a+b;  
    varargout{2}=a*b;
elseif nargin==3  
    % �������������ʱ����һ�����Ϊ�ӷ����ڶ������Ϊ�˷�
    varargout{1}=a+b;  
    varargout{2}=a*b*varargin{1};  
end  
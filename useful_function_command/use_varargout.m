function varargout=use_varargout(a,b,varargin)  
% Variable-length output argument list
% 输入输出参数数目均可变
if nargin==2  
    % 有两个输入参数时，第一个输出为加法，第二个输出为乘法
    varargout{1}=a+b;  
    varargout{2}=a*b;
elseif nargin==3  
    % 有三个输入参数时，第一个输出为加法，第二个输出为乘法
    varargout{1}=a+b;  
    varargout{2}=a*b*varargin{1};  
end  
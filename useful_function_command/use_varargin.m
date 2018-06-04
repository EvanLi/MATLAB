function g=use_varargin(a,b,varargin)  
% Variable-length input argument list
% 输入参数数目可变
if nargin==2  
% 两个输入加和
    g=a+b;  
elseif nargin==3
% 三个输入加和
    g=a+b+varargin{1}; 
else
% 超过三个输入报错
    disp('ERROR!Too Many Input');
end  
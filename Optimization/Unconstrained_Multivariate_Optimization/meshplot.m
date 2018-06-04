% 原函数三维图像动图制作 z =100.*x.^4-250.*x.^2.*y+x.^2-2.*x+80.*y.^2+1
%% 计算
clc;
clear;
% xa = -30:0.1:30;
% ya = 400:0.1:600;
% 不同区间范围，图像显示不同
% xa = -5:0.1:5;
% ya = -20:0.1:20;

% xa = -5:0.01:5;
% ya = -50:0.1:80;

xa = -2:0.01:2;
ya = -5:0.1:8;

[x,y] = meshgrid(xa,ya);
z =100.*x.^4-250.*x.^2.*y+x.^2-2.*x+80.*y.^2+1; % 函数形式
%% 作图
mesh(x,y,z);
xlabel('X轴');
ylabel('Y轴');
zlabel('Z轴');
title('函数三维图像');
grid on %打开网格
view(-100,30); % 不同角度看
% view(-30,30);
% view(-90,90); %俯视图
%% 动图制作
pic_num = 1;
filename = strcat('.\img\meshplot',datestr(now,30),'.gif');
% for i=-30:3:330
for i=-120:2:240
    %view(a,b):a是角度，b是仰视角
    view(i,30);
%     pause(0.1);
    F=getframe(gcf);
    I=frame2im(F);
    [I,map]=rgb2ind(I,256);
    if pic_num == 1
        imwrite(I,map,filename,'gif', 'Loopcount',inf,'DelayTime',0.2);
    else
        imwrite(I,map,filename,'gif','WriteMode','append','DelayTime',0.2);
    end
    pic_num = pic_num + 1;
end

% ԭ������άͼ��ͼ���� z =100.*x.^4-250.*x.^2.*y+x.^2-2.*x+80.*y.^2+1
%% ����
clc;
clear;
% xa = -30:0.1:30;
% ya = 400:0.1:600;
% ��ͬ���䷶Χ��ͼ����ʾ��ͬ
% xa = -5:0.1:5;
% ya = -20:0.1:20;

% xa = -5:0.01:5;
% ya = -50:0.1:80;

xa = -2:0.01:2;
ya = -5:0.1:8;

[x,y] = meshgrid(xa,ya);
z =100.*x.^4-250.*x.^2.*y+x.^2-2.*x+80.*y.^2+1; % ������ʽ
%% ��ͼ
mesh(x,y,z);
xlabel('X��');
ylabel('Y��');
zlabel('Z��');
title('������άͼ��');
grid on %������
view(-100,30); % ��ͬ�Ƕȿ�
% view(-30,30);
% view(-90,90); %����ͼ
%% ��ͼ����
pic_num = 1;
filename = strcat('.\img\meshplot',datestr(now,30),'.gif');
% for i=-30:3:330
for i=-120:2:240
    %view(a,b):a�ǽǶȣ�b�����ӽ�
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

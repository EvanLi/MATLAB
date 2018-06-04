%{ 
简单框架：
clc
clear
pic_num = 1;
for ***************************
    plot(fig(i));
    F=getframe(gcf);
    I=frame2im(F);
    [I,map]=rgb2ind(I,256);

    if pic_num == 1
    imwrite(I,map,'test.gif','gif','Loopcount',inf,'DelayTime',0.2);

    else
    imwrite(I,map,'test.gif','gif','WriteMode','append','DelayTime',0.2);

    end

    pic_num = pic_num + 1;
end
%}
clc;
clear;
pic_num = 1;
filename = strcat('.\img\gif_plot_test',datestr(now,30),'.gif'); % .\img 表示保存在Matlab当前打开的目录下的img文件夹下
for epsilon = 0.01:-0.001:0.005
    syms x;
    w = -tanh(x/(2*epsilon));
    figure(1);
    ezplot(w);
    axis([-0.05,0.05 -1.5 1.5])
    drawnow;
    
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
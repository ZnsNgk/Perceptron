%�����֪���������β�����ݼ���ǰ100����Ϊѵ����������ÿ�����ݰ���4������
clear all
close all
clc
%�������ݼ���leibie.matΪ�������ݵ����tezheng.matΪ�������ݵ��ĸ�������ʵ����ֻѡȡǰ���������������ͼ
load('leibie.mat')
load('tezheng.mat')
tezheng = tezheng(:,1:2);
%����ѧϰ��
lr = 0.1;
%Y=W*X+b
[num,m] = size(tezheng);
X = tezheng;
Y = leibie;
W = zeros(m,1);
b = 0;
step  = 1;
for i = 1 : num
    if Y(i) == 1
        plot(tezheng(i,1),tezheng(i,2),'rx');
    end
    if Y(i) == -1
        plot(tezheng(i,1),tezheng(i,2),'b*');
    end
    hold on;
end
while(1)
    flag = true;
    for i = 1:num
        y = X(i,:) * W + b;
        if Y(i) * y <= 0
            flag = false;
            W = W + lr * Y(i) * X(i,:)';
            b = b + lr * Y(i);
        end
    end
    if flag == true
        break;
    end
    step = step + 1;
end
W
b
step
%��ͼ
for i = 1 : num
    if Y(i) == 1
        plot(tezheng(i,1),tezheng(i,2),'rx');
    end
    if Y(i) == -1
        plot(tezheng(i,1),tezheng(i,2),'b*');
    end
    hold on;
end
xline = linspace(min(tezheng(:,1)),max(tezheng(:,1)),50);
yline = -W(1)/W(2) * xline - b/W(2);
plot(xline,yline);
clear all;close all;
X = imread('street.jpg');
tol = [0.001 0.004 0.015 0.045];

global count;
global countdrop;
count = 0;
countdrop = 0;

figure;
subplot(2,2,1)
[Y1 d1] = Compress(X,tol(1));
s = sprintf('tol:%.4f drop rate:%.4f',tol(1),d1);
title(s)

count = 0;
countdrop = 0;
subplot(2,2,2)
[Y2 d2] = Compress(X,tol(2));
s = sprintf('tol:%.4f drop rate:%.4f',tol(2),d2);
title(s)

count = 0;
countdrop = 0;
subplot(2,2,3)
[Y3 d3] = Compress(X,tol(3));
s = sprintf('tol:%.4f drop rate:%.4f',tol(3),d3);
title(s)

count = 0;
countdrop = 0;
subplot(2,2,4)
[Y4 d4] = Compress(X,tol(4));
s = sprintf('tol:%.4f drop rate:%.4f',tol(4),d4);
title(s)

hold on;

figure;
x = [d1 d2 d3 d4];
y = [sqrt(mean2((Y1-X).^2)/(mean2(X).^2))
    sqrt(mean2((Y2-X).^2)/(mean2(X).^2))
    sqrt(mean2((Y3-X).^2)/(mean2(X).^2))
    sqrt(mean2((Y4-X).^2)/(mean2(X).^2))];
plot(x,y)
title('NMS')

hold on;
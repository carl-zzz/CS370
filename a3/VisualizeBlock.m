clear all;
close all;

I = imread('street.jpg');
I = im2double(I);
I = I(1:16,1:16);
F = fft2(I);
absF = abs(F);

figure;
bar3(absF,'white');
title('(a1)Original 16*16');
hold on;

figure;
absF(1,1) = 0;
bar3(absF,'white');
title('(a2)16*16 with first0');
hold on;
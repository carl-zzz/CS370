clear all;close all;
load('train_bird.mat')
%soundsc(y,Fs);

Y = fft(y);
L = length(y);
t = 0:1/Fs:(L-1)/Fs;

figure;
stem(t,y);
title('Original Signal');
xlabel('Time');
hold on;

figure;
stem(t,abs(Y));
title('Original Mag DFT');
xlabel('k(Time)');
hold on;

%=============high=============

high = Y;
p = 3000;
for i=1:L,
    if i<p || i>L-p
        high(i) = 0;
    end
end
figure;
stem(t,real(high));
%soundsc(real(ifft(low)),Fs)
title('High Pass Filter');
xlabel('Time');
hold on;

figure;
stem(t,abs(real(high)));
title('Mag High Pass Filter');
xlabel('Time');
hold on;

%=============low=============

low = Y;
p = 3000;
for i=1:L,
    if i>p && i<L-p
        low(i) = 0;
    end
end
figure;
stem(t,real(low));
%soundsc(real(ifft(low)),Fs)
title('Low Pass Filter');
xlabel('Time');
hold on;

figure;
stem(t,abs(real(low)));
title('Mag Low Pass Filter');
xlabel('Time');
hold on;
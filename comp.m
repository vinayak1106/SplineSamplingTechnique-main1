clear all;
close all;
clc
FS = 100;
t = 0:1/FS:2;

[p,FS] = audioread("triangle.wav");

subplot(3,1,1);
plot(p);
title('Message Signal')
hold on;
y =0;
delta = 0.2;
for i=2:length(p);
    if p(i)>y(i-1);
        y(i) = y(i-1) + delta;
    else
        y(i) = y(i-1) -delta;

    end
end
stairs(y);

for i = 1:p
    if p(i) == 0;
        y(i+1) = y(i) - delta;
    else
        y(i) = 1; y(i+1) = y(i) + delta;
    end;
end;
subplot(3,1,2)
plot(y, 'c');
title('Original Signal');
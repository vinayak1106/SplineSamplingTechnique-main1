clc;
clear all;

T = 10*(1/50);

fs = 1000;
t = 0:1/fs:2;

x = sawtooth(2*pi*50*t);
[y,fs] = audioread("triangle.wav");


subplot(2,1,1);
plot(y)
title('Original Signal')

dif = diff(y);

x = size(dif);

data = zeros(2, 2625)

j = 1;
for i = 1:x(1)-1
    A = dif(i);
    B = dif(i+1);
    tolerance = 1e-10; 
if ( abs( A - B ) >= tolerance )
        data(1,j) = A;
        data(2,j) = i;
        j = j+1;
    end;
end;

Xcor = zeros(1, j-1);
Ycor = zeros(1, j-1);
for i = 1:j-1
    Xcor(1,i) = data(1,i)
    Ycor(1,i) = data(2,i)
end;

subplot(2,1,2);
plot(Ycor, Xcor);
title('Signal from our Data')


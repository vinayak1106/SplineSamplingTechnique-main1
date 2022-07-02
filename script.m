clc;
clear all;

T = 10*(1/50);

fs = 1000;
t = 0:1/fs:2;

x = sawtooth(2*pi*50*t);
[y,fs] = audioread("triangle.wav");

subplot(3,1,1);
plot(x)

dif = diff(x);

subplot(3,1,2);
plot(dif);

x = size(dif);

data = zeros(2, 10000)

j = 1;
for i = 1:x(2)-1
    A = dif(1, i);
    B = dif(1, i+1);
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

subplot(3,1,3);
plot(Ycor, Xcor);


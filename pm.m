clc;
close all;

fs=10000;
dt=1/fs;
t=0:dt:3;
kp=5;

fc=10;
Ac=10;
ct=Ac*cos(2*pi*fc*t);
subplot(3,1,1);
plot(t,ct),xlabel('time'),ylabel('Amplitude'),title('Carrier Signal)');

fm=1;
Am=1;
mt=Am*cos(2*pi*fm*t);
subplot(3,1,2);
plot(t,mt),xlabel('time'),ylabel('Amplitude'),title('Message Signal)');

st=Ac*cos(2*pi*fc*t+kp*mt);
subplot(3,1,3);
plot(t,st),xlabel('time'),ylabel('Amplitude'),title('PM Signal ');
clc;
close all;

fs=10000;
dt=1/fs;
t=0:dt:3;
M=20;

fc=30;
Ac=10;
ct=Ac*cos(2*pi*fc*t);

Fm=1;
Am=1;
mt=Am*cos(2*pi*Fm*t);
subplot(4,1,1);
plot(t,mt),xlabel('Time'),ylabel('Amplitude'),title('Message Signal');
subplot(4,1,2);
plot(t,ct),xlabel('Time'),ylabel('Amplitude'),title('Carrier Signal');


st=Ac*cos(2*pi*fc*t+M*sin(2*pi*Fm*t));
subplot(4,1,3);
plot(t,st),xlabel('Time'),ylabel('Amplitude'),title('FM Signal');

dm=hilbert(st).*exp(-1i*2*pi*fc*t);
z=unwrap(angle(dm));
subplot(4,1,4);
plot(t,z),xlabel('Time'),ylabel('Amplitude'),title('FM Demodulated Signal');

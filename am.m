clc;
close all;


fm=100;
Am=10;
fc=1000;
Ac=30;
ka=.05;
Tm=1/fm;
t=0:Tm/1000:6*Tm;
m=Am*cos(2*pi*fm*t);
subplot(4,1,1);
plot(t,m),xlabel('Time'),ylabel('m(t)'),title('Message Signal ');

c=Ac*cos(2*pi*fc*t);
subplot(4,1,2);
plot(t,c),xlabel('Time'),ylabel('c(t)'),title('Carrier signal ');

ym=Ac*(1+ka.*Am*cos(2*pi*fm*t)).*cos(2*pi*fc*t);
subplot(4,1,3);
plot(t,ym),xlabel('Time'),ylabel('ym(t)'),title('Amplitude Modulated Signal ');

sdm=ym.*c;
[b,a]=butter(5,2*pi*(fm/fc),'low');
z=filter(b,a,sdm);
subplot(4,1,4);
plot(t,z),xlabel('Time'),ylabel('z(t)'),title('Demodulated Signal ');


clc;
close all;
fm=2.5;
fc=10;
fs=1000;
t=0:1/fs:5;
m=0.5*square(2*pi*fm*t)+0.5;
c=sin(2*pi*fc*t);
z=m.*c;
dm=z.*c;
[b,a]=butter(5,2*pi*(fm/fs),'low');
y=filter(b,a,dm);
for i=1:length(y)
    if(y(i)>=0.25)
        y(i)=1;
    else
        y(i)=0;
    end
end
subplot(4,1,1);
plot(t,c),xlabel('time'),ylabel('Amplitude'),title('Carrier Signal ');
subplot(4,1,2);
plot(t,m),xlabel('time'),ylabel('Amplitude'),title('Message Signal ');
subplot(4,1,3);
plot(t,z),xlabel('time'),ylabel('Amplitude'),title('ASK Signal');
subplot(4,1,4);
plot(t,y),xlabel('time'),ylabel('Amplitude'),title('Demodulated Signal');

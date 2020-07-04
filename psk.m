clc;
close all;

fm=2.5;
fc=10;
fs=1000;
t=0:1/fs:5;
m=0.5*square(2*pi*fm*t);
c=sin(2*pi*fc*t);
z=m.*c;
dm=z.*c;
[b,a]=butter(5,2*pi*(fm/fs),'low');
y=filter(b,a,dm);

for i=1:length(y)
	if(y(i)>=0.01)
	    y(i)=1;
	else
		y(i)=0;
	end
end

subplot(411);
plot(t,c),xlabel('Time'),ylabel('Amplitude'),title('Carrier Signal');

subplot(412);
plot(t,m),xlabel('Time'),ylabel('Amplitude'),title('Message Signal');

subplot(413);
plot(t,z),xlabel('Time'),ylabel('Amplitude'),title('PSK Signal');

subplot(414);
plot(t,y),xlabel('Time'),ylabel('Amplitude'),title('Demodulated Signal');

	
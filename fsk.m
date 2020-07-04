clc;
close all;
fm=2.5;
fc1=25;
fc2= 10;
fs=1000;
t=0:1/fs:5;
m=0.5*square(2*pi*fm*t)+ 0.5;
c1= sin(2*pi*fc1*t);
c2= sin(2*pi*fc2*t);
for i=1:length(m)
    if (m(i)==1)
        mod(i)= c1(i);
    else
        mod(i)= c2(i);
    end
end
[b1,a1]= butter(5, 2*pi*fm/fs, 'low');
[b2,a2]= butter(5, 2*pi*fm/fs, 'low');
z1= mod.*c1;
z2= mod.*c2;
z3= filter(b1, a1, z1);
z4= filter(b2, a2, z2);
z5= z4-z3;
for i=1:length(z5)
    if(z5(i)>=0.01)
        z5(i)=1;
    else
        z5(i)=0;
    end
end

subplot(5,1,1);
plot(t,m),xlabel('time'),ylabel('Amplitude'),title('Message Signal ');
subplot(5,1,2);
plot(t,c1),xlabel('time'),ylabel('Amplitude'),title('Carrier Signal 1 ');
subplot(5,1,3);
plot(t,c2),xlabel('time'),ylabel('Amplitude'),title('Carrier Signal 2 ');
subplot(5,1,4);
plot(t,mod),xlabel('time'),ylabel('Amplitude'),title('FSK Signal ');
subplot(5,1,5);
plot(t,z5),xlabel('time'),ylabel('Amplitude'),title('Demodulated Signal ');

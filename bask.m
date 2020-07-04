clc;
clear all;

t=0:0.001:1;            %Sampling Interval time 0 ? t ? 1 
x=3.*sin(2*pi*8*t);    %Carrier Sine wave A sin(2?fct) fc:frequency of carrier 
u=3/2.*square(2*pi*4*t)+(3/2); %Square wave message with peak of amplitude A and and peak of zero (binary data) 
v=x.*u;      %Modulation Process by multiply message with carrier v(t) = A u(t) sin 2?fct 
%Plot Carrier Signal 
figure('name','BASK MODULATION','numbertitle','off'); 
subplot(3,1,1); 
plot(t,x,'c','linewidth',2); 
xlabel('Time'); 
ylabel('Amplitude'); 
title('Carrier Signal'); 
grid on; 
%Plot Message Singal 
subplot(3,1,2); 
plot(t,u,'r','linewidth',2); 
xlabel('Time'); 
ylabel('Amplitude'); 
title('Square Pulses'); 
axis([0 1 0 4]); 
grid on; 
%Plot Modulated Signal 
subplot(3,1,3); 
plot(t,v,'linewidth',2); 
xlabel('Time'); 
ylabel('Amplitude'); 
title('BASK Signal'); 
grid on; 

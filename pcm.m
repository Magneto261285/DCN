clc;
close all;
t=0:0.0001:0.5;
fm=5;
m=10*sin(2*pi*fm*t);
subplot(5,1,1), plot(t,m), title('Message Signal'), xlabel('Time(s)'), 
ylabel('Amplitude(v)');
s= 5.*(1+square(2*pi*400*t,10));
subplot(5,1,2), plot(t,s), title('Square Signal'), xlabel('Time(s)'), 
ylabel('Amplitude(v)'), axis([0 0.5 -0.2 2]);
x=m.*s;
partition= -10:0.1:10;
index= quantiz(x,partition);
subplot(5,1,3), plot(t,x), title('Sampled Signal'), xlabel('Time(s)'), 
ylabel('Amplitude(v)');
subplot(5,1,4), plot(t,index), title('Quantized Signal'), xlabel('Time(s)'), 
ylabel('Amplitude(v)');
p= de2bi(index,8);
l1=length(index);
k=1;

for i=1:l1
    for j= 1:8
        z(k)= p(i,j);
        k= k+1;
        j=j+1;
    end
i=i+1;
end

subplot(5,1,5), stairs(z), title('Encoded Signal'), xlabel('Time(s)');
ylabel('Amplitude(v)'), axis([0 100 -2 3]);
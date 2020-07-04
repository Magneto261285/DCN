clc;
clear all;

N=10;
disp('Input Message Sequence: ');
n=randi([0 1],1,N);

%Bit to symbol mapping

for ii=1:N
    if n(ii)==1;
	    nn(ii)=1;
	else
		nn(ii)=0;
	end	
end	

%Pulse Shaping 
S=100;
i=1;
t=0:1/S:N;
for j=1:length(t)
	if t(j)<=i;
		m(j)=nn(i);
	else
		m(j)=nn(i);
		i=i+1;
	end
end

subplot(411);
plot(t,m,'k-');
xlabel('Time');
ylabel('Amplitude');
title('NRZ Polar Signal');

c=cos(2*pi*2*t);
subplot(412);
plot(t,c,'k-');
xlabel('Time');
ylabel('Amplitude');
title('Carrier Signal');


x=m.*c;
subplot(413);
plot(t,x,'k-');
xlabel('Time');
ylabel('Amplitude');
title('BPSK Signal');

%Coherant Detection and Reconstruction

y=x;
y1=y.*c;
subplot(414);
plot(t,y1,'k-');

%Integrator Output
int_op=[];

for ii=0:S:length(y1)-S;
 int_o=(1/S)*trapz(y1(ii+1:ii+S));
 int_op=[int_op int_o];
end

%Hard decision decoding
disp('Detected Bits:')
det=(round(int_op,1)>=0)

%BER Computation
ber=sum(n~=det)/N





	
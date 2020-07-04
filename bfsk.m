clc;
close all;
msg=round(rand(1,10));
data=[];
t=0:.01:.99;
c=cos(2*pi*10*t);%carrier signal & it's a matrix of length 1X100(bcoz for each t, there's a c).let fc=10hz
for i=1:10
    if msg(i)==0
        d=-1*ones(1,10);
    else
        d=ones(1,10);
    end
 data=[data d];   
end
subplot(311);
plot(data);axis([0 100 -1.5 1.5])
title('Digital data');
subplot(312)
plot(c);axis([0 100 -1.5 1.5])
title('Unmodulated carrier');
 vbfsk=[];
for i=1:100
vbfsk=[vbfsk cos(2*pi*10*t+(data(i)*2*pi*5*t))];
end

%disp(data);
disp(vbfsk);
subplot(313);
plot(vbfsk);axis([0 100 -1.5 1.5])
title('BFSK Signal');

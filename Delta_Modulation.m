clc;
clear all;

t=0:2*pi/100:2*pi;
del=0.95;
A=6;
x=A*sin(t);
plot(x)
hold on
y=[0];
xr=0;
for i=1:length(x)-1
    if xr(i)<=x(i)
        d=1;
        xr(i+1)=xr(i)+del;
    else
        d=0;
        xr(i+1)=xr(i)-del;
    end
    y=[y d];
    
end
stairs(xr)
hold off
MSE=sum((x-xr).^2)/length(x);

    

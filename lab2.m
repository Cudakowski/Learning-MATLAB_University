clear;clc;
n=1e5;%n=100;
a=1103515245;
b=12345;
m=2^31;
x=1;
for  i=2:n
    x(i)=mod(a*x(i-1)+b, m);
end
x=x/(m-1);
histogram(x,20)
plot(x(1:end-1),x(2:end),'.');
EX=.5;
eEX=mean(x);
errEX=log10((EX-eEX)^2);
DX=12^(-.5);
eDX=(sum((x-EX).^2)/n)^.5;
errDX=log10((DX-eDX)^2);
e2DX=(sum((x-eEX).^2)/(n-1))^.5;
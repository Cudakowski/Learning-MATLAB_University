clear;clc;

x1=-1;
x2=1;
x3=2;
x=-5:.1:5;h=.5;
k1=normpdf((x-x1)/h)/(3*h);
k2=normpdf((x-x2)/h)/(3*h);
k3=normpdf((x-x3)/h)/(3*h);
plot(x,[k1;k2;k3;k1+k2+k3])
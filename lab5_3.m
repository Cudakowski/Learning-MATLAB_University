clear;clc;

n=100;
m=3;
s=5;

k=[1.07,1.14,1.22,1.36,1.63];

N=1e3;
res=0;

for j=1:N
    x=icdf('T',rand(1,n),50);
    x=sort(x);
    F=cdf('Normal',x,0,1);
    for i=1:n
        Fe(i)=sum(x<x(i))/n;
    end
    D=max(abs(F-Fe));
    res=res+(D*n^.5<k);
end
plot(x,F,x,Fe);
res/N
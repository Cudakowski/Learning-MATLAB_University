clear;clc;

n=100;
m=3;
s=5;

k=[1.07,1.14,1.22,1.36,1.63];

N=1e3;
res=0;
a=.05;
l=10;
%K=icdf('chi2',a,n-1)
for j=1:N
    x=icdf('Exp',rand(1,n),l);
    s2=var(x);
    D2=l^2;
    Stat=(n-1)*s2/D2;
    ql=icdf('chi2',a/2,n-1);
    qr=icdf('chi2',1-a/2,n-1);
end

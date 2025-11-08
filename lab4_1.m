clear;clc;

n=1e5;
n1=0.8*n;
n2=0.2*n;
m1=-1;
s1=2;
m2=3;
s2=1;

z=[randn(1,n1)*s1+m1,randn(1,n2)*s2+m2];
hst=histogram(z);
x=hst.BinEdges(1:end-1)+hst.BinWidth/2;
f=normpdf(x,m1,s1)*n1/n+normpdf(x,m2,s2)*n2/n;
% plot(x,f)
fh=hst.Values/(n*hst.BinWidth);
%bar(x,fh);
%hold on;
%plot(x,f,'LineWidth',2);
%hold off;
mse=mean((f-fh).^2);
h=1.06*std(z)*n^-.2;
for j=1:length(x)
    fk(j)=sum(normpdf((x(j)-z)/h))/(n*h);
end
%plot(x,f,x,fk);
F=normcdf(x,m1,s1)*n1/n+normcdf(x,m2,s2)*n2/n;
for j=1:length(x)
    Fk(j)=sum(normcdf((x(j)-z)/h))/n;
end
plot(x,F,x,Fk);
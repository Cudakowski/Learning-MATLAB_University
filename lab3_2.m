clear;clc;

n=100;
%a=rand*10-5;
%b=rand*10-5;
c=10000;
x=randn(1,n)*3+2;
%y=a*x+b+randn(1,n)*c;
%plot(x,y,'.');
%ea=sum((x-mean(x)).*(y-mean(y)))/sum((x-mean(x)).^2);
%eb=(mean(y)-ea*mean(x));
%plot(x,y,'.',x,ea*x+eb);
%mse=mean((y-ea*x-eb).^2);
%rmse=mse^.5;

x=sort(x);
M=6;
a=rand(1,M+1)*10-5;
y=sum(x'.^(0:M).*a,2)';
y=y+randn(1,n)*c;
plot(x,y,'.');
m=6;
G=zeros(m+1);
rho=zeros(m+1,1);
for i=0:m
    for j=0:m
        G(i+1,j+1)=sum(x.^(i+j));
    end
    rho(i+1)=sum(y.*x.^i);%w=polyfit(x,y,m) robi to samo, logfit też ale logarytmicznie
end
w=(G^-1*rho)';
ey=sum(x'.^(0:m).*w,2)';
plot(x,y,'.',x,ey);
rmse=mean((y-ey).^2)^.5;
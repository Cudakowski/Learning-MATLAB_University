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
mu=30;
sigma=20;
y=icdf('Normal',x,mu,sigma);
y=(y-mu)/sigma;
histogram(y,20);
plot(y(1:end-1),y(2:end),'.');
test=(x(1:end-1).^2+x(2:end).^2)<1;
wynik=mean(test)*4 %metoda orła i reszki Noimana
pi
clear;clc;
load fisheriris.mat; %WYW1 - meas i species

%d1=1;
%d2=2;
%plot(meas(:,d1),meas(:,d2),'x'); %WYW2 - jakieś dwie dane
%gscatter(meas(:,d1),meas(:,d2),species); %WYW3

%d1=1;
%d2=3;

%gscatter(meas(:,d1),meas(:,d2),species); %WYW4 - rozne wartosci d1 i d2

d1=1;
d2=3;
cls=findgroups(species);
%gscatter(meas(:,d1),meas(:,d2),cls); %WYW5 - z findgroups()

k=.2;%k=.8; - to przed wywolaniem 13
n=length(cls);
un=round(k*n);
tn=n-un;

uidx=randperm(n,un); %losujemy 120 wartości z 150
tidx=setdiff(1:150,uidx);
udata=meas(uidx,:);
tdata=meas(tidx,:);
ucls=cls(uidx);
tcls=cls(tidx);
gscatter(udata(:,d1),udata(:,d2),ucls); %WYW6
hold on;
plot(tdata(:,d1),tdata(:,d2),'kx'); %WYW6
hold off;

for i=1:3
    m(i,:)=mean(udata(ucls==i,:)); %3x4
    s(i,:)=std(udata(ucls==i,:));  %3x4
    Pc(i)=sum(ucls==i)/un; %1x3 %WYW7 - sprawdzić wymiary tych macierzy
end
for i=1:3
    rnk(:,i)=Pc(i)*mvnpdf(tdata,m(i,:),s(i,:)); %WYW8 - sprawdzić tą macierz
end
[v,bcls]=max(rnk,[],2);
%gscatter([udata(:,d1);tdata(:,d1)],[udata(:,d2);tdata(:,d2)],[ucls;bcls]);%WYW9
gscatter([udata(:,d1);tdata(:,d1)],[udata(:,d2);tdata(:,d2)],[ucls;bcls*10]);%WYW10
eff=mean(tcls==bcls);%WYW11 - jaka wydajnosc?

hold on;
plot(tdata(tcls~=bcls,d1),tdata(tcls~=bcls,d2),'ko','MarkerSize',10);%WYW12 zaznaczamy kulkami zle sklasyfikowane punkty
hold off; %WYW13 zmianiamy na poczatku k=.2;










% close all; clear all
% load fractaldata.mat
% test=xlsread('ds2','S','A1:IV1837');
% test=xlsread('ds2','V','A1:IV3221');
% test=xlsread('ds2','F','A1:IV388');
% test=xlsread('ds2','Q','A1:IV7');

%%MFDFA1
  
   j=0; 
 test=xlsread('ds2','Q','A1:IV7');
 for k=1:1:7
     r=1;
   s=30;
   cpy=s;
     sig=test(k,:);
     tf=isnan(sig(256));
      if(tf==1)
          continue;
      end
     while(s<=256)
      c=1;
    for i=r:1:s
         x(c)=sig(i);
         c=c+1;
    end
    r=((cpy/2)+r);
    s=(s+(cpy/2));
     j=j+1;     
   scmin=10;
scmax=15;
 scres=19;
exponents=linspace(log2(scmin),log2(scmax),scres);
scale=round(2.^exponents);
q=linspace(-5,5,101);
 m=1;

    
      [Hq1,tq1,hq1,Dq1,Fq1]=MFDFA1(x,scale,q,m,1);
 %plot(log2(scale),log2(Fq1))

f(1,j)=max(hq1)-min(hq1);%spectral width of multifractal curve
f(2,j)=max(hq1);% singularity exponent corresponding to extreme right end of spectral curve
f(3,j)=min(hq1);%singularity exponent corresponding to the extreme left end of spectral curve
f(4,j)=Hq1(q==2);%hurzt exponent for q=2
f(5,j)=abs(Dq1(hq1==min(hq1))-Dq1(hq1==max(hq1)));
f(6,j)=max(Dq1);
f(7,j)=Dq1(hq1==min(hq1));
f(8,j)=Dq1(hq1==max(hq1));
f(9,j)=(f(2,j)+f(3,j))/2;
f(10,j)=(f(7,j)+f(8,j))/2;

% f(11,j)=hq1(Dq1==max(Dq1));%singularity exponent corresponding to the maximum point of spectral curve
     end
     
 end

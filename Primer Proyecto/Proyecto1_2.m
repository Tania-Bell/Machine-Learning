clear all;
close all;
clc;
%% Parameters
%Number of particles
np=500;
num_v=18;
%Position
x=rand(np,num_v); %we increased the number of columns to match the variables we have
% initial vector added to x
vi=[5.3735	4.1663	4.0523	3.5319	5.6935	0.9357...
    5.4560	3.7837	3.5409	5.0060	5.0051	3.2320...
    4.6481	2.6083	2.9152	2.2800	6.0342	1.8042];
x=x+vi;
xLp=x;% we define our x
xgp=zeros(1,num_v); % we created a vector of ceros that matches the # of variables
%Initial performance
fxgp=100000000;%Initial global performance
fxLp= ones(np,1)*fxgp; % Initial local performance
%Speed
vx=zeros(np,num_v);
%Attraction factors
c1=.75;%.75;%Attraction to the global
c2=.75;%.75;%Atrraction to the local
a=100;
%% Iterative part
for k=1:1000
   %Fitness or Function
   fx=25*(x(:,1)+x(:,2)+x(:,3))+26*(x(:,4)+x(:,5))+24*(x(:,6)+x(:,7)+x(:,8)+x(:,9))+...
       23*(x(:,10)+x(:,11)+x(:,12)+x(:,13))+28*(x(:,14)+x(:,15)+x(:,16))+...
       30*(x(:,17)+x(:,18))+a*max(-x(:,1),0)+a*max(-x(:,2),0)+a*max(-x(:,3),0)+...
       a*max(-x(:,4),0)+a*max(-x(:,5),0)+a*max(-x(:,6),0)+a*max(-x(:,7),0)+...
       a*max(-x(:,8),0)+a*max(-x(:,9),0)+a*max(-x(:,10),0)+a*max(-x(:,11),0)+...
       a*max(-x(:,12),0)+a*max(-x(:,13),0)+a*max(-x(:,14),0)+a*max(-x(:,15),0)+...
       a*max(-x(:,16),0)+a*max(-x(:,17),0)+a*max(-x(:,18),0)+a*max(x(:,1)-6,0)+...
       a*max(x(:,2)-6,0)+a*max(x(:,3)-6,0)+a*max(x(:,4)-6,0)+a*max(x(:,5)-6,0)+...
       a*max(x(:,6)-4,0)+a*max(x(:,7)-8,0)+a*max(x(:,8)-4,0)+a*max(x(:,9)-4,0)+...
       a*max(x(:,10)-5,0)+a*max(x(:,11)-5,0)+a*max(x(:,12)-5,0)+a*max(x(:,13)-5,0)+...
       a*max(x(:,14)-3,0)+a*max(x(:,15)-3,0)+a*max(x(:,16)-8,0)+a*max(x(:,17)-6,0)+...
       a*max(x(:,18)-2,0)+a*max(8-x(:,1)-x(:,2)-x(:,3),0)+a*max(8-x(:,4)-x(:,5),0)+...
       a*max(8-x(:,6)-x(:,7)-x(:,8)-x(:,9),0)+a*max(8-x(:,10)-x(:,11)-x(:,12)-x(:,13),0)+...
       a*max(7-x(:,14)-x(:,15)-x(:,16),0)+a*max(7-x(:,17)-x(:,18),0)+...
       a*abs(-14+x(:,1)+x(:,6)+x(:,10)+x(:,14))+a*abs(-14+x(:,4)+x(:,7)+x(:,11))+...
       a*abs(-14+x(:,2)+x(:,8)+x(:,12)+x(:,15))+a*abs(-14+x(:,5)+x(:,16)+x(:,17))+...
       a*abs(-14+x(:,3)+x(:,9)+x(:,13)+x(:,18));

   [val,ind]=min(fx); %calculate the minimums
   if val<fxgp
       fxgp=val; %New global performance
       xgp=x(ind,:);
   end
   for i=1:np
       if fx(i,:)<fxLp(i,:)
           fxLp(i,:)=fx(i,:); %New local performance
           xLp(i,:)=x(i,:); %New local positions
       end
   end
  %Equations of movement
       vx = vx + c1*rand()*(xgp-x) + c2*rand()*(xLp-x);
       x = x + vx; %New position

end
fx=25*(xgp(:,1)+xgp(:,2)+xgp(:,3))+26*(xgp(:,4)+xgp(:,5))+24*(xgp(:,6)+xgp(:,7)+xgp(:,8)+xgp(:,9))+...
       23*(xgp(:,10)+xgp(:,11)+xgp(:,12)+xgp(:,13))+28*(xgp(:,14)+xgp(:,15)+xgp(:,16))+...
       30*(xgp(:,17)+xgp(:,18));
disp(['fx: ' num2str(fx)])
disp(['K.C.: ' num2str(xgp(:,1)) ' ' num2str(xgp(:,2)) ' ' num2str(xgp(:,3))])
disp(['D.H.: ' num2str(xgp(:,4)) ' ' num2str(xgp(:,5))])
disp(['H.B.: ' num2str(xgp(:,6)) ' ' num2str(xgp(:,7)) ' ' num2str(xgp(:,8)) ' ' num2str(xgp(:,9))])
disp(['S.C.: ' num2str(xgp(:,10)) ' ' num2str(xgp(:,11)) ' ' num2str(xgp(:,12)) ' ' num2str(xgp(:,13))])
disp(['K.S.: ' num2str(xgp(:,14)) ' ' num2str(xgp(:,15)) ' ' num2str(xgp(:,15))])
disp(['N.K.: ' num2str(xgp(:,17)) ' ' num2str(xgp(:,18))])

sum([xgp(:,1) xgp(:,2) xgp(:,3)])
sum([xgp(:,4) xgp(:,5)])
sum([xgp(:,6) xgp(:,7) xgp(:,8) xgp(:,9)])
sum([xgp(:,10) xgp(:,11) xgp(:,12) xgp(:,13)])
sum([xgp(:,14) xgp(:,15) xgp(:,16)])
sum([xgp(:,17) xgp(:,18)])
sum([xgp(:,1) xgp(:,6) xgp(:,10) xgp(:,14)])
sum([xgp(:,4) xgp(:,7) xgp(:,11)])
sum([xgp(:,2) xgp(:,8) xgp(:,12) xgp(:,15)])
sum([xgp(:,5) xgp(:,16) xgp(:,17)])
sum([xgp(:,3) xgp(:,9) xgp(:,13) xgp(:,18)])







clear all;
close all;
clc;
%% Parameters
%Number of particles
np=500;
num_v=3;
%Position
x=rand(np,num_v); %we increased the number of columns to match the variables we have
vi=[0.0018 0.0020 0.0021];
x=x+vi;
xLp=x;% we define our x
xgp=zeros(1,num_v); % we created a vector of ceros that matchesthe # of variables
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
   fx=-((500*x(:,1).*(x(:,1)<=15)+((15*500)+60*(x(:,1)-15)).*(x(:,1)>15))+...
       (400*x(:,2).*(x(:,2)<=20)+((20*400)+200*(x(:,2)-20)).*(20<x(:,2)<=40)+...
       ((20*400)+(20*200)+100*(x(:,2)-40)).*(x(:,2)>40))+(600.*x(:,3).*(x(:,3)<=20)+...
       (20*600+400*(x(:,3)-20)).* (x(:,3)>20).*(x(:,3)<=30)...
       +((20*600)+(10*400)+(200*(x(:,3)-30))).*(x(:,3)>30)))+...
       a*max(-x(:,1),0)+a*max(-x(:,2),0)+a*max(-x(:,3),0)+...
       a*max(-180+2*x(:,1)+3*x(:,2)+4*x(:,3),0)+a*max(-150+3*x(:,1)+1*x(:,2),0)+...
       a*max(-100+1*x(:,1)+3*x(:,3),0);

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
fx=500*xgp(:,1).*(xgp(:,1)<=15)+(15*500+60*(xgp(:,1)-15)).*(xgp(:,1)>15)+...
    400*xgp(:,2).*(xgp(:,2)<=20)+(20*400+200*(xgp(:,2)-20)).*(20<xgp(:,2)<=40)+...
    (20*400+20*200+100*(xgp(:,2)-40)).*(xgp(:,2)>40)+600.*xgp(:,3).*(xgp(:,3)<=20)+...
    (20*600+400*(xgp(:,3)-20)).*(xgp(:,3)>20).*(xgp(:,3)<=30)+(20*600+10*400+200*(xgp(:,3)-30)).*(xgp(:,3)>30);

[fx xgp(:,1) xgp(:,2) xgp(:,3)]

2*xgp(:,1)+3*xgp(:,2)+4*xgp(:,3)
3*xgp(:,1)+xgp(:,2)
xgp(:,1)+3*xgp(:,3)

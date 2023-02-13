clear all;
close all;
clc;

%% Parameters

%Number of particles
np=500;

%Position
x1=rand(np,1); % randomly
x1Lp=x1; % initial best local position
x1gp=0; % initial best global position

x2=rand(np,1); % randomly
x2Lp=x2; % initial best local position
x2gp=0; % initial best global position

%x3=rand(np,1); % randomly
%x3Lp=x3; % initial best local position
%x3gp=0; % initial best global position


%Initial performance
fxgp=100000000;%Initial global performance
fxLp= ones(np,1)*fxgp; % Initial local performance 

%Speed
vx1=zeros(np,1); %Initial velocity 
vx2=zeros(np,1); %Initial velocity 
%vx3=zeros(np,1); %Initial velocity 

%Attraction factors 
c1=.75;%.75;%Attraction to the global
c2=.75;%.75;%Atrraction to the local
%c3=.75;
a=100;

%% Iterative part
for k=1:1000
    %Fitness or Function
    fx=sin(x1.*x2)./x1+a*max(x1-5,0)+a*max(x2-5,0)+a*max(-x1-5,0)+a*max(-x2-5,0)+a*max(-x1+.0000000001,0);

    [val,ind]=min(fx); %calculate the minimums

    if val<fxgp
        fxgp=val; %New global performance
        x1gp=x1(ind,1);%New global best position 
        x2gp=x2(ind,1);
    end

    for i=1:np
        if fx(i,1)<fxLp(i)
            fxLp(i)=fx(i); %New local performance
            x1Lp(i,1)=x1(i,1); %New local positions 
            x2Lp(i,1)=x2(i,1); %New local positions 
        end
    end

    %Section that can be erased
%    plot(x1, x2, 'b.',x1gp, x2gp, 'go', 0, 0, 'rx')
 %   axis([-10 10 -20 10]);
  %  title (['x1gp=' num2str(x1gp) 'x2gp=' num2str(x2gp)]);
   % pause(.1);

   %Equations of movement 
    vx1=vx1+c1*rand()*(x1gp-x1)+c2*rand()*(x1Lp-x1); %New speed
    x1=x1+vx1; %New position

    vx2=vx2+c1*rand()*(x2gp-x2)+c2*rand()*(x2Lp-x2); %New speed
    x2=x2+vx2; %New position
end



fx=sin(x1gp.*x2gp)./x1gp

[fx, x1gp, x2gp]

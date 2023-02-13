clear all;
close all;
clc;

%% Parameters

%Number of particles
np=500;
num_v=2;

%Position
x=rand(np,num_v); %we increased the number of columns to match the variables we have 
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
    fx=sin(x(:,1).*x(:,2))./x(:,1)+a*max(x(:,1)-5,0)+a*max(x(:,2)-5,0)+a*max(-x(:,1)-5,0)+a*max(-x(:,2)-5,0)+a*max(-x(:,1)+.0000000001,0);

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



fx=sin(xgp(:,1).*xgp(:,2))./xgp(:,1)

[fx xgp(:,1) xgp(:,2)]

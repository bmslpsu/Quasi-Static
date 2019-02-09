clc
clear all
close all
%%
a=.0004; %wing dimension width
b=.0014; % wing dimensions length
m=0.5*10^-6; %this is the mass of a fruit fly in kg
g=9.81;

damage=[0.75:0.02:1]; %damage quantification
%% calculation of torque and moment
[L, D, dL, dD]=LiftAndDrag(1,a,b);
[L1, D1, dL1, dD1]=LiftAndDrag(.5,a,b); %0.95 here represents percentage of the remaining damaged wing

%% Torque caculations
syms r
r_avg=int(r*dL,r,0,b)/int(dL,r,0,b); %find the pt of application of the lift force
r_avg_d=int(r*dD,r,0,b)/int(dD,r,0,b);%find the pt of application of the drag force

r_avg_1=int(r*dL1,r,0,b*0.95)/int(dL1,r,0,b*0.5); %find the pt of application of the lift force
r_avg_d1=int(r*dD1,r,0,b*0.95)/int(dD1,r,0,b*0.5);%find the pt of application of the drag force

Delta_T_yaw=r_avg_d*D-r_avg_d1*D1; % the torque acting on the fly due to wing damage

%% integrate toruqe for quarter stoke
syms t
r=b;
Delat_T=eval(int(Delta_T_yaw,t,0,1/880))
Delta_T_Norm=eval(int(Delta_T_yaw/(m*g*b),t,0,1/880))

%% plots
plot(moment3_ratio, a2)
figure
plot(moment3_ratio, a1)
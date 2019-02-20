% Steady-state, blade-element aerodynamic simulation of Drosophila wing
% from Weis-Fogh, 1973, Journal of Experimental Biology
% assume rectangular wing

clc
clear all
close all
%% Constants
a = 0.0004; %wing dimension width (chord c)
b = 0.0014; % wing dimensions length (length R)
m = 0.5*10^-6; %this is the mass of a fruit fly in kg
g = 9.81;

%ne = 40;   % number of elements for each wing 
n = 220;  % wingbeat frequency
T = 1/n; % period of a fruit fly wingbeat
%alpha = 65*pi/180; %angle in rad
alpha = 45; % angle in degrees

%%
damage = 0.75:0.02:1; %damage quantification

%% calculation of torque and moment
[L, D, dL, dD] = LiftAndDrag(1,a,b);
[L1, D1, dL1, dD1] = LiftAndDrag(0.5,a,b); %0.95 here represents percentage of the remaining damaged wing

%% Torque caculations
syms r
r_avg = int(r*dL,r,0,b)/int(dL,r,0,b); %find the pt of application of the lift force
r_avg_d = int(r*dD,r,0,b)/int(dD,r,0,b);%find the pt of application of the drag force

r_avg_1 = int(r*dL1,r,0,b*0.95)/int(dL1,r,0,b*0.5); %find the pt of application of the lift force
r_avg_d1 = int(r*dD1,r,0,b*0.95)/int(dD1,r,0,b*0.5);%find the pt of application of the drag force

Delta_T_yaw = r_avg_d*D - r_avg_d1*D1; % the torque acting on the fly due to wing damage

%% Integrate torque for quarter stroke
syms t
r = b;
Delta_T = eval(int(Delta_T_yaw,t,0,T/4)) % quarter stroke
Delta_T_Norm = eval(int(Delta_T_yaw/(m*g),t,0,T/4))

%% plots
%plot(moment3_ratio, a2)
%figure
%plot(moment3_ratio, a1)


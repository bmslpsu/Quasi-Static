function [L1,D1, dL, dD]=LiftAndDrag(damage,a,b)

%a is the length of the wing
%b is the width of the wing assuming its a rectangle
%damage is the proportion of the wing still intact. For example if damage
%is 0.95 then 95 % of the wing is intact and 5% is damaged

%% variables for analysis 
n=40;   % number of elements for each wing not used in this version of the code
T=1/220; % period of a fruit fly wingbeat
alpha=65*pi/180; %angle in rad


%% coefficient of lift and drag (rechecked: this section is correct)
C_L=0.225+1.58*sin(2.13*alpha-7.28*pi/180);
C_D=1.92-1.55*cos(2.04*alpha-9.82*pi/180);

%% blade element section 
%output is the force for each element as a function of time dL and dD
%L and D are forces for a quarter stroke 

[L1, D1, dL, dD]=BladeTestRectangleV3(C_L,C_D,a,damage*b,n,T); 



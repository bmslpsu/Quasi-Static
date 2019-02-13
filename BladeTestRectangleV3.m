function [L, D, dL, dD]=BladeTestRectangleV3(C_L,C_D,a,b,ne,T)
%this a finite element function which divides the wing into sections and
%calculates the lift and drag force generated by each element. The involved
%variables are:

%ne is the number of elements
%T is the wingbeat period. For a fruit fly it is around 1/220 seconds
%C_L is the coefficient of lift
%C_D is the coefficient of drag
%a and b are the wing width and length
%% constants
%r=b/ne*(0:ne-1)+b/(2*ne);      %distance from base of wing to middle of element
dr = b/ne;     %width of each wing element
Cr = a;       %chord length of each element. Since I am using a rectangle then it is the same for all elements
rho = 1.225; %density of air at Standard Atmosphere (kg/m^3)
phi = 120; % deg turned into rad in dL calcualtions

n = 1/T;
syms t % testing to integrate t rather than sum

syms r
%% calculation of the lift and drag for each element of the wing
%(equation checked as of v2)

dL = 0.5*C_L*rho*pi^2*n^2*(phi*pi/180)^2*Cr*r^2*(cos(2*pi*n*t))^2;
dD = 0.5*C_D* rho*pi^2*n^2*(pi*phi/180)^2*Cr*r^2*(cos(2*pi*n*t))^2;

L=int(dL,r);
D=int(dD,r);

end
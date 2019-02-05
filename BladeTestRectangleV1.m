%% this code is made for a rectangular element. Using the numbers in the paper it can be modified for other elements
% the goal would be to create a more robust code which takes more inputs
% and is more interactive with the user

clc
clear all
%% rect size
a=.001;
b=.003;
n
j=[10,100,200,300,400,600];
n=100;       % number of elements to choose from
for j=1:5
    r=b/n*(0:n-1)+b/(2*n);      %distance from base of wing to middle of element
    dr=b/n;     %width of each wing element
    
    Cr=a*ones(1,n);       %chord length of each element. Since I am using a rectangle then it is the same for all elements
    rho=1.225; %density of air
    
    phi=120; % deg
    n_f=220; %freq
    
    %% time of a quarter stroke
    t_Qstroke=1/880;
    syms t % testing to integrate t rather than sum
    %t=0:t_stroke/10:t_stroke;
    %% coeff of lift: average over a quarter stroke
    G=0.01; % dont remember the weight of a fruit fly
    sigma=1/3;
    c=a; %the chord length at the base of the wing
    R=b; %the maximum length of the wing
    CL=4*G/(rho*pi^2*n_f^2*phi^2*sigma*c*R^3);
    %%
    for i=1:n
        dL(i)=0.5*CL* rho*pi^2*n_f^2*phi^2*Cr(i)*dr*r(i)*(cos(2*pi*n*t))^2;
        L(i)=int(dL(i),t,0,t_Qstroke);
    end
  %  L=eval(L);
    F_Lift(j)=sum(L);
end

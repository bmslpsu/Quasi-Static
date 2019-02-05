function dT=GeneratedTorque(dL,dL1,r)
%dL1 is the lift for each element of the damaged wing

dL1=[dL1 zeros(1,length(dL)-length(dL1))]; % the lift vector of the damaged wing is extended
for i=1:length(dL)
    dT(i)=r(i)*(dL(i)-dL1(i));
end

end
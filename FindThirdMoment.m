function moment3_ratio=FindThirdMoment(damage,a,b)

%a is the length of the wing
%b is the width of the wing assuming its a rectangle
%damage is the proportion of the wing still intact. For example if damage
%is 0.95 then 95 % of the wing is intact and 5% is damaged
moment3_damaged=(a*(damage*b)^3)/3;
moment3_intact=(a*b^3)/3;
moment3_ratio=moment3_damaged/moment3_intact;
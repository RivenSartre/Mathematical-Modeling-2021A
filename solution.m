%function x = solution(a,b,c)
a = 36.795;
b = -11.831;
c = [0;0;-300.4]
A = [cosd(a)*cosd(b) -sind(a) -sind(b)*cosd(a);sind(a)*cosd(b) cosd(a) -sind(b)*sind(a);sind(b) 0 cosd(b)]'
x = A\c
%end


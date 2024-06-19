function y = fitness(t)
OPT.Display='off';
% E124拉伸量x(1) E140拉伸量x(2)
% 需要change之后的E123、E141
p_2 = 561.2892;
b_0 = 300.7359;
options = optimset('Display','off');
PT = [-144.2859	-15.11 -265.1092];
x_1=PT(1);
y_1=PT(2);
z_1=PT(3);
rope = [-145.2312 -15.209 -266.8461];
x_2=rope(1);
y_2=rope(2);
z_2=rope(3);
point = [-143.4227 -15.02 -263.5232];
x_3=point(1);
y_3=point(2);
z_3=point(3);

con1 = fsolve(@(x)root4d(x,x_1,x_2,x_3,y_1,y_2,y_3,z_1,z_2,z_3,t(1)),point,options); %E124

PT = [-153.7141 -18.2887 -261.0188];
x_1=PT(1);
y_1=PT(2);
z_1=PT(3);
rope = [-154.717 -18.408 -262.7218];
x_2=rope(1);
y_2=rope(2);
z_2=rope(3);
point = [-153.698 -18.287 -257.4542];
x_3=point(1);
y_3=point(2);
z_3=point(3);

con2 = fsolve(@(x)root4d(x,x_1,x_2,x_3,y_1,y_2,y_3,z_1,z_2,z_3,t(2)),point,options); %E140

Po1 = [-145.747886 -26.29853923 -260.9753743]; %E123
Po2 = [-150.9434203 -6.951541838 -259.2446677]; %E141

D1 = Po1;
D2 = con1;
D3 = con2;
M = [(D1(1)+D2(1)+D3(1))/3 (D1(2)+D2(2)+D3(2))/3 (D1(3)+D2(3)+D3(3))/3];
m1 = (D2(2)-D1(2))*(D3(3)-D1(3))-(D3(2)-D1(2))*(D2(3)-D1(3));
m2 = (D2(3)-D1(3))*(D3(1)-D1(1))-(D2(1)-D1(1))*(D3(3)-D1(3));
m3 = (D2(1)-D1(1))*(D3(2)-D1(2))-(D2(2)-D1(2))*(D3(1)-D1(1));
st1 = D1;
Result(1:3) = fsolve(@(x)root3d(x,D1,m1,m2,m3,p_2,b_0),st1,options);
st2 = D2;
Result(4:6) = fsolve(@(x)root3d(x,D2,m1,m2,m3,p_2,b_0),st2,options);
st3 = D3;
Result(7:9) = fsolve(@(x)root3d(x,D3,m1,m2,m3,p_2,b_0),st3,options);
st4 = M;
Result(10:12) = fsolve(@(x)root3d(x,M,m1,m2,m3,p_2,b_0),st4,options);

Dac(1) = sqrt((Result(1)-D1(1))^2+(Result(2)-D1(2))^2+(Result(3)-D1(3))^2);
Dac(2) = sqrt((Result(4)-D2(1))^2+(Result(5)-D2(2))^2+(Result(6)-D2(3))^2);
Dac(3) = sqrt((Result(7)-D3(1))^2+(Result(8)-D3(2))^2+(Result(9)-D3(3))^2);
Dac(4) = sqrt((Result(10)-M(1))^2+(Result(11)-M(2))^2+(Result(12)-M(3))^2);

y1 = (Dac(1)+Dac(2)+Dac(3))/3 + Dac(4);

D1 = Po2;
% D2 = con1;
% D3 = con2;
M = [(D1(1)+D2(1)+D3(1))/3 (D1(2)+D2(2)+D3(2))/3 (D1(3)+D2(3)+D3(3))/3];
m1 = (D2(2)-D1(2))*(D3(3)-D1(3))-(D3(2)-D1(2))*(D2(3)-D1(3));
m2 = (D2(3)-D1(3))*(D3(1)-D1(1))-(D2(1)-D1(1))*(D3(3)-D1(3));
m3 = (D2(1)-D1(1))*(D3(2)-D1(2))-(D2(2)-D1(2))*(D3(1)-D1(1));
st1 = D1;
Result(1:3) = fsolve(@(x)root3d(x,D1,m1,m2,m3,p_2,b_0),st1,options);
st2 = D2;
Result(4:6) = fsolve(@(x)root3d(x,D2,m1,m2,m3,p_2,b_0),st2,options);
st3 = D3;
Result(7:9) = fsolve(@(x)root3d(x,D3,m1,m2,m3,p_2,b_0),st3,options);
st4 = M;
Result(10:12) = fsolve(@(x)root3d(x,M,m1,m2,m3,p_2,b_0),st4,options);

Dac(1) = sqrt((Result(1)-D1(1))^2+(Result(2)-D1(2))^2+(Result(3)-D1(3))^2);
Dac(2) = sqrt((Result(4)-D2(1))^2+(Result(5)-D2(2))^2+(Result(6)-D2(3))^2);
Dac(3) = sqrt((Result(7)-D3(1))^2+(Result(8)-D3(2))^2+(Result(9)-D3(3))^2);
Dac(4) = sqrt((Result(10)-M(1))^2+(Result(11)-M(2))^2+(Result(12)-M(3))^2);

y2 = (Dac(1)+Dac(2)+Dac(3))/3 + Dac(4);

y = y1 + y2;


end


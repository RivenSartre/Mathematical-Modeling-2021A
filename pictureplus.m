A = xlsread('I:/2021JM/picture.csv','D1:F4300');
B = xlsread('I:/2021JM/picture.csv','G1:I4300');
C = xlsread('I:/2021JM/picture.csv','J1:L4300');
for i=1:4300
    x=[A(i,1) B(i,1) C(i,1) A(i,1)];
    y=[A(i,2) B(i,2) C(i,2) A(i,2)];
    z=[A(i,3) B(i,3) C(i,3) A(i,3)];
    plot3(x,y,z,'Color','red')
    hold on
end

D = xlsread('I:/2021JM/picture.csv','N1:P1295');
E = xlsread('I:/2021JM/picture.csv','Q1:S1295');
F = xlsread('I:/2021JM/picture.csv','T1:V1295');
for i=1:1295
    x=[D(i,1) E(i,1) F(i,1) D(i,1)];
    y=[D(i,2) E(i,2) F(i,2) D(i,2)];
    z=[D(i,3) E(i,3) F(i,3) D(i,3)];
    plot3(x,y,z,'Color','blue')
    hold on
end

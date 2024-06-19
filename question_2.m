function [num,dis,Re,choint] = question_2(p_2,b_0)

p_2 = 561.2892;
b_0 = 300.7359;
options = optimset('Display','off');
a = 36.795;
b_1 = 78.169;
b_2 = b_1-90;
P = [cosd(b_1)*cosd(a),cosd(b_1)*sind(a),sind(b_1)];
O = [0,0,0];
x = xlsread('I:/2021JM/A/附件1.csv','B2:B2227');
y = xlsread('I:/2021JM/A/附件1.csv','C2:C2227');
z = xlsread('I:/2021JM/A/附件1.csv','D2:D2227');
n = length(x);
flag = 1;
%% 筛点

for i = 1:n
    point = [x(i),y(i),z(i)];
    d = norm(cross(P-O,point-O))/norm(P-O);
    if d<=150
        choint(flag,1:3) = point;
        num(flag) = i;
        flag = flag+1;
    end
end
num = num';
%% 计算拉伸量

rope = xlsread('I:/2021JM/choint.csv','M1:O692'); % 顶点
PT = xlsread('I:/2021JM/choint.csv','Q1:S692');   % 底点
N = flag-1;

for i = 1:N
    
    x_1=PT(i,1);
    y_1=PT(i,2);
    z_1=PT(i,3);
    %     x_1=choint(i,1);
    %     y_1=choint(i,2);
    %     z_1=choint(i,3);
    x_2=rope(i,1);
    y_2=rope(i,2);
    z_2=rope(i,3);
    %     x_2=0;
    %     y_2=0;
    %     z_2=0;
    x0 = choint(i,:);
    Re(i,1:3) = fsolve(@(x)root2d(x,x_1,x_2,y_1,y_2,z_1,z_2,p_2,b_0),x0,options);
    if Re(i,3)>=choint(i,3)
        dis(i) = sqrt((Re(i,1)-choint(i,1))^2+(Re(i,2)-choint(i,2))^2+(Re(i,3)-choint(i,3))^2);
    else
        dis(i) = -sqrt((Re(i,1)-choint(i,1))^2+(Re(i,2)-choint(i,2))^2+(Re(i,3)-choint(i,3))^2);
    end
    
    
    
end

dis = dis';


% for i = 1:N
%
%     x_1=PT(i,1);
%     y_1=PT(i,2);
%     z_1=PT(i,3);
%     x_2=rope(i,1);
%     y_2=rope(i,2);
%     z_2=rope(i,3);
%     x0 = choint(i,:);
%     Rel(i,1:3) = fsolve(@(x)root1d(x,x_1,x_2,y_1,y_2,z_1,z_2),x0);
% %     if Re(i,3)>=Rel(i,3)
%         dis(i,2) = sqrt((Re(i,1)-Rel(i,1))^2+(Re(i,2)-Rel(i,2))^2+(Re(i,3)-Rel(i,3))^2);
% %     else
% %         dis(i,2) = -sqrt((Re(i,1)-Rel(i,1))^2+(Re(i,2)-Rel(i,2))^2+(Re(i,3)-Rel(i,3))^2);
% %     end
% end

%% 目标函数

tri = xlsread('I:/2021JM/triangle.csv','D1:F4300');
chs = xlsread('I:/2021JM/choint.csv','G1:G692');
chs = chs';
[hang,lie] = size(tri);
fl = 1;
for i = 1:hang
    rec(i,1:3) = ismember(tri(i,:),chs);
    if sum(rec(i,1:3)) == 3
        rec(i,4) = 1;
        ber(fl,1) = i;
        fl = fl+1;
    else
        rec(i,4) = 0;
    end
end
triangle = xlsread('I:/2021JM/tri.csv','I1:Q1295');
[hang_triangle,lie_triangle] = size(triangle);
for i = 1:hang_triangle
    D1 = triangle(i,1:3);
    D2 = triangle(i,4:6);
    D3 = triangle(i,7:9);
    M = [(D1(1)+D2(1)+D3(1))/3 (D1(2)+D2(2)+D3(2))/3 (D1(3)+D2(3)+D3(3))/3];
    m1 = (D2(2)-D1(2))*(D3(3)-D1(3))-(D3(2)-D1(2))*(D2(3)-D1(3));
    m2 = (D2(3)-D1(3))*(D3(1)-D1(1))-(D2(1)-D1(1))*(D3(3)-D1(3));
    m3 = (D2(1)-D1(1))*(D3(2)-D1(2))-(D2(2)-D1(2))*(D3(1)-D1(1));
    st1 = D1;
    Result(i,1:3) = fsolve(@(x)root3d(x,D1,m1,m2,m3,p_2,b_0),st1,options);
    st2 = D2;
    Result(i,4:6) = fsolve(@(x)root3d(x,D2,m1,m2,m3,p_2,b_0),st2,options);
    st3 = D3;
    Result(i,7:9) = fsolve(@(x)root3d(x,D3,m1,m2,m3,p_2,b_0),st3,options);
    st4 = M;
    Result(i,10:12) = fsolve(@(x)root3d(x,M,m1,m2,m3,p_2,b_0),st4,options);
    
    Dac(i,1) = sqrt((Result(i,1)-D1(1))^2+(Result(i,2)-D1(2))^2+(Result(i,3)-D1(3))^2);
    Dac(i,2) = sqrt((Result(i,4)-D2(1))^2+(Result(i,5)-D2(2))^2+(Result(i,6)-D2(3))^2);
    Dac(i,3) = sqrt((Result(i,7)-D3(1))^2+(Result(i,8)-D3(2))^2+(Result(i,9)-D3(3))^2);
    Dac(i,4) = sqrt((Result(i,10)-M(1))^2+(Result(i,11)-M(2))^2+(Result(i,12)-M(3))^2);
    
    tar(i) = (Dac(i,1)+Dac(i,2)+Dac(i,3))/3 + Dac(i,4);
    
end
tar = tar';
% see = sum(tar)

%% 考虑0.07%
% 筛选的点choint→索点的原编号，坐标
% 移动后的点Re→索点变化后的坐标
for i = 1:flag - 1
    for j =1:flag - 1
        juli_begin(i,j) = sqrt((choint(i,1) - choint(j,1))^2 + (choint(i,2) - choint(j,2))^2 + (choint(i,3) - choint(j,3))^2);
        juli_change(i,j) = sqrt((Re(i,1) - Re(j,1))^2 + (Re(i,2) - Re(j,2))^2 + (Re(i,3) - Re(j,3))^2);
    end
end
for i = 1:flag - 1
    for j =1:flag - 1
        if juli_begin(i,j) > 15
            juli_begin(i,j) = 0;
        end
        if juli_change(i,j) > 15
            juli_change(i,j) = 0;
        end
    end
end
juli_s = abs(juli_begin - juli_change);
cg = juli_s./juli_begin;
for i = 1:flag - 1
    for j =1:flag - 1
        if i >= j
            cg(i,j) = 0;
        end
    end
end
[max_cg,index]=max(cg,[],2);
[max_sp,index_sp]=max(max_cg,[],1)

end


function [S1,S2] = question_3()
options = optimset('Display','off');
%%
triangle = xlsread('I:/2021JM/tri.csv','I1:Q1295');
[hang_triangle,lie_triangle] = size(triangle);
N = 500;
% S1 = 0;
for i = 1:hang_triangle
    n = 0;
    for j = 1:N
        D1 = triangle(i,1:3);
        D2 = triangle(i,4:6);
        D3 = triangle(i,7:9);
        rho1 = rand;
        rho2 = rand;
        R = rho1 * rho2 * D1 + (1 - rho1) * rho2 * D2 + (1 - rho2) * D3;
        %     M = [(D1(1)+D2(1)+D3(1))/3 (D1(2)+D2(2)+D3(2))/3 (D1(3)+D2(3)+D3(3))/3];
        m1 = (D2(2)-D1(2))*(D3(3)-D1(3))-(D3(2)-D1(2))*(D2(3)-D1(3));
        m2 = (D2(3)-D1(3))*(D3(1)-D1(1))-(D2(1)-D1(1))*(D3(3)-D1(3));
        m3 = (D2(1)-D1(1))*(D3(2)-D1(2))-(D2(2)-D1(2))*(D3(1)-D1(1));
        mu = [m1 m2 m3];
        Sc = [0.16418 0.1288 0.97875];
        cxi = abs((mu(1) * Sc(1) + mu(2) * Sc(2) + mu(3) * Sc(3) )/norm(mu));
        a = (2 * (-0.16418 * m1 - 0.1228 * m2 - 0.97875 * m3))/(m1^2 + m2^2 + m3^2);
        
        Sp = sqrt(m1^2 + m2^2 + m3^2)/2; % 中持
        st = [-26.3378 -19.6995 -157.0111];
        Result1 = fsolve(@(x)root5d(x,R,m1,m2,m3,a),st,options);
        Dac1 = sqrt((Result1(1)-st(1))^2 + (Result1(2)-st(2))^2 + (Result1(3)-st(3))^2);
        if Dac1 <= 0.5
            n = n + 1;
        end
    end
    ztr1(i) = (n/N) * Sp * cxi;
end
nta1 = sum(ztr1)/(150^2*pi) *1e4

%%
circle = xlsread('I:/2021JM/tri.csv','S1:AA1295');
[hang_circle,lie_circle] = size(circle);
% S2 = 0;
for i = 1:hang_circle
    n = 0;
    for j = 1:N
        D1 = triangle(i,1:3);
        D2 = triangle(i,4:6);
        D3 = triangle(i,7:9);
        rho1 = rand;
        rho2 = rand;
        R = rho1 * rho2 * D1 + (1 - rho1) * rho2 * D2 + (1 - rho2) * D3;
        %     M = [(D1(1)+D2(1)+D3(1))/3 (D1(2)+D2(2)+D3(2))/3 (D1(3)+D2(3)+D3(3))/3];
        m1 = (D2(2)-D1(2))*(D3(3)-D1(3))-(D3(2)-D1(2))*(D2(3)-D1(3));
        m2 = (D2(3)-D1(3))*(D3(1)-D1(1))-(D2(1)-D1(1))*(D3(3)-D1(3));
        m3 = (D2(1)-D1(1))*(D3(2)-D1(2))-(D2(2)-D1(2))*(D3(1)-D1(1));
        mu = [m1 m2 m3];
        Sc = [0.16418 0.1288 0.97875];
        cxi = abs((mu(1) * Sc(1) + mu(2) * Sc(2) + mu(3) * Sc(3) )/norm(mu));
        a = (2 * (-0.16418 * m1 - 0.1228 * m2 - 0.97875 * m3))/(m1^2 + m2^2 + m3^2);
        
        Sp = sqrt(m1^2 + m2^2 + m3^2)/2; % 中持
        st = [-26.3378 -19.6995 -157.0111];
        Result2 = fsolve(@(x)root5d(x,R,m1,m2,m3,a),st,options);
        Dac2 = sqrt((Result2(1)-st(1))^2 + (Result2(2)-st(2))^2 + (Result2(3)-st(3))^2);
        if Dac2 <= 0.5
            n = n + 1;
        end
    end
    ztr2(i) = (n/N) * Sp  * cxi;
end
nta2 = sum(ztr2)/(150^2*pi) *1e4

% S1
% S2
%
end
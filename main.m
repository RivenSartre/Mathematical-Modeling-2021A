% clc
clear
R = 300.4;
F = 0.466*R;

% ����һ
[f b_0] = question_1();
p_2 = 4*f;


%% �����
[num,dis,Re,choint] = question_2(p_2,b_0);
t = zeros(1,10);
[xm,fv] = PSO_adp(@fitness,60,1.8,1.8,0.9,0.6,400,2);



%% ������
[nta1,nta2] = question_3();

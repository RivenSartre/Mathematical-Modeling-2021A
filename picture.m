% x = xlsread('I:/2021JM/A/¸½¼þ1.csv','B2:B2227');
% y = xlsread('I:/2021JM/A/¸½¼þ1.csv','C2:C2227');
% z = xlsread('I:/2021JM/A/¸½¼þ1.csv','D2:D2227');
% xmax=max(x);
% xmin=min(x);
% ymax=max(y);
% ymin=min(y);
% [X,Y]=meshgrid(xmin:5:xmax,ymin:5:ymax);
% Z=griddata(x,y,z,X,Y,'v4');
% figure(1)
% surf(X,Y,Z)
% % shading interp 
% % colorbar

x = choint(:,1);
y = choint(:,2);
z = choint(:,3);
xmax=max(x);
xmin=min(x);
ymax=max(y);
ymin=min(y);
[X,Y]=meshgrid(xmin:5:xmax,ymin:5:ymax);
Z=griddata(x,y,z,X,Y,'v4');
figure(1)
% surf(X,Y,Z)
surf(X,Y,Z,'EdgeColor','none')
% shading interp 
% colorbar

x1 = Re(:,1);
y1 = Re(:,2);
z1 = Re(:,3);
xmax=max(x1);
xmin=min(x1);
ymax=max(y1);
ymin=min(y1);
[X,Y]=meshgrid(xmin:5:xmax,ymin:5:ymax);
Z=griddata(x1,y1,z1,X,Y,'v4');
figure(1)
hold on
surf(X,Y,Z,'FaceColor','r','EdgeColor','none')
% surf(X,Y,Z,'FaceColor','k')
% shading interp 
% colorbar

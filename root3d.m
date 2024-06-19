function F = root3d(x,D,m1,m2,m3,p_2,b_0)

a = 36.795;
b = -11.831;
F(1) = (cosd(a)*cosd(b)*x(1)+sind(a)*cosd(b)*x(2)+sind(b)*x(3))^2+(-sind(a)*x(1)+cosd(a)*x(2))^2-p_2*(-sind(b)*cosd(a)*x(1)+-sind(b)*sind(a)*x(2)+cosd(b)*x(3)+b_0);
F(2) = m2*(x(1)-D(1))-m1*(x(2)-D(2));
F(3) = m3*(x(2)-D(2))-m2*(x(3)-D(3));

end

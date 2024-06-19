function [f_flag b_flag] = question_1()
R = 300.4;
F = 0.466*R;
n = 100;
x_circle = linspace(0,150,n);
y_circle = -sqrt(R^2-x_circle.^2);
for i = 1:n
    k(i) = y_circle(i)/x_circle(i);
end
d_max = 10;
for f = F-0.6:0.0001:F+0.6
    a = 4*f;
    b = f+(1-0.466)*R;
    c = k;
    x_parabola(1) = 0;
    y_parabola(1) = -b;
    for i = 2:n
        xishu = [1 -a*c(i) -a*b];
        X = roots(xishu);
        for j = 1:length(X)
            if X(j)>0
                x_parabola(i) = X(j);
            end
        end
        y_parabola(i) = c(i)*x_parabola(i);
    end
    for i = 1:n
        if y_parabola(i) >= y_circle(i)
            d(i) = sqrt((x_circle(i)-x_parabola(i))^2+(y_circle(i)-y_parabola(i))^2);
        else
            d(i) = -sqrt((x_circle(i)-x_parabola(i))^2+(y_circle(i)-y_parabola(i))^2);
        end
        
    end
    dis = max(abs(d));
    if dis<d_max
        d_max = dis;
        f_flag = f;
        b_flag = b;
        record = d;
    end
end
d_max
x = x_circle;
plot(x,record)
end


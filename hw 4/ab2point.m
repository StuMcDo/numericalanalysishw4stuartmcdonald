approx = @(x) 0.5.*x.^2
y0 = 0;
Y = [];
a = 0.03
Y(1,1) = y0
Y(1,2) = approx(a);
X = linspace(0,0.5,6);
f = @(x,y) y + x
h = 0.1;0
for i = 1:5
    if i == 1
    Y(1,i+2) = Y(1,i+1) +h/2.*(3.*f(a,Y(1,i+1))-f(X(1,i),Y(1,i)))
    elseif i == 2  
      Y(1,i+2) = Y(1,i+1) +h/2.*(3.*f(X(1,i),Y(1,i+1))-f(a,Y(1,i)))
    else
        Y(1,i+2) = Y(1,i+1) +h/2.*(3.*f(X(1,i),Y(1,i+1))-f(X(1,i),Y(1,i)))
    end
end
tspan = [0 0.5];
[t,y] = ode45(f, tspan, y0);
X1 = [0 a 0.1 0.2 0.3 0.4 0.5];
plot(t,y,'-o',X1,Y,'-o')
legend({'ode45','adams bashforth 2 point'},'Location','northwest','Orientation','horizontal')
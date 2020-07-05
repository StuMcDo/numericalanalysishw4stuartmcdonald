a = 0.03
X = [0 a 0.1 0.2 0.3 0.4 0.5];
Y = [];
Y(1,1)=0;
Y(1,2)= a^2/2;
f = @(x,y) y + x;
h = 0.1;
for i = 1:5
    Y(1,i+2) = 12/(12-5*h).*(Y(1,i+1)+h/12.*(5.*X(1,i+2)+8.*X(1,i+1)...
        +8.*Y(1,i+1)-X(1,i)-Y(1,i)))
    
    
    
end
y0 = 0
tspan = [0 0.5];
[t,y] = ode45(f, tspan, y0);

plot(t,y,'-o',X,Y,'-o')
legend({'ode45','adams moulton 2 point'},'Location','northwest','Orientation','horizontal')
a = 0.01;
b = 0.02;
c = 0.03;
X = [0 a b c 0.1 0.2 0.3 0.4 0.5];
Y = [];
Y(1,1)=0;
Y(1,2)= a^2/2;
Y(1,3)= b^2/2;
Y(1,4)= b^2/2;
f = @(x,y) y + x;
h = 0.1;
for i = 1:5
    wp = Y(1,i+3) +h/24.*(55.*f(X(1,i+3),Y(1,i+3))-59.*f(X(1,i+2),Y(1,i+2))...
        +37.*f(X(1,i+1),Y(1,i+1))-9.*f(X(1,i),Y(1,i)));
    Y(1,i+4) =  Y(1,i+3)+h/24.*(9.*f(X(1,i+4),wp)+19.*f(X(1,i+3),Y(1,i+3))...
        -5.*f(X(1,i+2),Y(1,i+2))+f(X(1,i),Y(1,i)));
    
    
    
end
y0 = 0;
tspan = [0 0.5];
[t,y] = ode45(f, tspan, y0);

plot(t,y,'-o',X,Y,'-o')
legend({'ode45','predictor corrector'},'Location','northwest','Orientation','horizontal')
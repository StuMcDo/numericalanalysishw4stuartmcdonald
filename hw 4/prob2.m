T = linspace(0,1,6);
u1 = @(t) 1/3.*exp(5.*t)-1/3.*exp(-t)+exp(2.*t);
u2 = @(t) 1/3.*exp(5.*t)+2/3.*exp(-t)+t.^2.*exp(2.*t);
U1 = u1(T);
U2 = u2(T);

f1 = @(t,w1,w2) 3.*w1+2.*w2-(2.*t.^2+1).*exp(2.*t)
f2 = @(t,w1,w2) 4.*w1+w2+(t.^2+2.*t-4).*exp(2.*t)
W1 = [];
W2 = [];
W1(1,1) = 1;
W2(1,1) = 1;
h = 0.2
for i = 1:5
    k1 = h*f1(T(1,i),W1(1,i),W2(1,i));
    l1 = h*f2(T(1,i),W1(1,i),W2(1,i));
    k2 = h*f1(T(1,i)+h/2,W1(1,i)+1/2.*k1,W2(1,i)+1/2.*l1);
    l2 = h*f2(T(1,i)+h/2,W1(1,i)+1/2.*k1,W2(1,i)+1/2.*l1);
    k3 = h*f1(T(1,i)+h/2,W1(1,i)+1/2.*k2,W2(1,i)+1/2.*l2);
    l3 = h*f2(T(1,i)+h/2,W1(1,i)+1/2.*k2,W2(1,i)+1/2.*l2);
    k4 = h*f1(T(1,i)+h,W1(1,i)+k3,W2(1,i)+l3);
    l4 = h*f2(T(1,i)+h,W1(1,i)+k3,W2(1,i)+l3);
    W1(1,i+1) = W1(1,i)+1/6*(k1+2*k2+2*k3+k4);
    W2(1,i+1) = W2(1,i)+1/6*(l1+2*l2+2*l3+l4);
end
tiledlayout(2,1) % Requires R2019b or later

% Top plot
nexttile
plot(T,U1,'-o',T,W1,'-o')
title('u1')
legend('actual solution','RK4','Location','northwest')
% Bottom plot
nexttile
plot(T,U2,'-o',T,W2,'-o')
legend('actual solution','RK4','Location','northwest')
title('u2')
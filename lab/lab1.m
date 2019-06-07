%% Lab 1
% Benjamin DalFavero
% 2 Apr 2019

%% problem 1
x = 1:10;
y = x.^2;
figure(1)
subplot(3, 2, 1)
plot(x,y)
subplot(3, 2, 2)
plot(x,y,'+')
subplot(3, 2, 3)
plot(x, y, '-', x, y, '+')
subplot(3, 2, 4)
plot(x, y, '-', x(1:2:10), y(1:2:10), '+')
subplot(3, 2, 5)
semilogy(x, y)
subplot(3, 2, 6)
loglog(x, y, '+')

%% problem 2
figure(2)
% first plot
subplot(2, 2, 1)
f = @(x) exp(-x/4) .* sin(x);
fplot(@(x) f(x), [0, 20])
grid on
xlabel('x')
ylabel('f(x)')
funcname = 'f(x) = exp(-x/4)*sin(x)';
title(funcname)
% second plot
subplot(2, 2, 2)
g = @(x) exp(-x/4);
hold on
fplot(@(x) f(x), [0, 20])
fplot(@(x) g(x), [0, 20], '--')
hold off
grid off
xlabel('x')
ylabel('y')
title(funcname)
% third plot
x = linspace(0, 20, 200);
y = f(x);
subplot(2, 2, 3)
semilogy(x, y, '+')
xlabel('x')
ylabel('f(x)')
title(funcname)

%% problem 3
figure(3)
r = @(th) sin(3 * th);
subplot(1, 2, 1)
fplot(@(x) r(x), [0, 2 * pi])
subplot(1, 2, 2)
th = linspace(0, 2*pi, 1000);
polarplot(th, r(th))
figure(4)
r = @(th) exp(cos(th)) - 2*cos(4 * th) + (sin(th / 12)).^2;
th = linspace(0, 24*pi, 
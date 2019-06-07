%% Homework 1
% Benjamin DalFavero
% 2 Apr 2019

%% Problem 1
tic
fibnum(30);
t30 = toc;
tic
fibnum(31);
t31 = toc;
% make vector of execution times
t = zeros(80);
t(30) = t30;
t(31) = t31;
for i = 32:80
    t(i) = t(i-1) + t(i-2);
end
t50 = t(50)
t80 = t(80)
%% Problem 2
type orthog_new.m
%% Problem 3
% quadratic derivative from three points
type quad_deriv.m

data = [-1 1/2 2; 1 1/4 4];
derivs = arrayfun(@(x) quad_deriv(data, x), [-1, 0, 2])
%% Problem 4
% bezier curves

% control points
x = [0, 2, -1, 1];
y = [0, 1, 1, 0];
% get coefficients from control points
cx = 3*(x(2) - x(1));
bx = 3*(x(3) - x(2)) - cx;
ax = x(4) - x(1) - cx - bx;
cy = 3*(y(2) - y(1));
by = 3*(y(3) - y(2)) - cy;
ay = y(4) - y(1) - cy - by;
% compute polynomial values
t = linspace(0, 1, 1000);
xb = polyval([ax, bx, cx, x(1)], t);
yb = polyval([ay, by, cy, y(1)], t);
% plot values
hold on
plot(x, y, '*')
plot(xb, yb)
hold off
title("Cubic Bezier curve")
xlabel("x(t)")
ylabel("y(t)")

%% Problem 5

%% Problem 6
% part a
v = [1000, 2001];
type dfact.m
[b(1), e(1)] = dfact(1000);
[b(2), e(2)] = dfact(2001);
for i = 1:2
    fprintf("%d double factorial is %g*10^%g.\n", v(i), b(i), e(i))
end
% part b
% see attached paper.
% part c
n = [10000, 314159, 6.02e23];
for i = 1:3
    [b, e] = dfact_stirling(n(i));
    fprintf("%0.0f double factorial is %g*10^%g.\n", n(i), b, e)
end


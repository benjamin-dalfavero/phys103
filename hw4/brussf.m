function [sn] = brussf(s, t, param)
% sn = brussf(s, t, param)
% sn: time derivative of state (x, y)
% s: state (x, y)
% param: parameters [A, B]

% get state variables
x = s(1);
y = s(2);
% get parameters
A = param(1);
B = param(2);
% return d/dt for state vector
dx = A + x^2*y - (B + 1)*x;
dy = B*x - x^2*y;
sn = [dx, dy];
end
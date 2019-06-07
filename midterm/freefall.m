function [ds] = freefall(s, t, param)
% [ds] = freefall(s, t, param)
% rhs of differential equation for free fall
% s = state vector [v, x]
% t = current time
% param = [m, Cd, rho, A, beta, k, L]
% ds = derivative of s

% get state variables from vector
y = s(1);
v = s(2);
% get parameters
m = param(1);
Cd = param(2);
rho = param(3);
A = param(4);
beta = param(5);
k = param(6);
L = param(7);
omega = sqrt(k / m);
g = 9.81;
% forces on jumper
Fg = -g * m;
Fd = -Cd * rho * A * norm(v) / 2 * v;
if abs(y) > 30
    x = sign(y) * (abs(y) - abs(L));
    F_cord = -2*m*beta*v - m*omega^2*x;
else
    F_cord = 0;
end
% return rhs
a = (Fg + Fd + F_cord) / m;
dv = a; % derivative of velocity
dy = v; % derivative of position
ds = [dy, dv];
end
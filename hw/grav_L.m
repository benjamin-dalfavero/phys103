function [sn] = grav_L(s, t, param)
% equations for precession problem

% parameters
GM = param(1);
Fp = param(2);
% define acceleration vector
r = [s(1), s(2)];
v = [s(3), s(4)];
e1 = [1, 0]';
m = 1;
accel = -GM/(norm(r) ^3) * r + (Fp / m) * e1;
% return derivative of state
sn = [v(1), v(2), accel(1), accel(2)];
end
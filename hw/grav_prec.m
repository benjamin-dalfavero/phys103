function [sn] = grav_prec(s, t, param)
% equations for precession problem

% parameters
GM = param(1);
alpha = param(2);
% define acceleration vector
r = [s(1), s(2)];
v = [s(3), s(4)];
accel = -GM/(norm(r) ^3) * (1 - alpha/norm(r)) * r;
% return derivative of state
sn = [v(1), v(2), accel(1), accel(2)];
end
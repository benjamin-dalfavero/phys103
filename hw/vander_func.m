function [ds] = vander_func(s, t, param)
% van der Pol equation of state s and time t
% returns ds, where ds/dt = f(s, t)
% get state variables from s
x = s(1);
y = s(2);
% find derivatives of state variables
dy = x;
dx = -y + (1-y^2)*x;
ds = [dx dy]';
end

function [hn] = tank_func(h, t, param)
% [sn] = tank_func(s, t, param)
% rhs of diff eq for problem 4
% h: current height
% t: current time
% param: vector [C, A, R]

% assign parameters from vector
C = param(1);
A = param(2);
R = param(3);
g = 9.81;
% caculate derivatives
Q = C*A*sqrt(2*g*h); % flow rate
Vh = 2*pi*R*h - pi*h^2; % dV/dt
                        
% return height
hn = -Q / Vh;
end
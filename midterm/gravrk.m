function deriv = gravrk(s,t,param)
%  Returns right-hand side of Kepler ODE; used by Runge-Kutta routines
%  Inputs
%    s      State vector [r(1) r(2) v(1) v(2)]
%    t      Time (not used)
%    GM     Parameter G*M (gravitational const. * solar mass)
%  Output
%    deriv  Derivatives [dr(1)/dt dr(2)/dt dv(1)/dt dv(2)/dt]

% get parameters
GM = param(1);
C = param(2);

%* Compute acceleration
r = [s(1) s(2)];  % Unravel the vector s into position and velocity
v = [s(3) s(4)];
Fd = -C * norm(v) * v; % acceleration from Fd is just Fd because m=1
accel = -GM*r/norm(r)^3 + Fd;  % Gravitational acceleration

%* Return derivatives [dr(1)/dt dr(2)/dt dv(1)/dt dv(2)/dt]
deriv = [v(1) v(2) accel(1) accel(2)];
return;

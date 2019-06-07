function [dx] = jump_range(v0, rho)
% find range and time for a ball.
% inputs:
%   airFlag: 0 or 1 to determine air resistance in problem
%   tau: time step

% set flag for air resistance
airFlag = 1;
% set time step
tau = 1e-3;

%* Set initial position and velocity of the baseball
y1 = 0;
r1 = [0, y1];     % Initial vector position
speed = v0; % m/s
theta = 22.5; % deg
v1 = [speed*cos(theta*pi/180), ...
      speed*sin(theta*pi/180)];     % Initial velocity
r = r1;  v = v1;  % Set initial position and velocity

%* Set physical parameters (mass, Cd, etc.)
Cd = 0.5;      % Drag coefficient (dimensionless)
area = 0.5;  % Cross-sectional area of projectile (m^2)
grav = 9.81;    % Gravitational acceleration (m/s^2)
mass = 80;   % Mass of projectile (kg)
air_const = -0.5*Cd*rho*area/mass;  % Air resistance constant

%* Loop until ball hits ground or max steps completed
maxstep = 1000;   % Maximum number of steps
for istep=1:maxstep

  %* Record position (computed and theoretical) for plotting
  xplot(istep) = r(1);   % Record trajectory for plot
  yplot(istep) = r(2);
  t = (istep-1)*tau;     % Current time
  xNoAir(istep) = r1(1) + v1(1)*t;
  yNoAir(istep) = r1(2) + v1(2)*t - 0.5*grav*t^2;
  
  %* Calculate the acceleration of the ball 
  accel = air_const*norm(v)*v;   % Air resistance
  accel(2) = accel(2)-grav;      % Gravity
  
  %* Calculate the new position and velocity using Euler method
  r = r + tau*v;                 % Euler step
  v = v + tau*accel;     
  
  %* If ball reaches ground (y<0), break out of the loop
  if( r(2) < 0 )  
    xplot(istep+1) = r(1);  % Record last values computed
	yplot(istep+1) = r(2);
    break;                  % Break out of the for loop
  end 
end

% find the range and time of flight by interpolation
% interpolate x as a function of y at yi = 0
x = xplot((length(xplot) - 2):end);
y = yplot((length(yplot) - 2):end);
dx = intrpf(0, y, x);
end
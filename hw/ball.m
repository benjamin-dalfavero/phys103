function [xplot, yplot] = ball(airFlag, tau)
%* Set initial position and velocity of the baseball
y1 = 0; % m
r1 = [0, y1];     % Initial vector position
speed = 50; % m/s
theta = 45; % deg
v1 = [speed*cos(theta*pi/180), ...
      speed*sin(theta*pi/180)];     % Initial velocity
r = r1;  v = v1;  % Set initial position and velocity

%* Set physical parameters (mass, Cd, etc.)
Cd = 0.35;      % Drag coefficient (dimensionless)
area = 4.3e-3;  % Cross-sectional area of projectile (m^2)
grav = 9.81;    % Gravitational acceleration (m/s^2)
mass = 0.145;   % Mass of projectile (kg)
if( airFlag == 0 )
  rho = 0;      % No air resistance
else
  rho = 1.2;    % Density of air (kg/m^3)
end
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
end
function [AvePeriod] = pendul(small_angle, theta0)
% AvePeriod = pendul(small_angle, tau)
% small_angle: 1 or 0, whether to use small angle approx
% tau: time step in sec
% AvePeriod: average period in sec

%* Select the numerical method to use: Euler or Verlet
NumericalMethod = 2; % use verlet

% set time step
tau = 0.05;

%* Set initial position and velocity of pendulum
theta = theta0*pi/180;   % Convert angle to radians
omega = 0;               % Set the initial velocity

%* Set the physical constants and other variables
g_over_L = 1;            % The constant g/L
time = 0;                % Initial time
irev = 0;                % Used to count number of reversals
period = []; % accumulator for period
  

%* Take one backward step to start Verlet
if small_angle == 1
    accel = -g_over_L*sin(theta);    % Gravitational acceleration
else
    accel = -g_over_L;
end
theta_old = theta - omega*tau + 0.5*tau^2*accel;    

%* Loop over desired number of steps with given time step
%    and numerical method
nstep = 5000;
for istep=1:nstep  

  %* Record angle and time for plotting
  t_plot(istep) = time;            
  th_plot(istep) = theta*180/pi;   % Convert angle to degrees
  time = time + tau;
  
  %* Compute new position and velocity using 
  %    Euler or Verlet method
  if small_angle == 0
      accel = -g_over_L*sin(theta);    % Gravitational acceleration
  else
      accel = -g_over_L * theta;
  end
  if( NumericalMethod == 1 )
    theta_old = theta;               % Save previous angle
    theta = theta + tau*omega;       % Euler method
    omega = omega + tau*accel; 
  else  
    theta_new = 2*theta - theta_old + tau^2*accel;
    theta_old = theta;			   % Verlet method
    theta = theta_new;  
  end
  
  %* Test if the pendulum has passed through theta = 0;
  %    if yes, use time to estimate period
  if( theta*theta_old < 0 )  % Test position for sign change
    fprintf('Turning point at time t= %f \n',time);
    if( irev == 0 )          % If this is the first change,
      time_old = time;       % just record the time
    else
      period(irev) = 2*(time - time_old);
      time_old = time;
    end
    irev = irev + 1;       % Increment the number of reversals
  end
end

%* Estimate period of oscillation
AvePeriod = mean(period);
end
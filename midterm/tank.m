%% Problem 4 - Tank

type tank_func

% establish constants for problem
Dt = 3; % diameters of tank and at opening
Do = 0.03;
A = pi*Do^2; % area of opening
R = Dt / 2; % radius of tank
h = 2.75; % initial height
t = 0;
C = 0.55; % discharge coefficient
param = [C, A, R]; % parameters for solver
          
% constants for numerical solution
tau = 0.0001;
tol = 1e-9;

% integrate equation with adaptive runge kutta
i = 1;
while h > 0
    hp(i) = h; % save h and t for plotting
    tp(i) = t;
    % calculate next vector
    [h, t, tau] = rka(h, t, tau, tol, 'tank_func', param); 
    i = i + 1;
    % break if negative
end

% plot solution
plot(tp, hp, '*')

tf = tp(end)
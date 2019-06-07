% problem 1 - bungee jumper

type freefall.m

% set up initial conditions
y0 = 0;
v0 = 0;
t0 = 0;
s = [y0, v0];
t = t0;

% parameters needed
tau = 0.1; % time step
m = 70; % kg
Cd = 0.5;
rho = 1.2; % kg/m^3
A = 0.5; % m
L = 30; % m, rest length of cord
beta = 0.057; % 1/sec
k = 40; % N / m
params = [m, Cd, rho, A, beta, k, L];
tf = 50; % sec

% find position vs time
steps = (tf - t0) / tau;
yff = zeros(1, steps);
tff = zeros(1, steps);
for i = 1:steps
    % add current height and time to accumulators
    yff(i) = s(1);
    tff(i) = t;
    % get new state from rk4
    s = rk4(s, t, tau, 'freefall', params);
    t = t + tau;
end

plot(tff, yff)
%% Homework 3
% Benjamin DalFavero
% 23 April 2019

%% Problem 4

% numerical solution from orbit.m
r0 = 1;
v0 = pi;
tau = 0.01;
GM = 4*pi;
m = 1;
[rplot, thplot, tplot, energy] = orbit(r0, v0, tau, 1000);


% find max radial distance
rmax = max(abs(rplot));
a = rmax / (1 + ecc);

% find theoretical radial distance

%% Problem 12

%% Problem 14

% declare constants
GM = 4*pi;
param = [GM, alpha];
% get theoretical angle and radial distance
[rplot, thplot, rplot] = orbit_prec(r0, v0, param, steps); 

%% Problem 5
% van der Pol equation
% times step values
tau = [0.0001, 0.01, 0.02, 0.05];
% initial conditions
s0 = [1, 1]';
% plot solution for each tau
hold on
for i = 1:length(tau)
    % reset accumulators
    y = [s0(1)];
    t = [s0(2)];
    % add results to accumulators for each time step
    nstep = 10 / tau(i);
    for j = 1:nstep
    end
end
hold off
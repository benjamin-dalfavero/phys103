%% problem 2
type ball_intrp.m

tau = [0.5, 0.1, 0.01]; % time step in sec
% calculate results
range = zeros(length(tau));
time = range;
disp("tau time range")
for i = 1:length(tau)
    [time(i), range(i)] = ball_intrp(0, tau(i));
    fprintf("%f %f %f\n", tau(i), time(i), range(i))
end

%% problem 3
% get different data points
[x, y, dx, dt] = ball_coef(1, 1, 0.01);
[xb, yb] = ball(1, 0.01);
[x_noair, y_noair] = ball(0, 0.01);
[x2, y2, dx_fix, dt_fix] = ball_coef(0, 1, 0.01);
% plot results
hold on
plot(x, y)
plot(xb, yb)
plot(x_noair, y_noair)
plot(x2, y2)
hold off
legend('Velocity-dependent', 'no drag', 'drag')
% range and time of flight for fixed vs dependent
disp("range and time of flight for velocity dependent drag force")
fprintf("%f %f \n", dx, dt)
disp("range and time of flight for velocity independent drag force")
fprintf("%f %f \n", dx_fix, dt_fix)

%% problem 4
% range of initial angle
thm = [5:5:175];
% approximations of period
T_sin = arrayfun(@(th) pendul(0, th), thm);
T_small = arrayfun(@(th) pendul(1, th), thm);
L = 9.8; % m
T_ellip = elli_period(L, thm);
% plot functions
hold on
    plot(thm, T_sin)
    plot(thm, T_small)
    plot(thm, T_ellip)
hold off
title("Approximations of Period")
xlabel("\theta_m (deg)")
ylabel("T (sec)")
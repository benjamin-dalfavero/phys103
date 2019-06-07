function [T] = elli_period(L_over_g, theta_m)
% elliptic apprximation of the period for small angles
T = 2*pi*sqrt(L_over_g)*(1 + (theta_m .^ 2 / 16));
end
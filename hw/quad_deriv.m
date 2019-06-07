function sigma = quad_deriv(points, x)
% find derivative of a function by second order lagrange polynomial
% inputs:
%   points: 2x3 matrix of x and y values
%   x: x point to be queried
% output: approximate value of derivative

% define x and y points
xp = points(1, :);
y = points(2, :);
% sum all terms in approxpimated derivative
sigma = 0;
for i = 1:3
    % sum xp values besides xp_i
    sigma1 = 0;
    for j = 1:3
        if j ~= i
            sigma1 = sigma1 + xp(j);
        end
    end
    % product xpi - xpj for i ~= j
    prod = 1;
    for j = 1:3
        if j ~= i
            prod = prod * (xp(i) - xp(j));
        end
    end
    % add term of derivative to sum
    num = (2*x - sigma1) * y(i);
    sigma = sigma + (num / prod);
end
end
    

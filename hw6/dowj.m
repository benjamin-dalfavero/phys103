%% extrapolating from dow jones data

% set up parameters
days = 1:5;
dja = [2470, 2510, 2410, 2350, 2240];
sigma = ones(1, 5);
x = linspace(1, 6, 1000); % points to evaluate polynomial

% put projected values into accumulator
polies = zeros(4, length(x));
for i = 1:4
	[a, sig, yy, chisqr] = pollsf(days, dja, sigma, i+1);
	polies(i, :) = polyval(a(end:-1:1), x);
end

plot(x, polies)

%% plot function
% values of x to plot
x1 = linspace(-1, 0, 150);
x2 = linspace(0, 1, 150);
x = [x1, x2];

% values of function
f1 = 3*x1.^2 + 2*x1.^3;
f2 = 3*x2.^2 - 2*x2.^3;
f = [f1, f2];

% coefficient values
a0 = 1;
n = 1:5;
a = (24 ./ (n.^4 .* pi^4)) .* ((-1).^n - 1);

% values of series expansion
% one term expansion
fn1 = a0/2 + a(1)*cos(pi * x);
% five term expansion
fn5 = a0/2;
for nn = 1:5
	term = a(nn) * cos(nn * pi * x);
	fn5 = fn5 + term;
end

% plot results
figure(1)
hold on
plot(x, f)
plot(x, fn1)
plot(x, fn5)
hold off

%% plot derivatives

%% first derivative
% actual func values
fp1_1 = 6*x1 + 6*x1.^2;
fp1_2 = 6*x2 - 6*x2.^2;
fp1 = [fp1_1, fp1_2];

% one term expansion
fd1_1 = a(1)*cos(pi * x);

% five term expansion
fd1_5 = 0;
for nn = 1:5
	term = a(nn) * sin(nn * pi * x) * (nn * pi);
	fd1_5 = fd1_5 + term;
end

% plot results
figure(2)
hold on
plot(x, f)
plot(x, fd1_1)
plot(x, fd1_5)
hold off

%% second derivative
% actual function values
fp2_1 = 6 + 12*x1;
fp2_2 = 6 - 12*x2;
fp2 = [fp2_1, fp2_2];

% one term expansion
fd2_1 = - a(1) * cos(pi * x) * (pi^2);

% five term expansion
fd2_5 = 0;
for nn = 1:5
	term = -a(nn) * cos(nn * pi * x) * (nn * pi)^2;
	fd2_5 = fd2_5 + term;
end

% plot results
figure(3)
hold on
plot(x, fp2)
plot(x, fd2_1)
plot(x, fd2_5)
hold off

%% third derivative
% actual function values
fp3_1 = 6 + 12*x1;
fp3_2 = 6 - 12*x2;
fp3 = [fp3_1, fp3_2];

% one term expansion
fd3_1 = - a(1) * cos(pi * x) * (pi^2);

% five term expansion
fd3_5 = 0;
for nn = 1:5
	term = -a(nn) * cos(nn * pi * x) * (nn * pi)^2;
	fd3_5 = fd3_5 + term;
end

% plot results
figure(4)
hold on
plot(x, fp3)
plot(x, fd3_1)
plot(x, fd3_5)
hold off

%% error
tol = 1e-3;

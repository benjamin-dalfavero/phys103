%% problem 2 - solve resistor network

%% constants
R1 = 2/3; % ohms
R2 = 10;
R3 = 2;
R4 = 9;
Rt = linspace(0, 100, 500);
V = 24; % volts
% matrix for solving Ri = v
R = [-1, 0, 0, 1, 1, 0;...
     0, 0, 1, 0, -1, 1;...
     0, 0, 2*R4, 0, 0, 1;...
     0, 0, 0, -R2, R3, 1;...
     R1, R1, 0, R2, 0, 0;];
% vector of constants
v = zeros(1, 6)';
v(6) = V;

%% solve for each value of Rt
% allocate accumulator
i_source = zeros(1, length(Rt));
for i = 1:length(Rt)
    % assign elements
    R(4, 6) = -Rt(i);
    R(5, 6) = Rt(i);
    % get vector of currents
    i = R \ v;
    % store current across V to accumulator
    i_source(i) = i(2);
end

%% plot results
%% Long Jump

% first and second ranges
dx1 = jump_range(10, 1.29);
fprintf("First range is %f m.\n", dx1)
dx2 = jump_range(10, 0.94);
fprintf("Second range is %f m.\n", dx2)

% find inital velocity for part c
v0_star = fzero(@(v) jump_range(v, 0.94) - 8.9, 10);
fprintf("Velocity for 8.9 m jump is %f m/s.\n", v0_star)

% what is range at lower altitude?
dx3 = jump_range(v0_star, 1.29);
fprintf("The range at lower altittude would be %f m.\n", dx3)
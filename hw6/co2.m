%% Rate of Change in CO2 emissions

%% load data
mauna = load('Mauna.txt');
barrow = load('Barrow.txt');

%% time step vector
t = (1:length(mauna))';

%% rates of change
% use linear regression to get trendline for each
% get fit parameters
a_mauna = polyfit(t, mauna, 1);
a_barrow = polyfit(t, barrow, 1);
% get slope (first parameter)
m_mauna = a_mauna(2) * 14 / 365;
m_barrow = a_barrow(2)* 14 / 365;
fprintf('Manua Kea: %f ppm/yr\n', m_mauna)
fprintf('Barrow: %f ppm/yr\n', m_mauna)

%% time when 10% increase is reached
lvl_m = mauna(1);
lvl_b = barrow(1);
intercept_m = a_manua(1);
intercept_b = a_barrow(1);
t_mauna = (1.1*lvl_m - intercept_m) / m_mauna;
t_barrow = (1.1*lvl_b - intercept_b) / m_barrow;
disp(t_mauna)
disp(t_barrow)

function [l] = stirling(n)
% log of factorial by stirling's approximation
poly = log10(1 + 1/(12*n) + (1/(288*n^2)));
l = log10(2*pi*n)/2 + n*log10(n) - n*log10(exp(0)) + poly;
end
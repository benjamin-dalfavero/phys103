function [b, e] = dfact(n)
% find n!!, the double factorial of n.
% inputs:
%   n: integer greater than 0
% outputs:
%   b: base of answer
%   e: exponent of answer

% find log_10 of n!!
if n == 0
    l = 0;
elseif mod(n, 2) == 0
    l = sum(log10(2:2:n));
else
    l = sum(log10(1:2:n));
end
e = floor(l);
b = 10^(l - e);
end
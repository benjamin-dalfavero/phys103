function [b, e] = dfact_stirling(n)
% double factorial by stirling's approximation
if n == 0
    b = 0;
    e = 0;
elseif mod(n, 2) == 0
    d = (n/2)*log10(n) + stirling(n/2);
    e = floor(d);
    b = 10^(d - e);
else
    % n-1!!
    [b1, e1] = dfact_stirling(n-1);
    % n!
    [l] = stirling(n);
    e2 = floor(l);
    b2 = 10^(l - e2);
    % return answer
    b = b2 / b1;
    e = e2 - e1;
end
end
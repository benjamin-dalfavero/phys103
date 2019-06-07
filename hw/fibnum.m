function f = fibnum(n)
% calculate nth fibonacci number
if n == 0
    f = 0;
elseif n == 1
    f = 1;
else
    f = fibnum(n-1) + fibnum(n-2);
end
end
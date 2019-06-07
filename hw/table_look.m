function [yq] = table_look(xq, x, y)
% yq = table_look(xq, x, y)
% find point from table lookup
%
% xq: query point
% x: x values of table
% y: y values of table
% yq: output point
if find(x == xq) ~= []
    % return value of yq
    indx = find(x == xq);
    yq = y(indx);
else
    % must interpolate
    % find three points about which to interpolate
    % find last point that is less than the speed
    indices = find(x >= xq);
    indx = indices(1) - 1; 
    if indx > (length(x) - 2) % if not three points left
        % interpolate linearly
    else
        % use intrpf()
        ii = indx:(indx+2); % indices for interpolation
        yq = intrpf(xq, x(ii), y(ii));
    end
end
end
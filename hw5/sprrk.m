function deriv = sprrk(s,t,param)
%  Returns right-hand side of 3 mass-spring system
%  equations of motion
%  Inputs
%    s       State vector [x(1) x(2) ... v(3)]
%    t       Time (not used)
%    param   (Spring constant)/(Block mass)
%  Output
%    deriv   [dx(1)/dt dx(2)/dt ... dv(3)/dt]
deriv(1) = s(5);
deriv(2) = s(6);
deriv(3) = s(7);
deriv(4) = s(8);
param2 = -2*param;
A = [-2, 1, 1, 0; 1, -3, 1, 1; 1, 1, -3, 1; 0, 1, 1, -2];
% b = [-2, -1, 1, 2]';
deriv(5:8) = (A * s(1:4)')';
return;
end

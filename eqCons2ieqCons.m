function [A,b] = eqCons2ieqCons(Aeq,beq,e)
% given Aeq*x=beq
% get the approximation ieq constraints Ax<=b

if nargin<3, e=1e-10; end

A = [Aeq; -Aeq];
temp = beq*0+e;
b = [beq+e; -beq+e];

end
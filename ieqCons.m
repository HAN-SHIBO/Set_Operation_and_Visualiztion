function [A,b] = ieqCons(A,b,Aeq,beq,e)
% given eqution constraints and inequation constrants
% get the approximation ieq constraints Ax<=b

if nargin<5, e=1e-10; end

A = [A; Aeq; -Aeq];
temp = beq*0+e;
b = [b; beq+e; -beq+e];

end
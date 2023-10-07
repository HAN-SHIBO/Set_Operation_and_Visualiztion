function [A,b,Aeq] = constraintTrans(A,b,T)
% given a set X define by X:{x|Ax<=b}
% obtain the transformed set Y=TX : {y=Tx|x in X}
% only deal with the case when T is a full rank square matrix

A = A*inv(T);        % consider x=inv(T)*y,
b = b;               % then the constraints becomes A*inv(T)<=b

end

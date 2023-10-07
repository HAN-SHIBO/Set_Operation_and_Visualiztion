function [A,b] = augConstraint(A1,b1,A2,b2)
% given x in X={A1*x<=b1}, y in Y={A2*y<=b2}
% obtain the region {x,y} = {A[x y]<=b}

A = blkdiag(A1,A2);
b = [b1; b2];


end
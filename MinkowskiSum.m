function [A,b] = MinkowskiSum(A1,b1,A2,b2)
% given two sets: X1:{x|A1*x<=b1}, X2:{A2*x<=b2}
% obtain the Minkowski sum X={x1+x2| x1 in X1, x2 in X2}

% to obtain Minkowski sum
% for any constraint in X1 : Cx<=d
% it will becomes Cx <= d+e
% where e = max Cx   s.t. x in X2
% that is, e = -1 * min -Cx   s.t. x in X2
A = [A1; A2];  b = [b1; b2];
for i = 1:sizeR(A1)
    [~,temp] = linprog( -A1(i,:), A2,b2 );
    if isempty(temp)
        temp = 0;
    end
    b(i) = b(i) - temp;
end

for i = 1:size(A2)
    [~,temp] = linprog( -A2(i,:), A1,b1 );
    if isempty(temp)
        temp = 0;
    end
    b(i+sizeR(A1)) = b(i+sizeR(A1)) - temp;
end

% delete redundant constraints
[A,b] = removeRedundantConstraints(A,b);

function [Z] = MinkowskiSumVertex(X,Y)
% given a convex hull X, each row of X represents a vertex
% given a convex hull Y, each row of Y represents a vertex
% obtain the Minkowski sum of X and Y
Z = [];

for i = 1:sizeR(X)
    for j = 1:sizeR(Y)
        Z = [Z; X(i,:)+Y(j,:)];
    end
end


Z = removeRedundantVertex(Z);

end

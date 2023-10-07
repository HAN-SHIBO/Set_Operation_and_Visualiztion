function [XY] = augConstraintVertex(X,Y)
% given a convex hull X, each row of X represents a vertex 
% given a convex hull X, each row of X represents a vertex 
% get the convex hull of [x y]
XY=[];
nx = size(X,1);
for i = 1:size(Y,1)
    XY = [XY; X kron(ones(nx,1),Y(i,:))];
end

end
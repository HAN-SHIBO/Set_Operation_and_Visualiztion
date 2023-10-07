function [figP,figL,V] = constraintVisualizationVertex(X)
%   given a convex hull X, each row of X represents a vertex
%   draw this convex hull

%%  plot the rigion
try
    DT = delaunayTriangulation(X);
    [C,V]  = convexHull(DT);
catch
    warning('******      0 volume polytope      ******')
    temp = 1+randn(sizeR(X),2)*0.0001;
    X = [X.*temp; X];
    DT = delaunayTriangulation(X);
    [C,V]  = convexHull(DT);
end
    

figP = plot(DT.Points(:,1),DT.Points(:,2),'.','MarkerSize',10);
hold on
figL = plot(DT.Points(C,1),DT.Points(C,2),'r');

end


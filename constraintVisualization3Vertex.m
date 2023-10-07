function [figF,figP,V] = constraintVisualization3Vertex(X)
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

try  % when V is small, this method may fail
    figF = plotPolyhedron(DT.Points(:,1),DT.Points(:,2),DT.Points(:,3));
catch
    figF = trisurf(C,DT.Points(:,1),DT.Points(:,2),DT.Points(:,3));
end
hold on
figP = plot3(DT.Points(:,1),DT.Points(:,2),DT.Points(:,3),'.','MarkerSize',10);


end


function [X,figP,figL,V] = constraintVisualization(Oa,Ob)
%   draw a linear constrained set R2
%   constraints is Ax<=B

X = lcon2vert(Oa,Ob);
[figP,figL,V] = constraintVisualizationVertex(X);

end


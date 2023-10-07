function [X,figF,figP,V] = constraintVisualization3(Oa,Ob)
%   draw a linear constrained set R2
%   constraints is Ax<=B

X = lcon2vert(Oa,Ob);
[figF,figP,V] = constraintVisualization3Vertex(X);

end


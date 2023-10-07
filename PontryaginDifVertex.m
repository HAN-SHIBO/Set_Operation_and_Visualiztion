function [Z] = PontryaginDifVertex(X,Y)
% given a convex hull X, each row of X represents a vertex
% given a convex hull Y, each row of Y represents a vertex
% obtain the pontryagin difference of X and Y
% X-Y:{x| x+Y in X}
% here, should use constraints expresion

[Ax,bx,Aeqx,beqx]=vert2lcon(X);
[Ay,by,Aeqy,beqy]=vert2lcon(Y);

[ta,tb] = eqCons2ieqCons(Aeqx,beqx);
Ax = [Ax; ta];  bx = [bx; tb];
[ta,tb] = eqCons2ieqCons(Aeqy,beqy);
Ay = [Ay; ta];  by = [by; tb];

[Az,bz] = PontryaginDif(Ax,bx,Ay,by);
Z = lcon2vert(Az,bz);

end
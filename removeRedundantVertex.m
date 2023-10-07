function [X] = removeRedundantVertex(X)

X = unique(X,'rows');
try
    [k,vol] = convhulln(X);  % get the number of vertex forming the new convex hull
    k = unique(k);
    X = X(k,:);
end

end
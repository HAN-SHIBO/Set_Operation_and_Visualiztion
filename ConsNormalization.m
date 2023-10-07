function [A,b] = ConsNormalization(A,b)
% for constraints   Ax <= b
% normalize it by ensure the norm of each row of A is 1

for i = 1:length(b)
    temp = norm(A(i,:));
    A(i,:) = A(i,:)/temp;
    b(i)   = b(i)/temp;
end

end
function [A,b] = removeRedundantConstraints(A,b)
% given a constrained set X={x| Ax<=b}
% remove redundant constraints and return  X={x| Ax<=b}

% remove same rows
temp = [A b];
temp = unique(temp,'rows');
A = temp(:,1:end-1);
b = temp(:,end);


% if constraint Ai*x<=bi is redundant,
% the optimal value of   max Ai*x  s.t. x in X does not increase
options = optimoptions('linprog','display','off','Algorithm','interior-point');
for i = sizeR(A):-1:1
    f = A(i,:);
    if f*f'<=10^-10   % remove zero rows
        A(i,:) = [];
        b(i,:) = [];
    else              % remove redundant rows
        [~,temp,flag]  = linprog( -A(i,:), A,b,[],[],[],[],options );
        temp = -temp;  % the maximal value of Ai*x

        % if Ai*x<=bi is redundant, temp1 does not increase
        if flag == -3    % Problem is unbounded.
            ;
        elseif temp - b(i)<=-10^(-4)  % the maximal value is less than bi
            % do not use <, because of tolerance
            A(i,:) = [];
            b(i)   = [];
        end
    end
end



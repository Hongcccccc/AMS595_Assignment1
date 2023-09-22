A = input('input a matrix A:');
b = input('input a vector b:');

GaussElim1(A,b)
%Q2.Gaussian Elimination
function x = GaussElim1(A,b)
   
    % Check if A is square (n x n) matrix
    x = size(A);
    m = x(1);
    n = x(2);
    if m ~= n
        error('Matrix A must be square.');
    end
    
    % Check if the dimensions of A and b are compatible
    if n ~= numel(b)
        error('Matrix A and vector b dimensions are not compatible.');
    end
    
    % Augment the matrix A with vector b
    Ab = [A, b];
    
    % Perform Gaussian elimination
    for k = 1:n
        % Find the pivot row
        [~, pivot_row] = max(abs(Ab(k:n, k)));
        pivot_row = pivot_row + k - 1;
        
        % Swap rows if necessary
        if pivot_row ~= k
            Ab([k, pivot_row], :) = Ab([pivot_row, k], :);
        end
        
        % Make the diagonal element 1
        Ab(k, :) = Ab(k, :) / Ab(k, k);
        
        % Eliminate non-zero elements below the pivot
        for i = k+1:n
            Ab(i, :) = Ab(i, :) - Ab(i, k) * Ab(k, :);
        end
    end
    
    % Back-substitution to find x
    x = zeros(n, 1);
    x(n) = Ab(n, n+1);
    
    for i = n-1:-1:1
        x(i) = Ab(i, n+1) - Ab(i, i+1:n) * x(i+1:n);
    end
end

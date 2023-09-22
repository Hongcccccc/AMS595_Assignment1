%Q3 Part (b): Script to create plots
addpath ./AMS595-hw1-hongcheng/
nValues = [100, 1000, 10000, 100000, 1000000]; % Adjust n values as needed
executionTimes = zeros(size(nValues));
absoluteErrors = zeros(size(nValues));

for i = 1:length(nValues)
    n = nValues(i);
    
    % Measure execution time
    tic;
    %[piApprox, absError,relError] = MontePi1(n);

    insideCircle = 0;
    for i_i = 1:n
        i_x = rand();
        i_y = rand();
        
        if i_x^2 + i_y^2 <= 1
            insideCircle = insideCircle + 1;
        end
    end
    
    piApprox = 4 * insideCircle / n
    absError = abs(pi - piApprox)
    relError = abs(pi - piApprox) / pi

    executionTimes(i) = toc;
    
    % Store absolute error
    absoluteErrors(i) = absError;
    
    % Part (b) Plot 3: Generate points and plot results for a fixed n
    if n == 10000 % Change this value as needed
        x = rand(1, n);
        y = rand(1, n);
        
        figure;
        scatter(x, y, 10, 'b', 'filled');
        hold on;
        
        % Identify points inside the circle
        insideCircle = x.^2 + y.^2 <= 1;
        scatter(x(insideCircle), y(insideCircle), 10, 'r', 'filled');
        
        axis equal;
        title(['Monte Carlo Approximation of π: n = ', num2str(n)]);
        legend('Outside Circle', 'Inside Circle');
        xlabel('X-axis');
        ylabel('Y-axis');
        fprintf('Estimated π for n = %d: %.5f\n', n, piApprox);
    end
end


% Part (b) Plot 1: Execution time vs n
figure;
plot(nValues, executionTimes, '-o');
title('Execution Time vs. n');
xlabel('n');
ylabel('Execution Time (s)');

% Part (b) Plot 2: Absolute error vs n
figure;
loglog(nValues, absoluteErrors, '-o');
title('Absolute Error vs. n (log-log)');
xlabel('n');
ylabel('Absolute Error');

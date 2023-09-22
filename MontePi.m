%Q3 Part (a): Function to estimate π using Monte Carlo method1
n = input('Enter a number for total points: ');
MontePi1(n);

function [piApprox,absError,relError] = MontePi1(n)
    insideCircle = 0;
    for i = 1:n
        x = rand();
        y = rand();
        
        if x^2 + y^2 <= 1
            insideCircle = insideCircle + 1;
        end
    end
    
    piApprox = 4 * insideCircle / n
    absError = abs(pi - piApprox)
    relError = abs(pi - piApprox) / pi
    
end

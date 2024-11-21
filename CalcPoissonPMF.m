% Function to estimate the PMF via the Parametric Approach
function poissonPMF = CalcPoissonPMF(alphaVal, maxVal)

    % The range of values from 0 to the max value
    x = 0:maxVal;

    % Calculates the Poisson PMF using the Poisson distribution formula
    poissonPMF = (exp(-alphaVal) * (alphaVal .^ x)) ./ factorial(x);

end
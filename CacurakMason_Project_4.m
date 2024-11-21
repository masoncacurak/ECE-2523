% Mason Cacurak
% 11/29/23

% Loads data into script
load ECE2523_Project_4_Data; 

% Range of values in data set (x-axis values)
x = 0:max(userData);

% Calculates mean of data for Poisson PMF
alphaVal = mean(userData);

% Calculates PMF using relative frequency approach
pmfRelFreq = CalcRelFreq(userData);

% Calculates Poisson PMF using CalcPoissonPMF function
pmfPoisson = CalcPoissonPMF(alphaVal, max(userData));

% Plots both PMFs in a bar graph
figure;
bar(x, [pmfRelFreq; pmfPoisson]');
title('Comparison of PMFs: Relative Frequency vs. Poisson Distribution');
xlabel('Number of Users Connected to Base Station');
ylabel('Probability');
legend('Relative Frequency', 'Poisson Distribution');
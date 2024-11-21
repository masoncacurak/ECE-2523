% Skee-Ball Simulation
% Mason Cacurak
% 12/4/23

% User input to specify the y-value the player is aiming for
Y = input('Enter the y-value you are aiming for: ');

% Calculate the mean (muY) based on the aim point
if (Y >= -3 && Y < -1) % 30Pt ring
    muY = -2;

elseif (Y >= 1 && Y < 3) % 40Pt ring
    muY = 2;

elseif (Y >= 6 && Y < 8) % 50Pt ring
    muY = 7;
    
else
    disp('Invalid input.');
    return;

end

% Calculate variance 
variance = abs(muY + 1)^2;

% Calculate the probability of landing in each ring using Gaussian distribution
% The formula, z = (x - muY) / sqrt(variance) is nested within the formula phi_z = ((1 + erf(z / sqrt(2))) / 2) to ultimatly get 
% phi _z  = ((1 + erf(((x - muY) / sqrt(variance)) / sqrt(2))) / 2) - ((1 + erf(((x - muY) / sqrt(variance)) / sqrt(2))) / 2);
prob10 = ((1 + erf(((-6 - muY) / sqrt(variance)) / sqrt(2))) / 2) - ((1 + erf(((-inf - muY) / sqrt(variance)) / sqrt(2))) / 2) + ...
         ((1 + erf(((6 - muY) / sqrt(variance)) / sqrt(2))) / 2) - ((1 + erf(((5 - muY) / sqrt(variance)) / sqrt(2))) / 2) + ...
         ((1 + erf(((inf - muY) / sqrt(variance)) / sqrt(2))) / 2) - ((1 + erf(((8 - muY) / sqrt(variance)) / sqrt(2))) / 2);

prob20 = ((1 + erf(((-3 - muY) / sqrt(variance)) / sqrt(2))) / 2) - ((1 + erf(((-6 - muY) / sqrt(variance)) / sqrt(2))) / 2) + ...
         ((1 + erf(((1 - muY) / sqrt(variance)) / sqrt(2))) / 2) - ((1 + erf(((-1 - muY) / sqrt(variance)) / sqrt(2))) / 2) + ...
         ((1 + erf(((5 - muY) / sqrt(variance)) / sqrt(2))) / 2) - ((1 + erf(((3 - muY) / sqrt(variance)) / sqrt(2))) / 2);

prob30 = ((1 + erf(((-1 - muY) / sqrt(variance)) / sqrt(2))) / 2) - ((1 + erf(((-3 - muY) / sqrt(variance)) / sqrt(2))) / 2);

prob40 = ((1 + erf(((3 - muY) / sqrt(variance)) / sqrt(2))) / 2) - ((1 + erf(((1 - muY) / sqrt(variance)) / sqrt(2))) / 2);

prob50 = ((1 + erf(((8 - muY) / sqrt(variance)) / sqrt(2))) / 2) - ((1 + erf(((6 - muY) / sqrt(variance)) / sqrt(2))) / 2);

% Find the expected value of points by calculating the sum of each point value * probability of getting that point
expectedVal = (10 * prob10) + (20 * prob20) + (30 * prob30) + (40 * prob40) + (50 * prob50);

% Calculate the standard deviation of points by summing the squared differences between each possible score
% and the expected value, weighted by the probabilities of landing in each corresponding point ring
stdDev = sqrt((prob10 * (10 - expectedVal)^2 + prob20 * (20 - expectedVal)^2 + ...
         prob30 * (30 - expectedVal)^2 + prob40 * (40 - expectedVal)^2 + prob50 * (50 - expectedVal)^2));

% Output results (will only print up to 4 significant figures on either side of decimal)
fprintf(1,'Probability of landing in 10Pt ring: %4.4f \n', prob10);
fprintf(1,'Probability of landing in 20Pt ring: %4.4f \n', prob20);
fprintf(1,'Probability of landing in 30Pt ring: %4.4f \n', prob30);
fprintf(1,'Probability of landing in 40Pt ring: %4.4f \n', prob40);
fprintf(1,'Probability of landing in 50Pt ring: %4.4f \n', prob50);
fprintf(1,'Expected points: %.4f\n', expectedVal);
fprintf(1,'Standard deviation of points: %.4f\n', stdDev);
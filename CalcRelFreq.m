% Function to calculate PMF via relative frequency approach
function pmf = CalcRelFreq(userData)

    % Calculates the range of possible values from 0 to the max 
    % value in the data set
    range = 0:max(userData);

    % Counts the occurrences of each value in userData
    count = hist(userData, range);

    % Calculates the relative frequency by dividing the count 
    % by the total number of observations
    pmf = count / length(userData);

end
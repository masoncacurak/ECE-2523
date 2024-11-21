% Function definition
function [outputDist] = CalcPowerDistribution(siteSurvey)

% Total number of days in which survey was conducted
numVals = length(siteSurvey); 

% Variables storing the number of days the wind farm output meets one of the 3 possible events(column 1 of the matrix) 
w1 = 0; % (i < 3MWh)
w2 = 0; % (3MWh < i < 6MWh)
w3 = 0; % (i > 6MWh)

% Variables storing the number of days the solar farm output meets one of the 3 possible events(column 2 of the matrix)
s1 = 0; % (i < 3MWh)
s2 = 0; % (3MWh < i < 6MWh)
s3 = 0; % (i > 6MWh)

% For loop with nested if, elseif, else statements that iterates through the matrix by column,
% and increments the number of the previously listed variables based off of the 3 possible events  
for i = 1: numVals
    
    % Wind farm events
    if (siteSurvey(i, 1) < 3)
        w1 = w1 + 1;

    elseif (siteSurvey(i, 1) > 3 && siteSurvey(i, 1) < 6)
        w2 = w2 + 1;

    else
        w3 = w3 + 1;

    end
    
    % Solar farm events
    if (siteSurvey(i, 2) < 3)
        s1 = s1 + 1;

    elseif (siteSurvey(i, 2) > 3 && siteSurvey(i, 2) < 6)
        s2 = s2 + 1;

    else
        s3 = s3 + 1;

    end
end

% Additional information to verify that the probability matrix is correct
disp(' ')
fprintf(1, 'Total number of days: %d\n', numVals);
disp(' ')
fprintf(1, 'Count(days) for wind farm when i < 3MWh, 3MWh < i < 6MWh, i > 6MWh: %d %d %d\n', w1, w2, w3);
fprintf(1, 'Count(days) for solar farm when i < 3MWh, 3MWh < i < 6MWh, i > 6MWh: %d %d %d\n', s1, s2, s3);
disp(' ')

% Matrix storing the number of days that each farm's output meets one of the 3 possible events
% Matrix format: Wind farm in column 1 & solar farm in column 2
outputDist = [w1 s1; w2 s2; w3 s3];

% Function that divides every element in the matrix by the total number of 
% days in order to calculate the relative frequency of each event
outputDist = outputDist / numVals;

% Prints out the probability matrix and header for each column
fprintf(1, ' Wind  Solar\n');
fprintf(1, '%.4f %.4f\n', outputDist');

end
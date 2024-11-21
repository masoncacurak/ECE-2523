function[pWin] = CalcProbWin(gData) % Function definition

numVals = length(gData); % Length of vector or "N samples"
winCount = 0; % Variable to store number of wins in the data

% For-loop iterating through the vector and incrementing the winCount
% variable everytime it iterates over a 1 to store the number of wins
for i = 1: numVals
    if (gData(i) == 1)
        winCount = winCount + 1;
    end
end

% The pWin variable stores the relative frequency that the 
% team wins by taking the wins that occured (winCount) and dividing that
% by numVal which is the number of total samples in the data
pWin = winCount / numVals;

% Print statements that print the number of times the team played,the 
% probability that the team wins each game, and a newline to seperate the 
% results for each team played 
fprintf(1, 'Number of times the team played: %d\n', numVals);
fprintf(1, 'The probability of the team winning each game is: %f\n', pWin);
disp(' ');

end






